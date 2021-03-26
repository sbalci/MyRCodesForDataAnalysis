# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //
#
#  Stanford CoreNLP example
#
# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //

# Demonstrate the use of Stanford Natural Language Processor via JavaScript.
# 
# To run the example, download Stanford CoreNLP from
# https://stanfordnlp.github.io/CoreNLP/ Set the variable
# `stanford.installation.folder` to the path of the installation folder.
#
# Note: The Stanford Parser takes a moment to load the first time. It outputs
# a message that looks like a warning when it loads. That is normal behavior.
# 
# The first few lines here are different than the paper example only in that we 
# include code to locate the required JAR files for the class path. This is
# simpler for you to run the example, especially if the CoreNLP version changes,
# but it requires more code. We chose to keep the code in the paper focused on
# the package's functionality instead of path-parsing.

# Set this path to the Stanford CoreNLP installation folder.
stanford.installation.folder <- "~/stanford-corenlp-full-2018-01-31"

# This code will locate the appropriate dependencies.
file.patterns <- paste0(
  "protobuf\\.jar|",
  "stanford-corenlp-\\d+\\.\\d+\\.\\d+\\.jar|",
  "stanford-corenlp-\\d+\\.\\d+\\.\\d+-models\\.jar"
)
class.path <- list.files(stanford.installation.folder, file.patterns)
class.path <- file.path(stanford.installation.folder, class.path)
class.path <- normalizePath(class.path, winslash = "/")

# Now we return to the paper's example verbatim.
library("jsr223")
engine <- ScriptEngine$new("JavaScript", class.path)

# Declare JavaScript function `getPartsOfSpeech`
{
  engine %@% '
    var DocumentClass = Java.type("edu.stanford.nlp.simple.Document");

    function getPartsOfSpeech(text) {
      var doc = new DocumentClass(text);
      var list = [];
      for (i = 0; i < doc.sentences().size(); i++) {
        var sentence = doc.sentences().get(i);
        var o = {
          "words":sentence.words(),
          "pos.tag":sentence.posTags(),
          "offset.begin":sentence.characterOffsetBegin(),
          "offset.end":sentence.characterOffsetEnd()
        }
        list.push(o);
      }
      return list;
    }
  '
}

engine$invokeFunction(
  "getPartsOfSpeech",
  "The jsr223 package makes Java objects easy to use. Download it from CRAN."
)

engine$terminate()


# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //
#
#  Deeplearning4j (DL4J) example
#
# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //

# This code example corresponds with "Using Java libraries with complex
# dependencies" in the paper. It demonstrates using Groovy and Deeplearning4j
# (DL4J). The large number of dependencies are acquired by Apache Maven.
# 
# This script requires 'dl4j.groovy' which can be downloaded using the following
# link. Please save the file to the same folder as 'gilbert-dahl.R'.
# 
# https://raw.githubusercontent.com/floidgilbert/jsr223/master/examples/Groovy/dl4j/dl4j.groovy
# 
# To run this section of the script, please set the current working directory to
# the folder containing this script ('gilbert-dahl.R').

library(jsr223)

# Read the class path created by the Maven command:
# mvn dependency:build-classpath -Dmdep.outputFile="jsr223.classpath"
file.name <- "jsr223.classpath"
class.path <- readChar(file.name, file.info(file.name)$size)

# Supply the class path to create a Groovy script engine.
engine <- ScriptEngine$new("groovy", class.path)

# Set a seed for reproducable results. The seed variable will also be used by
# the Groovy script.
seed <- 10
set.seed(seed)

# Split the iris data set into train and test sets. Note that each data set 
# is scaled. The labels are converted to a binary matrix.
train.idx <- sample(nrow(iris), nrow(iris) * 0.65)
train <- scale(as.matrix(iris[train.idx, 1:4]))
train.labels <- model.matrix(~ -1 + Species, iris[train.idx, ])
test <- scale(as.matrix(iris[-train.idx, 1:4]))
test.labels <- model.matrix(~ -1 + Species, iris[-train.idx, ])

# Execute the Groovy script and display the results. The Groovy script retrieves
# the data and other variables from this R script via callbacks.
result <- engine$source("dl4j.groovy")
cat(result)

engine$terminate()


# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //
#
#  JavaScript Voca example
#
# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //

engine <- ScriptEngine$new("JavaScript")
engine$source(
  "https://raw.githubusercontent.com/panzerdp/voca/master/dist/voca.min.js",
  discard.return.value = TRUE
)
engine$invokeMethod(
  "v",
  "wordWrap",
  "A long sentence to wrap using Voca methods.",
  list(width = 20)
)
engine$terminate()


# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //
#
#  rJava software review
#
# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //

# rJava demonstration taken from http://www.rforge.net/rJava --------------

# Note: the GUI window may appear in the background.
library("rJava")
.jinit()
f <- .jnew("java/awt/Frame", "Hello")
b <- .jnew("java/awt/Button", "OK")
.jcall(f, "Ljava/awt/Component;", "add", .jcast(b, "java/awt/Component"))
.jcall(f, , "pack")
# Show the window.
.jcall(f, , "setVisible", TRUE)
# Close the window.
.jcall(f, , "dispose")


# rJava demonstration reproduced in JavaScript and jsr223 -----------------

library(jsr223)
engine <- ScriptEngine$new("JavaScript")

# Execute code inline to create and show the window.
engine %@% "
  var f = new java.awt.Frame('Hello');
  f.add(new java.awt.Button('OK'));
  f.pack();
  f.setVisible(true);
"

# Close the window
engine %@% "f.dispose();"


# rJava data exchange -----------------------------------------------------

a <- matrix(rnorm(10), 5, 2)
# Copy matrix to a Java object with rJava
o <- .jarray(a, dispatch = TRUE)
# Convert it back to an R matrix.
b <- .jevalArray(o, simplify = TRUE)
identical(a, b)


# jsr223 data exchange ----------------------------------------------------

a <- matrix(rnorm(10), 5, 2)
# Copy an R object to Java using jsr223.
engine$a <- a
# Retrieve the object.
engine$a
identical(a, engine$a)
engine$terminate()


# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //
#
#  rGroovy software review
#
# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //

# Typical rGroovy approach ------------------------------------------------

# Class paths must set in the global option GROOVY_JARS before
# loading the rGroovy package.
class.path <- normalizePath("lib/groovy-all-2.4.7.jar", winslash = "/")
options(GROOVY_JARS = list(class.path))
library("rGroovy")

# rGroovy uses rJava API by default. A bindings object must be created for the
# bindings available to the Groovy script engine.
bindings <- rJava::.jnew("groovy/lang/Binding")
Initialize(bindings)
myValue <- rJava::.jarray(1:3)
myValue <- rJava::.jcast(myValue, "java/lang/Object")
rJava::.jcall(bindings, "V", method = "setVariable", "myValue", myValue)

# Finally, Groovy code can be executed using the Evaluate method; it returns the
# value of the last statement, if any. In this example, we modify the last
# element of our myValue array, and return the contents of the array.
Evaluate(groovyScript = "myValue[2] = 5; myValue;")


# Foregoing code reproduced by jsr223 -------------------------------------

library("jsr223")
engine <- ScriptEngine$new("Groovy", "lib/groovy-all-2.4.7.jar")
engine$myValue <- 1:3
engine %~% "myValue[2] = 5; myValue"
engine$terminate()


# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //
#
#  JavaScript integrations software review
#
# /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// //

# Demonstrate that JSON data exchange loses precision ---------------------

# jsonlite is used by V8 as well as many other packages.
library("jsonlite")
# `digits = NA` requests maximum precision.
identical(pi, fromJSON(toJSON(pi, digits = NA)))


# Demonstrate that jsr223 data exchange preserves precision ---------------

library("jsr223")
engine <- ScriptEngine$new("JavaScript")
engine$pi <- pi
identical(engine$pi, pi)
engine$terminate()

