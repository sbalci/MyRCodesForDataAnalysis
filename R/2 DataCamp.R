ctr <-1

while(ctr<=7) {
    print(paste("ctr is set to ", ctr))
}

while(ctr<=7) {
    print(paste("ctr is set to ", ctr))
    ctr <- ctr + 1
}


# Load the ggplot2 package
library(ggplot2)

install.packages("ggplot2")

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()
ctr


ctr <-1


while(ctr<=7) {
    if(ctr %% 5 == 0) {
        break
    }
       print(paste("ctr is set to ", ctr))
    ctr <- ctr + 1
}

ctr



# Initialize the speed variable
speed <- 64

# Code the while loop
while ( speed > 30 ) {
    print(speed)
    print("Slow down!")  
    speed <- speed - 7  
}

# Print out the speed variable
speed


# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
    print(paste("Your speed is",speed))
    if (speed > 48 ) {
        print("Slow down big time!")
        speed <- speed - 11
    } else {
        print("Slow down!")
        speed <- speed - 6
    }
}



# Initialize the speed variable
speed <- 88

while (speed > 30) {
    print(paste("Your speed is", speed))
    
    # Break the while loop when speed exceeds 80
    if ( speed > 80 ) {
        break
    }
    
    if (speed > 48) {
        print("Slow down big time!")
        speed <- speed - 11
    } else {
        print("Slow down!")
        speed <- speed - 6
    }
}


# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
    print(3*i)
    if ( (3*i)%%8 == 0 ) {
        break
    }
    i <- i + 1
}



cities <- c("New York", "Paris",
            "London", "Tokyo",
            "Rio de Janeiro", "Cape Town")

for(city in cities) {
    print(city)
}

for(i in cities) {
    print(i)
}

cities <- list("New York", "Paris",
               "London", "Tokyo",
               "Rio de Janeiro", "Cape Town")

for(city in cities) {
    print(city)
}


for(city in cities) {
    if(nchar(city) == 6) {
        break
    }
    print(city)
}

for(city in cities) {
    if(nchar(city) == 6) {
        next
    }
    print(city)
}

for(i in 1:length(cities)) {
    print(city)
}

cities <- c("New York", "Paris",
            "London", "Tokyo",
            "Rio de Janeiro", "Cape Town")

for(i in 1:length(cities)) {
    print(cities[i])
}

for(i in 1:length(cities)) {
    print(paste(cities[i], "is on position",
                i, "in the cities vector."))
}






# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for (views in linkedin) {
    print(views)
}









# Loop version 2
for (i in 1:length(linkedin)) {
    print (linkedin[i])  
}


# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (elements in nyc) {
    print(elements)
}



# Loop version 2
for (i in 1:length(nyc)) {
    print(nyc[[i]])
}


# The tic-tac-toe matrix ttt has already been defined for you

# define the double for loop
for (i in 1:nrow(ttt)) {
    for (j in 1:ncol(ttt)) {
        print(paste("on row", i, "and column",j, "the board contains", ttt[i,j]))
    }
}



# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
    if (li > 10 ) {
        print("You're popular!")    
    } else {
        print("Be more visible!")
    }
    print(li)
}


# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Extend the for loop
for (li in linkedin) {
    if (li > 10) {
        print("You're popular!")
    } else {
        print("Be more visible!")
    }
    
    # Add if statement with break
    if (li > 16) {
        print("This is ridiculous, I'm outta here!")
        break
    }
    
    # Add if statement with next
    if (li <5) {
        print("This is too embarrassing!")
        next
    }
    
    print(li)
}


# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
    if (char=="r") {
        rcount <- rcount + 1
    }
    if (char == "u") {
        break
    }
}

# Print out rcount
print(rcount)


help(sample)
?sample
args(sample)


triple <- function(x) {
    3*x
}

triple(4)
triple(x=5)
triple(y=6)

triple <- function(x) {
    y <- 3 * x
    return(y)
}

triple(56)

math_magic <- function(a,b) {
    a*b + a/b
}

math_magic(3)
math_magic(3,5)

math_magic <- function(a,b=1) {
    a*b + a/b
}

math_magic(3)
math_magic(3,2)

math_magic <- function(a,b=1) {
    if (b==0) {
        return("second value cannot be zero")
    }
    a*b + a/b
}

math_magic(3)
math_magic(3,0)


throw_dice <- function() {
    number <- sample(1:6, size = 1)
    number
}

throw_dice()



# Define the function hello()
hello <- function() {
    print("Hi there!")
    TRUE
}


# Call the function hello()
hello()

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
    y <- x ^ 2
    if (print_info == TRUE) {
        print(paste(x, "to the power two equals", y))
    }
    return(y)
}


pow_two <- function(x) {
    y <- x ^ 2
    return(y)
}
pow_two(4)
y
x

# The linkedin and facebook vectors have already been created for you

# Define the interpret function
interpret <- function(num_views) {
    if (num_views > 15) {
        print("You're popular!")
        num_views
    } else {
        print("Try to be more visible!")
        0
        
    }
}

# Call the interpret function twice
interpret(linkedin[1])
interpret(facebook[2])


# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
    if (num_views > 15) {
        print("You're popular!")
        return(num_views)
    } else {
        print("Try to be more visible!")
        return(0)
    }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum = TRUE) {
    count <- 0
    for (v in views) {
        count <- count + interpret(v)
    }
    if (return_sum == TRUE) {
        return(count)
    } else {
        return (NULL)
    }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)
interpret_all(facebook)



install.packages("ggvis")
search()
library("ggvis")
search()


library(data.table)
require(rjson)

library("data.table")
require(rjson)

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)


# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
    x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x) {
    x[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(x) {x[1]})

# Transform: use anonymous function inside lapply

years <- lapply(split_low, function(x) {x[2]} )


multiply <- function(x, factor) {
    x * factor
}
lapply(list(1,2,3), multiply, factor = 3)

# Generic select function
select_el <- function(x, index) {
    x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, 1)
years <- lapply(split_low, select_el, 2)


lapply(list(1, "a", TRUE), str)
str(TRUE)


sapply(list(runif (10), runif (10)), 
       function(x) c(min = min(x), mean = mean(x), max = max(x)))


?grepl

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl("edu", emails)

# Use grep() to match for "edu", save result to hits
hits <- grep("edu", emails)

# Subset emails using hits
emails[hits]

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl("@.*\\.edu$", emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep("@.*\\.edu$", emails)

# Subset emails using hits
emails[hits]

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "global@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use sub() to convert the email domains to .edu
sub("@.*\\.edu$", "@.edu", emails)


awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)


# Get the current date: today
today <- Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now <- Sys.time()

# See what now looks like under the hood
unclass(now)


as.Date("1982-01-13")
as.Date("Jan-13-82", format = "%b-%d-%y")
as.Date("13 January, 1982", format = "%d %B, %Y")

as.Date("1982-01-13")
as.Date("Oca-13-82", format = "%b-%d-%y")
as.Date("13 Ocak, 1982", format = "%d %B, %Y")

today <- Sys.Date()
format(Sys.Date(), format = "%d %B, %Y")
format(Sys.Date(), format = "Today is a %A!")

today <- Sys.Date()
format(Sys.Date(), format = "%d %B, %Y")
format(Sys.Date(), format = "Bugün günlerden %A!")

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format= "%Y-%m-%d")
date3 <- as.Date(str3, format="%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

?strptime

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2, format="%Y-%m-%d %H:%M:%S")

# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")


# day1, day2, day3, day4 and day5 are already available in the workspace

# Difference between last and first pizza day
day5-day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)


now <- Sys.time()
now + 3600        # add an hour
now - 3600*24     # subtract a day

birth <- as.POSIXct("1879-03-14 14:37:23")
death <- as.POSIXct("1955-04-18 03:47:12")
einstein <- death - birth
einstein



# me, other_199, and previous_4 are available in your workspace

# Merge me and other_199: my_class
my_class <- c(me, other_199)

# cbind() my_class and previous_4: last_5
last_5 <- cbind(my_class, previous_4)

# Name last_5 appropriately
nms <- paste0("year_", 1:5)

colnames(last_5) <- nms



# me, my_class and last_5 are available in your workspace

# Build histogram of my_class
hist(my_class)

# Generate summary of last_5
summary(last_5)

# Build boxplot of last_5
boxplot(last_5)


# me, my_class and last_5 are preloaded

# Is your grade equal to 72?
me == 72

# Which grades in your class are higher than 75?
my_class>75

# Which grades in the last 5 years are below or equal to 64?
last_5<=64

# me, my_class and last_5 are preloaded

# How many grades in your class are higher than 75?
sum(my_class>75)

# How many students in your class scored strictly higher than you?
sum(my_class>me)

# What's the proportion of grades below or equal to 64 in the last 5 years?
mean(last_5<=64)


vec <- c(2, 3, 5, 7, 11, 13)

# Option 1
for (el in vec) {
    print(el)
}

# Option 2
for (i in 1:length(vec)) {
    print(vec[i])
}

# Make the printout conditional: only if success
for (log in logs) {
    if(log$success == TRUE){
        print(log$timestamp)
    }
}

# logs is available in your workspace

# Intialize empty list: failures
failures <- list()

# Finish the for loop: add each failure to failures
for (log in logs) {
    if (log$success == FALSE) {
        failures <- c(failures, list(log))
    }
}

# Display the structure of failures
str(failures)




# logs is available in your workspace

# for loop to extract timestamp; put this inside function body below
info <- c()
for (log in logs) {
    info <- c(info, log$timestamp)
}

# Build a function extract_info(): use for loop, add return statement
extract_info <- function(x) {
    info <- c()
    for (log in x) {
        info <- c(info, log$timestamp)
    }
    return(info)
}

# Call extract_info() on logs
extract_info(logs)



# logs is available in your workspace

# Adapt the extract_info() function.
extract_info <- function(x, property) {
    info <- c()
    for (log in x) {
        info <- c(info, log[[property]])
    }
    return(info)
}

# Call extract_info() on logs, set property to "timestamp"
extract_info(logs, property="timestamp")

# Call extract_info() on logs, set property to "success"
extract_info(logs, property="success")

# logs is available in your workspace

# Adapt extract_info():
# - add argument with default value
# - change function body
extract_info <- function(x, property = "success", include_all=TRUE) {
    info <- c()
    for (log in x) {
        if (include_all == TRUE || !log$success) {
            info <- c(info, log[[property]])
        }
    }
    return(info)
}

# Call extract_info() on logs, no additional arguments
extract_info(logs)

# Call extract_info() on logs, set include_all to FALSE
extract_info(logs, include_all=FALSE)



x <- list(a = 1, b = list(r = 2, s = 3))
x[[c("b", "r")]]

# logs is available in your workspace

# Defition of the extract_info() function
extract_info <- function(x, property = "success", include_all = TRUE) {
    info <- c()
    for (log in x) {
        if (include_all || !log$success) {
            info <- c(info, log[[property]])
        }
    }
    return(info)
}

# Generate vector of messages
extract_info(logs, property = c("details", "message"))

# Generate vector of locations for failed log entries
extract_info(logs, property = c("details", "location"), include_all = FALSE)


# logs is available in your workspace

# Write the function compute_fail_pct
compute_fail_pct <- function (x) {
    a <- 0
    for (i in 1:length(x)) {
        if (x[[i]]$success == FALSE) {
            a <- a+1
        }
    }
    return((a/length(x)) *100)
}



# Call compute_fail_pct on logs
compute_fail_pct(logs)


x <- list("R", "is", "awesome")
lapply(x, nchar)

a <- list(3, 2, 5)
lapply(a, function(x) { 2 * x })

x <- list(a = 1, b = 2, c = 3)
x[["a"]]
`[[`(x, "a")

lapply(x, `[[`, 1)

# Replace the anonymous function with `[[` 
lapply(logs, `[[`, "timestamp")


?grepl

# Extract the name column from titanic
pass_names <- titanic$Name

# Create the logical vectror is_man
is_man <- grepl(", Mr\\.", pass_names)

# Count the number of men
sum(is_man)

# Count number of men based on gender
sum(titanic$Sex == "male")

# Extract the name column from titanic
pass_names <- titanic$Name

# Create titles
titles <- gsub("^.*, (.*?)\\..*$", "\\1", pass_names)

# Call unique() on titles
unique(titles)

pass_names <- titanic$Name
titles <- paste(",", c("Mr\\.", "Master", "Don", "Rev", "Dr\\.", "Major", "Sir", "Col", "Capt", "Jonkheer"))

# Finish the vapply() command
hits <- vapply(titles,
               FUN = grepl,
               FUN.VALUE = logical(length(pass_names)),
               pass_names)

# Calculate the sum() of hits
sum(hits)

# Count number of men based on gender
sum(titanic$Sex == "male")

gsub("(a|b|c)", "_\\1_", "all cool brother")


# pass_names is available in your workspace

convert_name <- function(name) {
    # women: take name from inside parentheses
    if (grepl("\\(.*?\\)", name)) {
        gsub("^.*?\\((.*?)\\)$", "\\1", name)
        # men: take name before comma and after title
    } else {
        # Finish the gsub() function
        gsub("^(.*?),\\s[a-zA-Z\\.]*?\\s(.*?)$", "\\2 \\1", name)
    }
}

# Call convert_name on name
clean_pass_names <- vapply(pass_names, FUN = convert_name,
                           FUN.VALUE = character(1), USE.NAMES = FALSE)

# Print out clean_pass_names
clean_pass_names


## https://regex101.com

?regex
?grepl

grepl("\\d{3,}", x)


?strptime


# titanic, dob1 and dob2 are preloaded
dob1d <- as.Date(dob1)
dob2d <- as.Date(dob2, format = "%B %d, %Y")
birth_dates <- c(dob1d, dob2d)
disaster_date <- as.Date("1912-04-15")

# Add birth_dates to titanic (column Birth)
titanic <- cbind(titanic, Birth=birth_dates)

# Create subset: survivors
survivors <- subset(titanic, Survived == 1)

# Calculate average age of survivors
mean(disaster_date-survivors$Birth, na.rm=TRUE)



# Finish the read.delim() call
hotdogs <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories", "sodium"))

# Select the hot dog with the least calories: lily
lily <- hotdogs[which.min(hotdogs$calories), ]

# Select the observation with the most sodium: tom
tom <- hotdogs[which.max(hotdogs$sodium), ]

# Print lily and tom
lily; tom

install.packages("readr")
library(readr)
dir()

install.packages("data.table")
library(data.table)

potatoes <- fread("potatoes.csv")

fread("path/to/file.txt", drop = 2:4)
fread("path/to/file.txt", select = c(1, 5))
fread("path/to/file.txt", drop = c("b", "c", "d"))
fread("path/to/file.txt", select = c("a", "e"))
      
install.packages("readxl")
library(readxl)

# Print out the names of both spreadsheets
excel_sheets("urbanpop.xlsx")

data <- read_excel("data.xlsx", sheet = "my_sheet")

pop_1 <- read_excel("urbanpop.xlsx", sheet = 1)


y_workbook <- lapply(excel_sheets("data.xlsx"),
                     read_excel,
                     path = "data.xlsx")


?read_excel

# The readxl package is already loaded

# Import the the first Excel sheet of urbanpop_nonames.xlsx (R gives names): pop_a
pop_a <- read_excel("urbanpop_nonames.xlsx", col_names=FALSE, sheet=1)

# Import the the first Excel sheet of urbanpop_nonames.xlsx (specify col_names): pop_b
cols <- c("country", paste0("year_", 1960:1966))
pop_b <- read_excel("urbanpop_nonames.xlsx", sheet=1, col_names=cols)


# Print the summary of pop_a
summary(pop_a)

# Print the summary of pop_b
summary(pop_b)

# The readxl package is already loaded

# Import the the first Excel sheet of urbanpop_nonames.xlsx (R gives names): pop_a
pop_a <- read_excel("urbanpop_nonames.xlsx", col_names=FALSE, sheet=1)

# Import the the first Excel sheet of urbanpop_nonames.xlsx (specify col_names): pop_b
cols <- c("country", paste0("year_", 1960:1966))
pop_b <- read_excel("urbanpop_nonames.xlsx", sheet=1, col_names=cols)


# Print the summary of pop_a
summary(pop_a)

# Print the summary of pop_b
summary(pop_b)


read_excel("data.xlsx", skip = 15)


# The readxl package is already loaded

# Import the second sheet of urbanpop.xlsx, skipping the first 21 rows: urbanpop_sel
urbanpop_sel <- read_excel("urbanpop.xlsx", sheet=2, skip=21, col_names=FALSE)

# Print out the first observation from urbanpop_sel
urbanpop_sel[1,]

install.packages("gdata")
library(gdata)

# Load the gdata package
library(gdata)

# Import the second sheet of urbanpop.xls: urban_pop
urban_pop <- read.xls("urbanpop.xls", sheet="1967-1974")

# Print the first 11 observations using head()
head(urban_pop, n=11)

# The gdata package is alreaded loaded

# Column names for urban_pop
columns <- c("country", paste0("year_", 1967:1974))

# Finish the read.xls call
urban_pop <- read.xls("urbanpop.xls", sheet = 2,
                      skip = 50, header = FALSE, stringsAsFactors = FALSE,
                      col.names = columns)

# Print first 10 observation of urban_pop
head(urban_pop, n=10)

# Add code to import data from all three sheets in urbanpop.xls
path <- "urbanpop.xls"
urban_sheet1 <- read.xls(path, sheet = 1, stringsAsFactors = FALSE)
urban_sheet2 <- read.xls(path, sheet = 2, stringsAsFactors = FALSE)
urban_sheet3 <- read.xls(path, sheet = 3, stringsAsFactors = FALSE)

# Extend the cbind() call to include urban_sheet3: urban
urban <- cbind(urban_sheet1, urban_sheet2[-1], urban_sheet3[-1])

# Remove all rows with NAs from urban: urban_clean
urban_clean <- na.omit(urban)

# Print out a summary of urban_clean
summary(urban_clean)


install.packages("XLConnect")
library(XLConnect)
install.packages("rJava", type="source")
library(rJava)
install.packages("XLConnectJars", type="source")
install.packages("XLConnect", type="source")


# Build connection to urbanpop.xlsx: my_book
my_book <- loadWorkbook("urbanpop.xlsx")

# Print out the class of my_book
class(my_book)

# List the sheets in my_book
getSheets(my_book)

# Import the second sheet in my_book
readWorksheet(my_book, sheet = "1967-1974")

my_book <- loadWorkbook("urbanpop.xlsx")
sheets <- getSheets(my_book)
all <- lapply(sheets, readWorksheet, object = my_book)
str(all)


# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("urbanpop.xlsx")

# Import columns 3, 4, and 5 from second sheet in my_book: urbanpop_sel
urbanpop_sel <- readWorksheet(my_book, sheet = 2, startCol = 3, endCol = 5)

# Import first column from second sheet in my_book: countries
countries <- readWorksheet(my_book, sheet=2, endCol = 1)

# cbind() urbanpop_sel and countries together: selection
selection <- cbind(countries, urbanpop_sel)



# Add a worksheet to my_book, named "data_summary"
createSheet(my_book, "data_summary")

# Use getSheets() on my_book
getSheets(my_book)


# Add a worksheet to my_book, named "data_summary"
createSheet(my_book, "data_summary")

# Create data frame: summ
sheets <- getSheets(my_book)[1:3]
dims <- sapply(sheets, function(x) dim(readWorksheet(my_book, sheet = x)), USE.NAMES = FALSE)
summ <- data.frame(sheets = sheets,
                   nrows = dims[1, ],
                   ncols = dims[2, ])

# Add data in summ to "data_summary" sheet
writeWorksheet(my_book, sheet = "data_summary", summ)

# Save workbook as summary.xlsx
saveWorkbook(my_book, "summary.xlsx")

# Rename "data_summary" sheet to "summary"
renameSheet(my_book, "data_summary", "summary")

# Print out sheets of my_book
getSheets(my_book)

# Save workbook to "renamed.xlsx"
saveWorkbook(my_book, "renamed.xlsx")

# Build connection to renamed.xlsx: my_book
my_book <- loadWorkbook("renamed.xlsx")

# Remove the fourth sheet
removeSheet(my_book, "summary")

# Save workbook to "clean.xlsx"
saveWorkbook(my_book, "clean.xlsx")

install.packages("RMySQL")
library(DBI)

con <- dbConnect(RMySQL::MySQL(),
                 dbname = "company",
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                 port = 3306,
                 user = "student",
                 password = "")

class(con)

dbListTables(con)
dbReadTable(con, "employees")
dbDisconnect(con)
con

# Get table names
table_names <- dbListTables(con)

# Import all tables
tables <- lapply(table_names, dbReadTable, conn = con)

# Print out tables
tables


# Connect to the database
library(DBI)
con <- dbConnect(RMySQL::MySQL(),
                 dbname = "tweater",
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                 port = 3306,
                 user = "student",
                 password = "")

# Import tweat_id column of comments where user_id is 1: elisabeth
elisabeth <- dbGetQuery(con, "SELECT tweat_id FROM comments WHERE user_id = 1")

# Print elisabeth
elisabeth

# Import post column of tweats where date is higher than '2015-09-21': latest
latest <- dbGetQuery(con, "SELECT post FROM tweats WHERE date > '2015-09-21'")

# Print latest
latest

# Create data frame specific
specific <- dbGetQuery(con, "SELECT message FROM comments WHERE tweat_id = 77 AND user_id > 4")

# Print specific
specific


# Create data frame short
short <- dbGetQuery(con, "SELECT id, name FROM users WHERE CHAR_LENGTH(name) <5")

# Print short
short

dbGetQuery(con, "SELECT name, post, users.id
  FROM users INNER JOIN tweats on users.id = user_id
           WHERE date > '2015-09-19'")

dbGetQuery(con, "SELECT post, message
  FROM tweats INNER JOIN comments on tweats.id = tweat_id
           WHERE tweat_id = 77")

# Connect to the database
library(DBI)
con <- dbConnect(RMySQL::MySQL(),
                 dbname = "tweater",
                 host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                 port = 3306,
                 user = "student",
                 password = "")

# Send query to the database
res <- dbSendQuery(con, "SELECT * FROM comments WHERE user_id > 4")
res
# Use dbFetch() twice
dbFetch(res, n=2)
dbFetch(res)

# Clear res
dbClearResult(res)

# Create the data frame  long_tweats
long_tweats <- dbGetQuery(con, "SELECT post, date FROM tweats WHERE CHAR_LENGTH(post) > 40")

# Print long_tweats
print(long_tweats)

# Disconnect from the database
dbDisconnect(con)


# Load the readr package
library(readr)

# Import the csv file: pools
url_csv <-"http://s3.amazonaws.com/assets..com/production/course_1478/datasets/swimming_pools.csv"
pools <- read_csv(url_csv)

# Import the txt file: potatoes
url_delim <- "http://s3.amazonaws.com/assets..com/production/course_1478/datasets/potatoes.txt"
potatoes <- read_tsv(url_delim)

# Print pools and potatoes
pools
potatoes


# https URL to the swimming_pools csv file.
url_csv <- "https://s3.amazonaws.com/assets..com/production/course_1478/datasets/swimming_pools.csv"

# Import the file using read.csv(): pools1
pools1 <- read.csv(url_csv)

# Load the readr package
library(readr)

# Import the file using read_csv(): pools2
pools2 <- read_csv(url_csv)

# Print the structure of pools1 and pools2
str(pools1)
str(pools2)


# Load the readxl and gdata package
library(readxl)
library(gdata)

# Specification of url: url_xls
url_xls <- "http://s3.amazonaws.com/assets..com/production/course_1478/datasets/latitude.xls"

# Import the .xls file with gdata: excel_gdata
excel_gdata <- read.xls(url_xls)

# Download file behind URL, name it local_latitude.xls
download.file(url_xls, "local_latitude.xls")

# Import the local .xls file with readxl: excel_readxl
excel_readxl <- read_excel("local_latitude.xls")


# https URL to the wine RData file.
url_rdata <- "https://s3.amazonaws.com/assets..com/production/course_1478/datasets/wine.RData"

# Download the wine file to your working directory
download.file(url_rdata, "wine_local.RData")

# Load the wine data into your workspace using load()
load("wine_local.RData")

# Print out the summary of the wine data
summary(wine)


# Load the httr package
library(httr)

# Get the url, save response to resp
url <- "http://www.example.com/"
resp <- GET(url)

# Print resp
resp

# Get the raw content of resp: raw_content
raw_content <- content(resp, as="raw")

# Print the head of raw_content
head(raw_content)

# httr is already loaded

# Get the url
url <- "http://www.omdbapi.com/?apikey=ff21610b&t=Annie+Hall&y=&plot=short&r=json"
resp <- GET(url)

# Print resp
resp

# Print content of resp as text
content(resp, as="text")

# Print content of resp
content(resp)

# Load the jsonlite package
library(jsonlite)

# wine_json is a JSON
wine_json <- '{"name":"Chateau Migraine", "year":1997, "alcohol_pct":12.4, "color":"red", "awarded":false}'

# Convert wine_json into a list: wine
wine <- fromJSON(wine_json)

# Print structure of wine
str(wine)

# jsonlite is preloaded

# Definition of quandl_url
quandl_url <- "http://www.quandl.com/api/v1/datasets/IWS/INTERNET_INDIA.json?auth_token=i83asDsiWUUyfoypkgMz"

# Import Quandl data: quandl_data
quandl_data <- fromJSON(quandl_url)

# Print structure of quandl_data
str(quandl_data)


# The package jsonlite is already loaded

# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?apikey=ff21610b&i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)

# Print out the Title element of both lists
sw4$Title; sw3$Title


# Is the release year of sw4 later than sw3?
sw4$Year > sw3$Year

# jsonlite is already loaded

# Challenge 1
json1 <- '[1, 2, 3, 4, 5, 6]'
fromJSON(json1)

# Challenge 2
json2 <- '{"a": [1, 2, 3], "b":[4, 5, 6]}'
fromJSON(json2)

# jsonlite is already loaded

# Challenge 1
json1 <- '[[1, 2], [3, 4]]'
fromJSON(json1)

# Challenge 2
json2 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}, {"a": 5, "b": 6}]'
fromJSON(json2)

# jsonlite is already loaded

# URL pointing to the .csv file
url_csv <- "http://s3.amazonaws.com/assets..com/production/course_1478/datasets/water.csv"

# Import the .csv file located at url_csv
water <- read.csv(url_csv, stringsAsFactors=FALSE)

# Convert the data file according to the requirements
water_json <- toJSON(water)

# Print out water_json
water_json

# jsonlite is already loaded

# Convert mtcars to a pretty JSON: pretty_json
pretty_json <- toJSON(mtcars, pretty= TRUE)

# Print pretty_json
pretty_json

# Minify pretty_json: mini_json
mini_json <- minify(pretty_json)

# Print mini_json
mini_json

install.packages("haven")
library(haven)

# Load the haven package
library(haven)

# Import sales.sas7bdat: sales
sales <- read_sas("http://s3.amazonaws.com/assets..com/production/course_1478/datasets/sales.sas7bdat")

# Display the structure of sales
str(sales)



# haven is already loaded

# Import the data from the URL: sugar
sugar <- read_dta("http://assets..com/production/course_1478/datasets/trade.dta")

# Structure of sugar
str(sugar)

# Convert values in Date column to dates
sugar$Date <- as.Date(as_factor(sugar$Date))

# Structure of sugar again
str(sugar)


# haven is already loaded

# Import person.sav: traits
traits <- read_sav("http://s3.amazonaws.com/assets..com/production/course_1478/datasets/person.sav")

# Summarize traits
summary(traits)

# Print out a subset
subset(traits, traits$Extroversion>40 & traits$Agreeableness>40)


# haven is already loaded

# Import SPSS data from the URL: work
work <- read_sav("http://s3.amazonaws.com/assets..com/production/course_1478/datasets/employee.sav")

# Display summary of work$GENDER
summary(work$GENDER)
View(work)

# Convert work$GENDER to a factor
work$GENDER <- as_factor(work$GENDER)


# Display summary of work$GENDER again
summary(work$GENDER)

?as_factor

summary(work)

install.packages("foreign")
library(foreign)

# Load the foreign package
library(foreign)

# Import florida.dta and name the resulting data frame florida
florida <- read.dta("http://s3.amazonaws.com/assets..com/production/course_1478/datasets/florida.dta")

# Check tail() of florida
tail(florida)



# foreign is already loaded

# Specify the file path using file.path(): path
path <- file.path("worldbank/edequality.dta")
path <- "http://s3.amazonaws.com/assets..com/production/course_1478/datasets/edequality.dta"
# Create and print structure of edu_equal_1
edu_equal_1 <- read.dta(path)
edu_equal_1

# Create and print structure of edu_equal_2
edu_equal_2 <- read.dta(path, convert.factors = FALSE)
edu_equal_2

# Create and print structure of edu_equal_3
edu_equal_3 <- read.dta(path, convert.underscore = TRUE)
edu_equal_3

nrow(subset(edu_equal_1, age > 40 & literate == "yes"))
nrow(subset(edu_equal_1, ethnicity_head == "Bulgaria" & income > 1000))



# foreign is already loaded

# Import international.sav as a data frame: demo
demo <- read.spss("http://s3.amazonaws.com/assets..com/production/course_1478/datasets/international.sav", to.data.frame = TRUE)
View(demo)

# Create boxplot of gdp variable of demo
boxplot(demo$gdp)

cor(demo$gdp, demo$f_illit)

# Import international.sav as demo_1
demo_1 <- read.spss("http://s3.amazonaws.com/assets..com/production/course_1478/datasets/international.sav", to.data.frame = TRUE)

# Print out the head of demo_1
head(demo_1)
View(demo_1)
# Import international.sav as demo_2
demo_2 <- read.spss("http://s3.amazonaws.com/assets..com/production/course_1478/datasets/international.sav", to.data.frame = TRUE, use.value.labels = FALSE)

# Print out the head of demo_2
head(demo_2)
View(demo_2)

library(datasets)
?`datasets-package`
library(help = "datasets")


library(dplyr)
glimpse(demo)
str(demo)

# Check the class of bmi
class(bmi)

# Check the dimensions of bmi
dim(bmi)

# View the column names of bmi
names(bmi)

# Check the structure of bmi
str(bmi)

# Load dplyr
library(dplyr)

# Check the structure of bmi, the dplyr way
glimpse(bmi)

# View a summary of bmi
summary(bmi)

# Print bmi to the console
bmi

# View the first 6 rows
head(bmi)

# View the first 15 rows
head(bmi, n = 15)

# View the last 6 rows
tail(bmi)

# View the last 10 rows
tail(bmi, n = 10)


# Histogram of BMIs from 2008
hist(bmi$Y2008)

# Scatter plot comparing BMIs from 1980 to those from 2008
plot(bmi$Y1980, bmi$Y2008)


gather(wide_df, my_key, my_val, -col)

# Apply gather() to bmi and save the result as bmi_long
bmi_long <- gather(bmi, year, bmi_val, -Country)

# View the first 20 rows of the result
head(bmi_long, n=20)

spread(long_df, my_key, my_val)



# Apply spread() to bmi_long
bmi_wide <- spread(bmi_long, year, bmi_val)

# View the head of bmi_wide
head(bmi_wide)


separate(treatments, year_mo, c("year", "month"))



# Apply separate() to bmi_cc
bmi_cc_clean <- separate(bmi_cc, col = Country_ISO, into = c("Country", "ISO"), sep = "/")

# Print the head of the result
head(bmi_cc_clean)


unite(treatments, year_mo, year, month)

# Apply unite() to bmi_cc_clean
bmi_cc <- unite(bmi_cc_clean, Country_ISO, Country, ISO, sep = "-")

# View the head of the result
head(bmi_cc)


## tidyr and dplyr are already loaded for you

# View the head of census
head(census)

# Gather the month columns
census2 <- gather(census, month, amount, -YEAR)

# Arrange rows by YEAR using dplyr's arrange
census2 <- arrange(census2, YEAR)

# View first 20 rows of census2
head(census2, n = 20)


# 
# pets
# owner type num
# 1    Jason  dog   2
# 2    Jason  cat   4
# 3    Jason bird   3
# 4     Lisa  dog   7
# 5     Lisa  cat  10
# 6     Lisa bird   9
# 7 Terrence  dog   8
# 8 Terrence  cat   5
# 9 Terrence bird   1
# > spread(pets, type, num)
# owner bird cat dog
# 1    Jason    3   4   2
# 2     Lisa    9  10   7
# 3 Terrence    1   5   8
# 

# > head(census_long3)
# yr_month     HIGH      LOW    MED
# 1 1992_APR 157623.9 146174.1 148082
# 2 1992_AUG 152280.8 149368.9 151064
# 3 1992_DEC 162142.4 146701.6 155504
# 4 1992_FEB 150315.3 139097.8 147270
# 5 1992_JAN 148180.5 138283.1 146913
# 6 1992_JUL 160292.5 145347.8 150809
# > census_long4 <- seperate(census_long3, yr_month, into=c("year", "month"))
# Error: could not find function "seperate"
# > census_long4 <- separate(census_long3, yr_month, into=c("year", "month"))
# > head(census_long4, n = 6)
# year month     HIGH      LOW    MED
# 1 1992   APR 157623.9 146174.1 148082
# 2 1992   AUG 152280.8 149368.9 151064
# 3 1992   DEC 162142.4 146701.6 155504
# 4 1992   FEB 150315.3 139097.8 147270
# 5 1992   JAN 148180.5 138283.1 146913
# 6 1992   JUL 160292.5 145347.8 150809



# Make this evaluate to character
class("true")

# Make this evaluate to numeric
class(8484.00)

# Make this evaluate to integer
class(99L)

# Make this evaluate to factor
class(factor("factor"))

# Make this evaluate to logical
class(FALSE)


# Preview students2 with str()
str(students2)

# Load the lubridate package
library(lubridate)

# Parse as date
dmy("17 Sep 2015")

# Parse as date and time (with no seconds!)
mdy_hm("July 15, 2012 12:56")

# Coerce dob to a date (with no time)
students2$dob <- ymd(students2$dob)

# Coerce nurse_visit to a date and time
students2$nurse_visit <- ymd_hms(students2$nurse_visit)

# Look at students2 once more with str()
str(students2)

library(stringr)

str_trim("  this is a test     ")

str_pad("24493", width = 7, side = "left", pad = "0")

# Load the stringr package
library(stringr)

# Trim all leading and trailing whitespace
str_trim(c("   Filip ", "Nick  ", " Jonathan"))

# Pad these strings with leading zeros
str_pad(c("23485W", "8823453Q", "994Z"), width = 9, side = "left", pad = 0)

# Print state abbreviations
states

# Make states all uppercase and save result to states_upper
states_upper <- toupper(states)

# Make states_upper all lowercase again
tolower(states_upper)

## stringr has been loaded for you

# Look at the head of students2
head(students2)

# Detect all dates of birth (dob) in 1997
str_detect(students2$dob, "1997")

# In the sex column, replace "F" with "Female"...
students2$sex <- str_replace(students2$sex, "F", "Female")

# ...And "M" with "Male"
students2$sex <- str_replace(students2$sex, "M", "Male")

# View the head of students2
head(students2)


# Call is.na() on the full social_df to spot all NAs
is.na(social_df)

# Use the any() function to ask whether there are any NAs in the data
any(is.na(social_df))

# View a summary() of the dataset
summary(social_df)

# Call table() on the status column
table(social_df$status)


## The stringr package is preloaded

# Replace all empty strings in status with NA
social_df$status[social_df$status == ""] <- NA

# Print social_df to the console
social_df

# Use complete.cases() to see which rows have no missing values
complete.cases(social_df)

# Use na.omit() to remove all rows with any missing values
na.omit(social_df)


# Look at a summary() of students3
summary(students3)

# View a histogram of the age variable
hist(students3$age)

# View a histogram of the absences variable
hist(students3$absences)

# View a histogram of absences, but force zeros to be bucketed to the right of zero
hist(students3$absences, right = FALSE)


# View a boxplot of age
boxplot(students3$age)

# View a boxplot of absences
boxplot(students3$absences)


# Verify that weather is a data.frame
class(weather)

# Check the dimensions
dim(weather)

# View the column names
names(weather)


# View the structure of the data
str(weather)

# Load dplyr package
library(dplyr)

# Look at the structure using dplyr's glimpse()
glimpse(weather)

# View a summary of the data
summary(weather)


# View first 6 rows
head(weather)

# View first 15 rows
head(weather, n = 15)

# View the last 6 rows
tail(weather)

# View the last 10 rows
tail(weather, n = 10)


x <- c(50.1121, 26.3434, 36.2124)
round(x, digits = 2)


x <- Sys.time()
class(x)
x <- Sys.Date()
class(x)


# 
# > df
# subject age        t1         t2         t3
# 1       X  34 0.6753014 -0.7438284  0.2333987
# 2       Y  88 0.3588532  0.9038673 -0.5104356
# 3       Z  35 0.3971684  0.7129142  1.3817088
# > gather(df, time, val, t1:t3)
# subject age time        val
# 1       X  34   t1  0.6753014
# 2       Y  88   t1  0.3588532
# 3       Z  35   t1  0.3971684
# 4       X  34   t2 -0.7438284
# 5       Y  88   t2  0.9038673
# 6       Z  35   t2  0.7129142
# 7       X  34   t3  0.2333987
# 8       Y  88   t3 -0.5104356
# 9       Z  35   t3  1.3817088


# > df2
# subject age time        val
# 1       X  34   t1  0.6753014
# 2       Y  88   t1  0.3588532
# 3       Z  35   t1  0.3971684
# 4       X  34   t2 -0.7438284
# 5       Y  88   t2  0.9038673
# 6       Z  35   t2  0.7129142
# 7       X  34   t3  0.2333987
# 8       Y  88   t3 -0.5104356
# 9       Z  35   t3  1.3817088
# > spread(df2, time, val)
# subject age        t1         t2         t3
# 1       X  34 0.6753014 -0.7438284  0.2333987
# 2       Y  88 0.3588532  0.9038673 -0.5104356
# 3       Z  35 0.3971684  0.7129142  1.3817088


## tidyr and dplyr are already loaded

# Load the stringr and lubridate packages
library(stringr)
library(lubridate)

# Remove X's from day column
weather3$day <- str_replace(weather3$day, "X", "")

# Unite the year, month, and day columns
weather4 <- unite(weather3, date, year, month, day, sep = "-")

# Convert date column to proper date format using lubridates's ymd()
weather4$date <- ymd(weather4$date)

# Rearrange columns using dplyr's select()
weather5 <- select(weather4, date, Events, CloudCover:WindDirDegrees)

# View the head of weather5
head(weather5)


as.numeric(c(4, 6.44, "some string", 222))

weather5$PrecipitationIn <- as.numeric(weather5$PrecipitationIn)


## The dplyr and stringr packages are already loaded

# Replace T with 0 (T = trace)
weather5$PrecipitationIn <- str_replace(weather5$PrecipitationIn, "T", 0)

# Convert characters to numerics
weather6 <- mutate_each(weather5, funs(as.numeric), CloudCover:WindDirDegrees)

# Look at result
str(weather6)

# Count missing values
sum(is.na(weather6))

# Find missing values
summary(weather6)

# Find indices of NAs in Max.Gust.SpeedMPH
ind <- which(is.na(weather6$Max.Gust.SpeedMPH))

# Look at the full rows for records missing Max.Gust.SpeedMPH
weather6[ind, ]


# Review distributions for all variables
summary(weather6)

# Find row with Max.Humidity of 1000
ind <- which(weather6$Max.Humidity == 1000)

# Look at the data for that day
weather6[ind, ]

# Change 1000 to 100
weather6$Max.Humidity[ind] <- 100


# Look at summary of Mean.VisibilityMiles
summary(weather6$Mean.VisibilityMiles)

# Get index of row with -1 value
ind <- which(weather6$Mean.VisibilityMiles == -1)

# Look at full row
weather6[ind, ]

# Set Mean.VisibilityMiles to the appropriate value
weather6$Mean.VisibilityMiles[ind] <- 10

# Clean up column names
names(weather6) <- new_colnames

# Replace empty cells in events column
weather6$events[weather6$events == ""] <- c("None") 

# Print the first 6 rows of weather6
weather6[1:6, ]

# Look at structure of sales
str(sales)

# View a summary of sales
summary(sales)

# Load dplyr
library(dplyr)

# Get a glimpse of sales
glimpse(sales)

my_df[1:5, ] # First 5 rows of my_df
my_df[, 4]   # Fourth column of my_df

my_df[-(1:5), ] # Omit first 5 rows of my_df
my_df[, -4]     # Omit fourth column of my_df

## sales2 is available in your workspace

# Define a vector of column indices: keep
keep <- c(5:30)

# Subset sales2 using keep: sales3
sales3 <- sales2[ , keep]

# Define an issues vector
issues <- c(2516, 3863, 4082, 4183)

# Print values of sales_ord_create_dttm at these indices
sales3$sales_ord_create_dttm[issues]

# Print a well-behaved value of sales_ord_create_dttm
sales3$sales_ord_create_dttm[2517]

## stringr is loaded

# Find date columns (don't change)
date_cols <- str_detect(names(sales5), "dt")

# Create logical vectors indicating missing values (don't change)
missing <- lapply(sales5[, date_cols], is.na)

# Create a numerical vector that counts missing values: num_missing
num_missing <- sapply(missing, sum)

# Print num_missing
num_missing


## tidyr is loaded

# Combine the venue_city and venue_state columns
sales6 <- unite(sales5, venue_city_state, venue_city, venue_state, sep=", ")

# View the head of sales6
head(sales6)


# http://s3.amazonaws.com/assets..com/production/course_1294/datasets/mbta.xlsx

# Load readxl
library(readxl)

# Import mbta.xlsx and skip first row: mbta
mbta <- read_excel("mbta.xlsx", skip = 1)

# Remove rows 1, 7, and 11 of mbta: mbta2
mbta2 <- mbta[-c(1,7,11),]

# Remove the first column of mbta2: mbta3
mbta3 <- mbta2[, -1]

## mbta3 is pre-loaded

# Load tidyr
library(tidyr)

# Gather columns of mbta3: mbta4
mbta4 <- gather(mbta3, month, thou_riders, -mode)

# View the head of mbta4
head(mbta4)

## mbta4 is pre-loaded

# Coerce thou_riders to numeric
mbta4$thou_riders <- as.numeric(mbta4$thou_riders)

## tidyr is pre-loaded

# Spread the contents of mbta4: mbta5
mbta5 <- spread(mbta4, mode, thou_riders)

# View the head of mbta5
head(mbta5)


## tidyr and mbta5 are pre-loaded

# View the head of mbta5
head(mbta5)

# Split month column into month and year: mbta6
mbta6 <- separate(mbta5, month, c("year", "month"), sep = "-")

# View the head of mbta6
head(mbta6)


# Find the row number of the incorrect value: i
i <- which(mbta6$Boat>20)

# Replace the incorrect value with 4
mbta6$Boat[3] <- 4

# Generate a histogram of Boat column
hist(mbta6$Boat)

# Look at Boat and Trackless Trolley ridership over time (don't change)
ggplot(mbta_boat, aes(x = month, y = thou_riders, col = mode)) +  geom_point() + 
    scale_x_discrete(name = "Month", breaks = c(200701, 200801, 200901, 201001, 201101)) + 
    scale_y_continuous(name = "Avg Weekday Ridership (thousands)")

# Look at all T ridership over time (don't change)
ggplot(mbta_all, aes(x = month, y = thou_riders, col = mode)) + geom_point() + 
    scale_x_discrete(name = "Month", breaks = c(200701, 200801, 200901, 201001, 201101)) +  
    scale_y_continuous(name = "Avg Weekday Ridership (thousands)")



# Load data.table
library(data.table)

# Import food.csv: food
food <- fread("food.csv")

# Convert food to a data frame
food <- data.frame(food)



my_df[, -3] # Omit third column


## stringr and food3 are pre-loaded

# Create vector of column indices: nutrition
nutrition <- str_detect(colnames(food3), "100g")

# View a summary of nutrition columns
summary(food3[nutrition])


# Find indices of sugar NA values: missing
missing <- is.na(food3$sugars_100g)

# Replace NA values with 0
food3$sugars_100g[missing] <- 0

# Create first histogram
hist(food3$sugars_100g, breaks = 100)

# Create food4
food4 <- food3[food3$sugars_100g != 0 , ]

# Create second histogram
hist(food4$sugars_100g)


## stringr is loaded

# Find entries containing "plasti": plastic
plastic <- str_detect(food3$packaging_tags, "plasti")

# Print the sum of plastic
sum(plastic)



# http://s3.amazonaws.com/assets..com/production/course_1294/datasets/attendance.xls

# Load the gdata package
library(gdata)

# Import the spreadsheet: att
att <- read.xls("attendance.xls")
att <- read.xls("http://s3.amazonaws.com/assets..com/production/course_1294/datasets/attendance.xls")

View(att)
# Print the column names 
colnames(att)

# Print the first 6 rows
head(att)

# Print the last 6 rows
tail(att)

# Print the structure
str(att)

# Create remove
remove <- c(3, 56:59)

# Create att2
att2 <- att[-remove, ]

View(att2)

# Create remove
remove <- c(3, 5, 7, 9, 11, 13, 15, 17)

# Create att3
att3 <- att2[, -remove]

View(att3)

## att3 is pre-loaded

# Subset just elementary schools: att_elem
att_elem <- att3[,c(1,6,7)]

View(att_elem)

# Subset just secondary schools: att_sec
att_sec <- att3[,c(1,8,9)]

View(att_sec)

# Subset all schools: att4
att4 <- att3[,c(1:5)]

View(att4)

# Define cnames vector (don't change)
cnames <- c("state", "avg_attend_pct", "avg_hr_per_day","avg_day_per_yr", "avg_hr_per_yr")

# Assign column names of att4
colnames(att4) <- cnames

# Remove first two rows of att4: att5
att5 <- att4[-c(1,2),]

# View the names of att5
names(att5)

View(att5)

## stringr and att5 are pre-loaded
library(stringr)
# Remove all periods in state column
att5$state <- str_replace_all(att5$state, "\\.","")

# Remove white space around state names
att5$state <- str_trim(att5$state)

# View the head of att5
head(att5)

View(att5)

# Change columns to numeric using dplyr (don't change)
library(dplyr)
example <- mutate_each(att5, funs(as.numeric), -state)
View(example)

# Define vector containing numerical columns: cols
cols <- c(2:5)

# Use sapply to coerce cols to numeric
att5[, cols] <- sapply(att5[,cols], as.numeric)

View(att5)

# Load the dplyr package
library(dplyr)

# Load the hflights package
library(hflights)

# Call both head() and summary() on hflights
head(hflights)
summary(hflights)



random_words <- c("JJbc7", "drt#7S", "bBb2c")
sub(pattern = "[a-z][0-9]", replacement = "X", x = random_words)

dim(hflights)

hflights2 <- tbl_df(hflights)
hflights2
glimpse(hflights2)

as.data.frame(hflights2)

# Both the dplyr and hflights packages are loaded

# Convert the hflights data.frame into a hflights tbl
hflights <- tbl_df(hflights)

# Display the hflights tbl
hflights

# Create the object carriers
carriers <- hflights$UniqueCarrier

class(hflights)
head(hflights)

two <- c("AA", "AS")
lut <- c("AA" = "American", 
         "AS" = "Alaska", 
         "B6" = "JetBlue")
two <- lut[two]
two


# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental",    "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways",  "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier",  "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]

# Glimpse at hflights
glimpse(hflights)

unique(hflights$CancellationCode)

# The hflights tbl you built in the previous exercise is available in the workspace.

# The lookup table
lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

# Add the Code column
hflights$Code <- lut[hflights$CancellationCode]

# Glimpse at hflights
glimpse(hflights)

# hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl with the four columns of hflights related to delay
select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)

# Print out the columns Origin up to Cancelled of hflights
select(hflights, Origin:Cancelled)

# Answer to last question: be concise!
select(hflights, -(5:11))



# dplyr comes with a set of helper functions that can help you select groups of variables inside a select() call:
#     
#     starts_with("X"): every name that starts with "X",
# ends_with("X"): every name that ends with "X",
# contains("X"): every name that contains "X",
# matches("X"): every name that matches "X", where "X" can be a regular expression,
# num_range("x", 1:5): the variables named x01, x02, x03, x04 and x05,
# one_of(x): every name that appears in x, which should be a character vector.


# As usual, hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl containing just ArrDelay and DepDelay
select(hflights, ArrDelay, DepDelay)

# Print out a tbl as described in the second instruction, using both helper functions and variable names
select(hflights, UniqueCarrier, ends_with("Num"), starts_with("Cancell"))

# Print out a tbl as described in the third instruction, using only helper functions.
select(hflights, ends_with("Time"), ends_with("Delay"))


# both hflights and dplyr are available

# Finish select call so that ex1d matches ex1r
ex1r <- hflights[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- select(hflights, starts_with("Tax"), Distance)

# Finish select call so that ex2d matches ex2r
ex2r <- hflights[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- select(hflights, 1:2, 4:6)

# Finish select call so that ex3d matches ex3r
ex3r <- hflights[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- select(hflights, starts_with("T"))



# hflights and dplyr are loaded and ready to serve you.

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to g1. Save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3 <- mutate(g2, AverageSpeed = Distance / AirTime * 60)

# Print out g3
g3


# hflights and dplyr are ready, are you?

# Add a second variable loss_ratio to the dataset: m1
m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_ratio = loss / DepDelay)

# Add the three variables as described in the third instruction: m2
m2 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut, ActualGroundTime = ActualElapsedTime - AirTime, Diff = TotalTaxi - ActualGroundTime)

sum(m2$Diff, na.rm = TRUE)


# R comes with a set of logical operators that you can use inside filter():
#     
#     x < y, TRUE if x is less than y
# x <= y, TRUE if x is less than or equal to y
# x == y, TRUE if x equals y
# x != y, TRUE if x does not equal y
# x >= y, TRUE if x is greater than or equal to y
# x > y, TRUE if x is greater than y
# x %in% c(a, b, c), TRUE if x is in the vector c(a, b, c)
# 
# The following example filters df such that only the observations for which a is positive, are kept:
#     
#     filter(df, a > 0)



# hflights is at your disposal as a tbl, with clean carrier names

# All flights that traveled 3000 miles or more
filter(hflights, Distance > 3000)

# All flights flown by one of JetBlue, Southwest, or Delta
filter(hflights, UniqueCarrier %in% c("JetBlue", "Southwest", "Delta"))

# All flights where taxiing took longer than flying
filter(hflights, TaxiIn+TaxiOut > AirTime)

filter(df, a > 0 & b > 0)
filter(df, a > 0, b > 0)

filter(df, !is.na(x))

# hflights is at your service as a tbl!

# All flights that departed before 5am or arrived after 10pm
filter(hflights, DepTime <500 | ArrTime >2200)

# All flights that departed late but arrived ahead of schedule
filter(hflights, DepDelay > 0 & ArrDelay <0)

# All flights that were cancelled after being delayed
filter(hflights, DepDelay >0, Cancelled == 1)


# hflights is already available in the workspace

# Select the flights that had JFK as their destination: c1
c1 <- filter(hflights, Dest == "JFK")

# Combine the Year, Month and DayofMonth variables to create a Date column: c2
c2 <- mutate(c1, Date = paste(Year, Month, DayofMonth, sep ="-"))

# Print out a selection of columns of c2
select(c2, Date, DepTime, ArrTime, TailNum)

filter(hflights, DayOfWeek %in% c(6,7), Distance >1000, TaxiIn+TaxiOut <15)


# dplyr and the hflights tbl are available

# Definition of dtc
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
arrange(dtc, DepDelay)

# Arrange dtc so that cancellation reasons are grouped
arrange(dtc, CancellationCode)

# Arrange dtc according to carrier and departure delays

arrange(dtc, UniqueCarrier, DepDelay)


# dplyr and the hflights tbl are available

# Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, DepDelay+ArrDelay)


# hflights and dplyr are loaded in the workspace

# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist = min(Distance), max_dist= max(Distance))

# Print out a summary with variable max_div
summarise(filter(hflights, Diverted == 1), max_div=max(Distance))


# You can use any function you like in summarise() so long as the function can take a vector of data and return a single number. R contains many aggregating functions, as dplyr calls them:
#     
#     min(x) - minimum value of vector x.
# max(x) - maximum value of vector x.
# mean(x) - mean value of vector x.
# median(x) - median value of vector x.
# quantile(x, p) - pth quantile of vector x.
# sd(x) - standard deviation of vector x.
# var(x) - variance of vector x.
# IQR(x) - Inter Quartile Range (IQR) of vector x.
# diff(range(x)) - total range of vector x.

# hflights is available

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(select(temp1, ArrDelay), earliest = min(ArrDelay), average = mean(ArrDelay), latest = max(ArrDelay), sd= sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn), !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarise()
summarise(temp2, max_taxi_diff = max(abs(TaxiIn - TaxiOut)))


# 
# first(x) - The first element of vector x.
# last(x) - The last element of vector x.
# nth(x, n) - The nth element of vector x.
# n() - The number of rows in the data.frame or group of observations that summarise() describes.
# n_distinct(x) - The number of unique values in vector x.

# hflights is available with full names for the carriers

# Generate summarizing statistics for hflights
summarise(hflights,
          n_obs = n(),
          n_carrier = n_distinct(UniqueCarrier),
          n_dest = n_distinct(Dest))

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa 
summarise(aa,
          n_flights=n(),
          n_canc= sum(Cancelled == 1),
          avg_delay = mean(ArrDelay, na.rm = TRUE))


hflights %>%
    mutate(diff = TaxiOut - TaxiIn) %>%
    filter(!is.na(diff)) %>%
    summarise (avg = mean(diff))


hflights %>%
    mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime *60) %>%
    filter(!is.na(mph), mph <70) %>%
    summarise (n_less = n(),
               n_dest = n_distinct(Dest),
               min_dist = min(Distance),
               max_dist = max(Distance))


hflights %>%
    mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
    filter(mph <105 | Cancelled == 1 | Diverted ==1) %>%
    summarise (n_non= n(),
               n_dest = n_distinct(Dest),
               min_dist = min(Distance),
               max_dist = max(Distance)
    )

hflights %>%
    filter(!is.na(DepTime), !is.na(ArrTime), DepTime > ArrTime) %>%
    summarise(num=n())


hflights %>%
    group_by(UniqueCarrier) %>%
    summarise(p_canc = sum(Cancelled == 1) * 100,
              avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
    arrange(avg_delay, p_canc)


hflights %>%
    group_by(UniqueCarrier) %>%
    summarise(p_canc = mean(Cancelled == 1) * 100,
              avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
    arrange(avg_delay, p_canc)


rank(c(21, 22, 24, 23))

hflights %>%
    filter(!is.na(ArrDelay), ArrDelay > 0) %>%
    group_by(UniqueCarrier) %>%
    summarise(avg = mean(ArrDelay))%>%
    mutate(rank= rank(avg)) %>%
    arrange(rank)


# dplyr and hflights (with translated carrier names) are pre-loaded

# How many airplanes only flew to one destination?
hflights %>%
    group_by(TailNum) %>%
    summarise(dest = n_distinct(Dest)) %>%
    filter(dest == 1) %>%
    summarise(nplanes = n())

# Find the most visited destination for each carrier
hflights %>%
    group_by(UniqueCarrier, Dest) %>%
    summarise(n=n()) %>%
    mutate(rank = rank(desc(n))) %>%
    filter(rank == 1)


library(data.table)
hflights2 <- as.data.table(hflights)

hflights2 %>%
    summarise(n_carrier = n_distinct(UniqueCarrier))


# Set up a connection to the mysql database
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "")

# Reference a table within that source: nycflights
nycflights <- tbl(my_db, "dplyr")

# glimpse at nycflights
glimpse(nycflights)

# Ordered, grouped summary of nycflights
nycflights %>%
    group_by(carrier) %>%
    summarise(n_flights = n(), avg_delay = mean(arr_delay))%>%
    arrange(avg_delay)


# Complete the code to join artists to bands
bands2 <- left_join(bands, artists, by = c("first", "last"))

# Examine the results
bands2


# Finish the code below to recreate bands3 with a right join
bands2 <- left_join(bands, artists, by = c("first", "last"))
bands3 <- right_join(artists, bands, by = c("first", "last"))

# Check that bands3 is equal to bands2
setequal(bands2, bands3)

# Join albums to songs using inner_join()
inner_join(songs, albums, by = "album")

# Join bands to artists using full_join()
full_join(artists, bands, by = c("first", "last"))


# Find guitarists in bands dataset (don't change)
temp <- left_join(bands, artists, by = c("first", "last"))
temp <- filter(temp, instrument == "Guitar")
select(temp, first, last, band)

# Reproduce code above using pipes
bands%>% 
    left_join (artists, by = c("first", "last"))%>%
    filter(instrument == "Guitar")%>%
    select(first, last, band)

# Examine the contents of the goal dataset
goal

# Create goal2 using full_join() and inner_join() 
goal2 <- artists %>%
    full_join(bands, by= c("first", "last")) %>%
    inner_join(songs, by= c("first", "last"))


# Check that goal and goal2 are the same
setequal(goal, goal2)

# Create one table that combines all information
artists %>%
    full_join(bands, by = c("first", "last")) %>%
    full_join(songs, by = c("first", "last")) %>%
    full_join(albums, by = c("album", "band"))

# View the output of semi_join()
artists %>% 
    semi_join(songs, by = c("first", "last"))

# Create the same result
artists %>% 
    right_join(songs, by = c("first", "last")) %>% 
    filter(!is.na(instrument)) %>% 
    select(first, last, instrument)


albums %>% 
    # Collect the albums made by a band
    semi_join(bands, by ="band") %>% 
    # Count the albums made by a band
    nrow()

tracks %>% semi_join(
    matches,
    by = c("band", "year", "first")
)

tracks %>% filter(
    (band == "The Beatles" & 
         year == 1964 & first == "Paul") |
        (band == "The Beatles" & 
             year == 1965 & first == "John") |
        (band == "Simon and Garfunkel" & 
             year == 1966 & first == "Paul")
)


# Return rows of artists that don't have bands info
artists %>% 
    anti_join(bands, by=c("first", "last"))


# Check whether album names in labels are mis-entered
labels %>% 
    anti_join(albums, by="album")


# Determine which key joins labels and songs
labels
songs

# Check your understanding
songs %>% 
    # Find the rows of songs that match a row in labels
    semi_join(labels, by="album") %>% 
    # Number of matches between labels and songs
    nrow()


aerosmith %>% 
    # Create the new dataset using a set operation
    union(greatest_hits) %>% 
    # Count the total number of songs
    nrow()


# Create the new dataset using a set operation
aerosmith %>% 
    intersect(greatest_hits)

# Select the song names from live
live_songs <- live %>% select(song)

# Select the song names from greatest_hits
greatest_songs <- greatest_hits %>% select(song)

# Create the new dataset using a set operation
live_songs %>% 
    setdiff(greatest_songs)


# Select songs from live and greatest_hits
live_songs <- live %>% select(song)
greatest_songs <- greatest_hits %>% select(song) 

# Return the songs that only exist in one dataset
all_songs <- union(live_songs, greatest_songs)
common_songs <- intersect(live_songs, greatest_songs)
setdiff(all_songs, common_songs)

# Check if same order: definitive and complete
identical(definitive, complete)

# Check if any order: definitive and complete
setequal(definitive, complete)

# Songs in definitive but not complete
setdiff(definitive, complete)


# Songs in complete but not definitive
setdiff(complete, definitive)


# Return songs in definitive that are not in complete
definitive %>% 
    anti_join(complete)

# Return songs in complete that are not in definitive
complete %>% 
    anti_join(definitive)


# Check if same order: definitive and union of complete and soundtrack
identical(definitive, union(complete, soundtrack))



# Check if any order: definitive and union of complete and soundtrack
setequal(definitive, union(complete, soundtrack))



# Examine side_one and side_two
side_one
side_two

# Bind side_one and side_two into a single dataset
side_one %>% 
    bind_rows(side_two)


# Examine discography and jimi
discography
jimi

jimi %>% 
    # Bind jimi into a single data frame
    bind_rows(.id = "album") %>% 
    # Make a complete data frame
    left_join(discography)


# Examine hank_years and hank_charts
hank_years
hank_charts

hank_years %>% 
    # Reorder hank_years alphabetically by song title
    arrange(song) %>% 
    # Select just the year column
    select(year) %>% 
    # Bind the year column
    bind_cols(hank_charts) %>% 
    # Arrange the finished dataset
    arrange(year, song)


# Make combined data frame using data_frame()
data_frame(year = hank_year, song = hank_song, peak = hank_peak) %>% 
    # Extract songs where peak equals 1
    filter(peak == 1)


# Examine the contents of hank
hank

# Convert the hank list into a data frame
as_data_frame(hank) %>% 
    # Extract songs where peak equals 1
    filter(peak == 1)

# Examine the contents of michael
michael

bind_rows(michael, .id="album") %>% 
    group_by(album) %>% 
    mutate(rank = min_rank(peak)) %>% 
    filter(rank == 1) %>% 
    select(-rank, -peak)


seventies %>% 
    # Coerce seventies$year into a useful numeric
    mutate(year = as.numeric(as.character(year))) %>% 
    # Bind the updated version of seventies to sixties
    bind_rows(sixties) %>% 
    arrange(year)

# Examine the result of joining singers to two_songs
two_songs %>% inner_join(singers, by = "movie")

# Remove NA's from key before joining
two_songs %>% 
    filter(!is.na(movie)) %>% 
    inner_join(singers, by = "movie")


movie_years %>% 
    # Left join movie_studios to movie_years
    left_join(movie_studios, by= "movie") %>% 
    # Rename the columns: artist and studio
    rename(artist=name.x, studio=name.y)


# Identify the key column
elvis_songs
elvis_movies

elvis_movies %>% 
    # Left join elvis_songs to elvis_movies by this column
    left_join(elvis_songs, by=c("name"="movie")) %>% 
    # Rename columns
    rename(movie=name, year=year, song=name.y)


# Identify the key columns
movie_directors
movie_years

movie_years %>% 
    # Left join movie_directors to movie_years
    left_join(movie_directors, by=c("movie"="name")) %>% 
    # Arrange the columns using select()
    select(year, movie, artist=name, director, studio)


# Load the purrr library
library(purrr)

# Place supergroups, more_bands, and more_artists into a list
list(supergroups, more_bands, more_artists) %>% 
    # Use reduce to join together the contents of the list
    reduce(left_join, by = c("first", "last"))


list(more_artists, more_bands, supergroups) %>% 
    # Return rows of more_artists in all three datasets
    reduce(semi_join)

vignette("databases", package = "dplyr")

# Alter the code to perform the join with a dplyr function
merge(bands, artists, by = c("first", "last"), all.x = TRUE) %>%
    arrange(band)


# Alter the code to perform the join with a dplyr function
left_join(bands, artists, by = c("first", "last")) %>%
    arrange(band)

library(Lahman)

LahmanData

# Examine lahmanNames
lahmanNames

# Find variables in common
reduce(lahmanNames, intersect)


?bind_rows

?tally

lahmanNames %>%  
    # Bind the data frames in lahmanNames
    bind_rows(.id = "dataframe") %>%
    # Group the result by var
    group_by(var) %>%
    # Tally the number of appearances
    tally() %>%
    # Filter the data
    filter(n > 1) %>% 
    # Arrange the results
    arrange(desc(n))


lahmanNames %>% 
    # Bind the data frames
    bind_rows(.id="dataframe") %>%
    # Filter the results
    filter(var == "playerID") %>% 
    # Extract the dataframe variable
    `$`(dataframe)


players <- Master %>% 
    # Return one row for each distinct player
    distinct(playerID, nameFirst, nameLast)


players %>% 
    # Find all players who do not appear in Salaries
    anti_join(Salaries) %>%
    # Count them
    count()

players %>% 
    anti_join(Salaries, by = "playerID") %>% 
    # How many unsalaried players appear in Appearances?
    semi_join(Appearances, by = "playerID") %>% 
    count()


players %>% 
    # Find all players who do not appear in Salaries
    anti_join(Salaries, by = "playerID") %>% 
    # Join them to Appearances
    left_join(Appearances, by = "playerID") %>% 
    # Calculate total_games for each player
    group_by(playerID) %>%
    summarise(total_games = sum(G_all, na.rm = TRUE)) %>%
    # Arrange in descending order by total_games
    arrange(desc(total_games))


players %>%
    # Find unsalaried players
    anti_join(Salaries, by ="playerID") %>% 
    # Join Batting to the unsalaried players
    left_join(Batting) %>% 
    # Group by player
    group_by(playerID) %>% 
    # Sum at-bats for each player
    summarise(total_at_bat = sum(AB, na.rm = TRUE)) %>% 
    # Arrange in descending order
    arrange(desc(total_at_bat))


# Find the distinct players that appear in HallOfFame
nominated <- HallOfFame %>% 
    distinct(playerID)

nominated %>% 
    # Count the number of players in nominated
    count()

nominated_full <- nominated %>% 
    # Join to Master
    left_join(Master, by= "playerID") %>% 
    # Return playerID, nameFirst, nameLast
    select(playerID, nameFirst, nameLast)


# Find distinct players in HallOfFame with inducted == "Y"
inducted <- HallOfFame %>% 
    filter(inducted == "Y") %>%
    distinct(playerID)


inducted %>% 
    # Count the number of players in inducted
    count()

inducted_full <- inducted %>% 
    # Join to Master
    left_join(Master) %>% 
    # Return playerID, nameFirst, nameLast
    select(playerID, nameFirst, nameLast)

# Tally the number of awards in AwardsPlayers by playerID
nAwards <- AwardsPlayers %>% 
    group_by(playerID) %>% 
    tally()

nAwards %>% 
    # Filter to just the players in inducted 
    semi_join(inducted, by = "playerID") %>% 
    # Calculate the mean number of awards per player
    summarise(avg_n =mean(n, na.ram = TRUE))

nAwards %>% 
    # Filter to just the players in nominated 
    semi_join(nominated, by="playerID") %>% 
    # Filter to players NOT in inducted 
    anti_join(inducted, by = "playerID") %>% 
    # Calculate the mean number of awards per player
    summarise(avg_n = mean(n, na.rm = TRUE))



# Find the players who are in nominated, but not inducted
notInducted <- nominated %>% 
    setdiff(inducted)

Salaries %>% 
    # Find the players who are in notInducted
    semi_join(notInducted, by = "playerID") %>% 
    # Calculate the max salary by player
    group_by(playerID) %>% 
    summarize(max_salary = max(salary, na.rm = TRUE)) %>% 
    # Calculate the average of the max salaries
    summarize(avg_salary = mean(max_salary, na.rm = TRUE))

# Repeat for players who were inducted
Salaries %>% 
    semi_join(inducted, by = "playerID") %>% 
    group_by(playerID) %>% 
    summarize(max_salary = max(salary, na.rm = TRUE)) %>% 
    summarize(avg_salary = mean(max_salary, na.rm = TRUE))


Appearances %>% 
    # Filter Appearances against nominated
    semi_join(nominated, by = "playerID") %>% 
    # Find last year played by player
    group_by(playerID) %>% 
    summarize(last_year = max(yearID)) %>% 
    # Join to full HallOfFame
    left_join(HallOfFame, by = "playerID") %>% 
    # Filter for unusual observations
    filter(last_year >= yearID)

##### Data Visualization in R

# Load MASS package
library(MASS)

# Plot whiteside data
plot(whiteside)

?plot


# Plot Gas vs. Temp
plot(x = whiteside$Temp, y = whiteside$Gas,
     xlab =  "Outside temperature", ylab = "Heating gas consumption")

# Apply the plot() function to Insul
plot(whiteside$Insul)


# Load the MASS package
library(MASS)

# Plot Max.Price vs. Price as red triangles
plot(Cars93$Price, Cars93$Max.Price, pch = 17, col ="red")

# Add Min.Price vs. Price as blue circles
points(Cars93$Price, Cars93$Min.Price, pch=16, col = "blue")

# Add an equality reference line with abline()
abline(a = 0, b = 1, lty = 2)



# Load the robustbase package
library(robustbase)

# Set up the side-by-side plot array
par(mfrow = c(1,2))

# First plot: brain vs. body in its original form
plot(Animals2$body, Animals2$brain)

# Add the first title
title("Original representation")

# Second plot: log-log plot of brain vs. body
plot(Animals2$body, Animals2$brain, log ="xy")

# Add the second title
title("Log-log plot")

plot(Animals2$body, Animals2$brain, log ="x")
plot(Animals2$body, Animals2$brain, log ="y")

# Load the insuranceData package
library(insuranceData)

# Use the data() function to get the dataCar data frame
data(dataCar)

# Set up a side-by-side plot array
par(mfrow=c(1,2))

# Create a table of veh_body record counts and sort
tbl <- sort(table(dataCar$veh_body),
            decreasing = TRUE)

# Create the pie chart and give it a title
pie(tbl)
title("Pie chart")

# Create the barplot with perpendicular, half-sized labels
barplot(tbl, las = 2, cex.names = 0.5)

# Add a title
title("Bar chart")

?pie

library(MASS)
# Set up a side-by-side plot array
par(mfrow=c(1,2))

# Create a histogram of counts with hist()
hist(Cars93$Horsepower, main = "hist() plot")

# Create a normalized histogram with truehist()
truehist(Cars93$Horsepower, main = "truehist() plot")

# Create index16, pointing to 16-week chicks
index16 <- which(ChickWeight$Time == 16)

# Get the 16-week chick weights
weights <- ChickWeight$weight[index16]

# Plot the normalized histogram
truehist(weights)

# Add the density curve to the histogram
lines(density(weights))


# Load the car package to make qqPlot() available
library(car)

# Create index16, pointing to 16-week chicks
index16 <- which(ChickWeight$Time == 16)

# Get the 16-week chick weights
weights <- ChickWeight$weight[index16]

# Show the normal QQ-plot of the chick weights
qqPlot(weights)

# Show the normal QQ-plot of the Boston$tax data
qqPlot(Boston$tax)


# Set up a side-by-side plot array
par(mfrow=c(1,2))

# Create the standard scatterplot
plot(rad ~ zn, data = Boston )

# Add the title
title(main = "Standard scatterplot")

# Create the sunflowerplot
sunflowerplot(rad~zn, data = Boston)

# Add the title
title(main = "Sunflower plot")


# Create a variable-width boxplot with log y-axis & horizontal labels
boxplot(crim ~ rad, data = Boston, varwidth = TRUE, log = "y", las = 1) 

# Add a title
title(main = "Crime rate vs. radial highway index")


# Create a mosaic plot using the formula interface
mosaicplot(carb ~ cyl, data = mtcars)

# Create a side-by-side boxplot summary
boxplot(Cars93$Min.Price, Cars93$Max.Price)

# Load aplpack to make the bagplot() function available
library(aplpack)

# Create a bagplot for the same two variables
bagplot(Cars93$Min.Price, Cars93$Max.Price, cex=1.20)

# Add an equality reference line
abline(0, 1, lty = 2)


# Load the corrplot library for the corrplot() function
library(corrplot)

# Extract the numerical variables from UScereal
numericalVars <- UScereal[, - c(1, 11)]

# Compute the correlation matrix for these variables
corrMat <- cor(numericalVars)

# Generate the correlation ellipse plot
corrplot(corrMat, method = "ellipse")


# Load the rpart library
library(rpart)

# Fit an rpart model to predict medv from all other Boston variables
tree_model <- rpart(medv ~ . , data = Boston)

# Plot the structure of this decision tree model
plot(tree_model)

# Add labels to this plot
text(tree_model, cex = 0.7)


# Assign the return value from the par() function to plot_pars
plot_pars <- par()

# Display the names of the par() function's list elements
names(plot_pars)

# Display the number of par() function list elements
length(plot_pars)


# Set up a 2-by-2 plot array
par(mfrow = c(2,2))

# Plot the Animals2 brain weight data as points
plot(Animals2$brain, type = "p")

# Add the title
title("points")

# Plot the brain weights with lines
plot(Animals2$brain, type = "l")

# Add the title
title("lines")

# Plot the brain weights as lines overlaid with points
plot(Animals2$brain, type = "o")

# Add the title
title("overlaid")

# Plot the brain weights as steps
plot(Animals2$brain, type = "s")

# Add the title
title("steps")

?points

library(datasets)
library(MASS)

# Compute max_hp
max_hp <- max(Cars93$Horsepower, mtcars$hp)

# Compute max_mpg
max_mpg <- max(Cars93$MPG.city, Cars93$MPG.highway, mtcars$mpg)

# Create plot with type = "n"               
plot(max_hp, max_mpg,
     type = "n", xlim = c(0, max_hp),
     ylim = c(0, max_mpg), xlab = "Horsepower",
     ylab = "Miles per gallon")

# Add open circles to plot
points(mtcars$hp, mtcars$mpg, pch = 1)

# Add solid squares to plot
points(Cars93$Horsepower, Cars93$MPG.city, pch = 15)

# Add open triangles to plot
points(Cars93$Horsepower, Cars93$MPG.highway, pch = 2)


# Create the numerical vector x
x <- seq(0, 10, length = 200)

# Compute the Gaussian density for x with mean 2 and standard deviation 0.2
gauss1 <- dnorm(x, mean = 2, sd = 0.2)

# Compute the Gaussian density with mean 4 and standard deviation 0.5
gauss2 <- dnorm(x, mean = 4, sd = 0.5)

# Plot the first Gaussian density
plot(x, gauss1, type = "l", ylab = "Gaussian probability density")

# Add lines for the second Gaussian density
lines(x, gauss2, lty = 2, lwd = 3)

# Create an empty plot using type = "n"

plot(mtcars$hp, mtcars$mpg, type = "n", xlab= "Horsepower", ylab = "Gas mileage")
# Add points with shapes determined by cylinder number
points(mtcars$hp, mtcars$mpg, pch = mtcars$cyl)

# Create a second empty plot
plot(mtcars$hp, mtcars$mpg, type = "n", xlab= "Horsepower", ylab = "Gas mileage")

# Add points with shapes as cylinder characters
points(mtcars$hp, mtcars$mpg,pch = as.character(mtcars$cyl))

# Build a linear regression model for the whiteside data
linear_model <- lm(Gas ~ Temp, data = whiteside)

# Create a Gas vs. Temp scatterplot from the whiteside data
plot(whiteside$Temp, whiteside$Gas)

# Use abline() to add the linear regression line
abline(linear_model, lty = 2)

# Create MPG.city vs. Horsepower plot with solid squares
plot(Cars93$Horsepower, Cars93$MPG.city, pch=15)

# Create index3, pointing to 3-cylinder cars
index3 <- which(Cars93$Cylinders==3)

# Add text giving names of cars next to data points
text(x = Cars93$Horsepower[index3], 
     y = Cars93$MPG.city[index3],
     labels = Cars93$Make[index3], adj = 0)


# Plot MPG.city vs. Horsepower as open circles
plot(Cars93$Horsepower, Cars93$MPG.city, pch=1)

# Create index3, pointing to 3-cylinder cars
index3 <- which(Cars93$Cylinders==3)

# Highlight 3-cylinder cars as solid circles
points(x= Cars93$Horsepower[index3], y=Cars93$MPG.city[index3], pch=16)

# Add car names, offset from points, with larger bold text
text(x = Cars93$Horsepower[index3], 
     y = Cars93$MPG.city[index3],
     labels = Cars93$Make[index3], adj= -0.2, cex=1.2, font=4)



# Plot Gas vs. Temp as solid triangles
plot(whiteside$Temp, whiteside$Gas, pch=17)

# Create indexB, pointing to "Before" data
indexB <- which(whiteside$Insul== "Before")

# Create indexA, pointing to "After" data
indexA <- which(whiteside$Insul== "After")

# Add "Before" text in blue, rotated 30 degrees, 80% size
text(x = whiteside$Temp[indexB], y = whiteside$Gas[indexB],
     labels = "Before", col = "blue", srt = 30, cex = 0.8)

# Add "After" text in red, rotated -20 degrees, 80% size
text(x = whiteside$Temp[indexA], y = whiteside$Gas[indexA],
     labels = "After", col = "red", srt = -20, cex = 0.8)


# Set up and label empty plot of Gas vs. Temp
plot(whiteside$Temp, whiteside$Gas,
     type = "n", xlab = "Outside temperature",
     ylab = "Heating gas consumption")

# Create indexB, pointing to "Before" data
indexB <- which(whiteside$Insul=="Before")

# Create indexA, pointing to "After" data
indexA <- which(whiteside$Insul=="After")

# Add "Before" data as solid triangles
points(x=whiteside$Temp[indexB], y= whiteside$Gas[indexB], pch=17)

# Add "After" data as open circles
points(x=whiteside$Temp[indexA], y= whiteside$Gas[indexA], pch=1)

# Add legend that identifies points as "Before" and "After"
legend("topright", pch = c(17,1), 
       legend = c("Before", "After"))



# Create a boxplot of sugars by shelf value, without axes
boxplot(sugars~shelf, data=UScereal, axes=FALSE)

# Add a default y-axis to the left of the boxplot
axis(side = 2)

# Add an x-axis below the plot, labelled 1, 2, and 3
axis(side = 1, at = c(1,2,3))

# Add a second x-axis above the plot
axis(side = 3, at = c(1,2,3),
     labels = c("floor", "middle", "top"))


# Create a scatterplot of MPG.city vs. Horsepower
plot(Cars93$Horsepower, Cars93$MPG.city)

# Call supsmu() to generate a smooth trend curve, with default bass
trend1<- supsmu(Cars93$Horsepower, Cars93$MPG.city)

# Add this trend curve to the plot
lines(trend1)

# Call supsmu() for a second trend curve, with bass = 10
trend2 <- supsmu(Cars93$Horsepower, Cars93$MPG.city, bass=10)

# Add this trend curve as a heavy, dotted line
lines(trend2, lty=3, lwd=2)


# Add this trend curve to the plot
lines(trend1)

# Call supsmu() for a second trend curve, with bass = 10
trend2 <- supsmu(Cars93$Horsepower, Cars93$MPG.city, bass=10)

# Add this trend curve as a heavy, dotted line
lines(trend2, lty=3, lwd=2)


Deneme

























































