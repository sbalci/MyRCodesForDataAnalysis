---
title: R ile analize başlarken^[Bu bir derlemedir, mümkün mertebe alıntılara referans
  vermeye çalıştım.]
author: "Derleyen [Serdar Balcı, MD, Pathologist](https://sbalci.github.io/)"
date: "2019-04-18"
output:
  html_document: 
    fig_caption: yes
    keep_md: yes
    toc: yes
    toc_depth: 5
    toc_float: yes
  pdf_document:
    toc: yes
    toc_depth: '5'
  html_notebook:
    fig_caption: yes
    highlight: kate
    number_sections: yes
    theme: flatly
    toc: yes
    toc_depth: 5
    toc_float: yes
---

<!-- Open all links in new tab-->  
<base target="_blank"/>   


<!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5bc36900a405090b">  
</script> 




[![](http://res.cloudinary.com/dyd911kmh/image/upload/f_auto,q_auto:best/v1530113077/Image_2_vfy48b.png)](https://www.datacamp.com/community/tutorials/data-science-pitfalls)


- R generation

https://rss.onlinelibrary.wiley.com/doi/10.1111/j.1740-9713.2018.01169.x


# R yükleme

http://www.youtube.com/watch?v=XcBLEVknqvY

[![What is R?](http://img.youtube.com/vi/XcBLEVknqvY/0.jpg)](http://www.youtube.com/watch?v=XcBLEVknqvY)


## R-project

https://cran.r-project.org/

---

[![](https://ismayc.github.io/talks/ness-infer/img/engine.png)](https://ismayc.github.io/talks/ness-infer/slide_deck.html#6)

---

## RStudio

https://www.rstudio.com/

https://www.rstudio.com/products/rstudio/download/

https://moderndive.com/2-getting-started.html

---

[![](http://www-users.york.ac.uk/~er13/RStudio%20Anatomy.svg)](https://buzzrbeeline.blog/2018/07/04/rstudio-anatomy/)



---

### RStudio eklentileri

- Discover and install useful RStudio addins

https://cran.r-project.org/web/packages/addinslist/README.html

https://rstudio.github.io/rstudioaddins/



```r
# devtools::install_github("rstudio/addinexamples", type = "source")
```


---

## X11

https://www.xquartz.org/

---

## Java OS

https://support.apple.com/kb/dl1572

---


# R zor şeyler için kolay, kolay şeyler için zor


- [R makes easy things hard, and hard things easy](http://r4stats.com/articles/why-r-is-hard-to-learn/)


- Aynı şeyi çok fazla şekilde yapmak mümkün

R Syntax Comparison::CHEAT SHEET

https://www.amelia.mn/Syntax-cheatsheet.pdf




<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/hashtag/RStats?src=hash&amp;ref_src=twsrc%5Etfw">#RStats</a> — There are always several ways to do the same thing... nice example on with the identity matrix by <a href="https://twitter.com/TeaStats?ref_src=twsrc%5Etfw">@TeaStats</a> <a href="https://t.co/O3GXdPiM32">https://t.co/O3GXdPiM32</a></p>&mdash; Colin Fay 🤘 (@_ColinFay) <a href="https://twitter.com/_ColinFay/status/1112746633467518977?ref_src=twsrc%5Etfw">April 1, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>










---


# R paketleri


## Neden paketler var

[![](https://ismayc.github.io/talks/ness-infer/img/appstore.png)](https://ismayc.github.io/talks/ness-infer/slide_deck.html#7)

---

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script><blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I love the <a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a> community.<br>Someone is like, &quot;oh hey peeps, I saw a big need for this mundane but difficult task that I infrequently do, so I created a package that will literally scrape the last bits of peanut butter out of the jar for you. It&#39;s called pbplyr.&quot;<br>What a tribe.</p>&mdash; Frank Elavsky ᴰᵃᵗᵃ ᵂᶦᶻᵃʳᵈ (@Frankly_Data) <a href="https://twitter.com/Frankly_Data/status/1014189095294291968?ref_src=twsrc%5Etfw">July 3, 2018</a></blockquote>

---



https://blog.mitchelloharawild.com/blog/user-2018-feature-wall/

---

![](https://blog.mitchelloharawild.com/blog/2018-07-11-user-2018-feature-wall_files/final.jpg)

---

## Paketleri nereden bulabiliriz

- Available CRAN Packages By Name  
https://cran.r-project.org/web/packages/available_packages_by_name.html

- CRAN Task Views  
https://cran.r-project.org/web/views/

- Bioconductor  
https://www.bioconductor.org

- RecommendR  
http://recommendr.info/

- pkgsearch  
CRAN package search  
https://github.com/metacran/pkgsearch

- CRANsearcher  
https://github.com/RhoInc/CRANsearcher  

- Awesome R  
https://awesome-r.com/  


## Kendi paket evrenini oluştur

- pkgverse: Build a Meta-Package Universe  
https://cran.r-project.org/web/packages/pkgverse/index.html


---

## R paket yükleme

```
install.packages("tidyverse", dependencies = TRUE)
install.packages("jmv", dependencies = TRUE)
install.packages("questionr", dependencies = TRUE)
install.packages("Rcmdr", dependencies = TRUE)
install.packages("summarytools")
```


```r
# install.packages("tidyverse", dependencies = TRUE)
# install.packages("jmv", dependencies = TRUE)
# install.packages("questionr", dependencies = TRUE)
# install.packages("Rcmdr", dependencies = TRUE)
# install.packages("summarytools")
```



```r
# require(tidyverse)
# require(jmv)
# require(questionr)
# library(summarytools)
# library(gganimate)
```



---

# R için yardım bulma



```r
# ?mean
# ??efetch
# help(merge)
# example(merge)
```



- Vignette

![](figures/vignette.png)

---

- RDocumentation
https://www.rdocumentation.org

- R Package Documentation
https://rdrr.io/

- GitHub

- Stackoverflow

https://stackoverflow.com/

- Google uygun anahtar kelime



<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script><blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">How I use <a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a> <br>h/t <a href="https://twitter.com/ThePracticalDev?ref_src=twsrc%5Etfw">@ThePracticalDev</a> <a href="https://t.co/erRnTG0Ujr">pic.twitter.com/erRnTG0Ujr</a></p>&mdash; Emily Bovee (@ebovee09) <a href="https://twitter.com/ebovee09/status/1028037594947485696?ref_src=twsrc%5Etfw">August 10, 2018</a></blockquote>


---


![](figures/Google-package-name.png)

---



![](figures/Google-start-with-R.png)

---

- Google'da ararken `[R]` yazmak da işe yarayabiliyor.


---

- searcher package 📦


[![](https://camo.githubusercontent.com/12f0e2d18047f1b5f36fbeb09a1d0e548236883f/68747470733a2f2f692e696d6775722e636f6d2f5a7132726736472e676966)](https://github.com/coatless/searcher)



---

- Awesome Cheatsheet
https://github.com/detailyang/awesome-cheatsheet

http://cran.r-project.org/doc/contrib/Baggott-refcard-v2.pdf

https://www.rstudio.com/resources/cheatsheets/


- Awesome R

https://github.com/qinwf/awesome-R#readme

https://awesome-r.com/




- Twitter

https://twitter.com/hashtag/rstats?src=hash


- Reproducible Examples  

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Got a question to ask on <a href="https://twitter.com/SlackHQ?ref_src=twsrc%5Etfw">@SlackHQ</a> or post on <a href="https://twitter.com/github?ref_src=twsrc%5Etfw">@github</a>? No time to read the long post on how to use reprex? Here is a 20-second gif for you to format your R codes nicely and for others to reproduce your problem. (An example from a talk given by <a href="https://twitter.com/JennyBryan?ref_src=twsrc%5Etfw">@JennyBryan</a>) <a href="https://twitter.com/hashtag/rstat?src=hash&amp;ref_src=twsrc%5Etfw">#rstat</a> <a href="https://t.co/gpuGXpFIsX">pic.twitter.com/gpuGXpFIsX</a></p>&mdash; ZhiYang (@zhiiiyang) <a href="https://twitter.com/zhiiiyang/status/1053006003711569920?ref_src=twsrc%5Etfw">October 18, 2018</a></blockquote><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


- Keeping up to date with R news  
https://masalmon.eu/2019/01/25/uptodate/  

---

# R studio ile proje oluşturma

https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects

![](http://www.rstudio.com/images/docs/projects_new.png)

---

# RStudio ile veri yükleme

https://support.rstudio.com/hc/en-us/articles/218611977-Importing-Data-with-RStudio

![](https://support.rstudio.com/hc/en-us/article_attachments/206277618/data-import-overview.gif)

---

## Excel

## SPSS

## csv


---

# Veriyi görüntüleme

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script><blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Spreadsheet users using <a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a>:  where&#39;s the data?<a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a> users using spreadsheets:  where&#39;s the code?</p>&mdash; Leonard Kiefer (@lenkiefer) <a href="https://twitter.com/lenkiefer/status/1015587475580956672?ref_src=twsrc%5Etfw">July 7, 2018</a></blockquote>




```r
# library(nycflights13)
# summary(flights)
```



```
View(data)
```


```
data
```


```
head
```


```
tail
```


```
glimpse
```


```
str
```


```
skimr::skim()
```

---


# Veriyi değiştirme

## Veriyi kod ile değiştirelim

## Veriyi eklentilerle değiştirme

![](figures/change_data.png)


---


## RStudio aracılığıyla recode

*questionr* paketi kullanılacak

![](figures/level_recode.png)


---



https://juba.github.io/questionr/articles/recoding_addins.html


![](https://raw.githubusercontent.com/juba/questionr/master/resources/screenshots/irec_1.png)


---

![](https://raw.githubusercontent.com/juba/questionr/master/resources/screenshots/irec_2.png)


---

![](https://raw.githubusercontent.com/juba/questionr/master/resources/screenshots/irec_3.png)


---

# Basit tanımlayıcı istatistikler

```
summary()
```

```
mean
```

```
median
```

```
min
```

```
max
```

```
sd
```

```
table()
```



```r
library(readr)
irisdata <- read_csv("data/iris.csv")
```

```
## Parsed with column specification:
## cols(
##   Sepal.Length = col_double(),
##   Sepal.Width = col_double(),
##   Petal.Length = col_double(),
##   Petal.Width = col_double(),
##   Species = col_character()
## )
```

```r
jmv::descriptives(
    data = irisdata,
    vars = "Sepal.Length",
    splitBy = "Species",
    freq = TRUE,
    hist = TRUE,
    dens = TRUE,
    bar = TRUE,
    box = TRUE,
    violin = TRUE,
    dot = TRUE,
    mode = TRUE,
    sum = TRUE,
    sd = TRUE,
    variance = TRUE,
    range = TRUE,
    se = TRUE,
    skew = TRUE,
    kurt = TRUE,
    quart = TRUE,
    pcEqGr = TRUE)
```

```
## 
##  DESCRIPTIVES
## 
##  Descriptives                                          
##  ───────────────────────────────────────────────────── 
##                           Species       Sepal.Length   
##  ───────────────────────────────────────────────────── 
##    N                      setosa                  50   
##                           versicolor              50   
##                           virginica               50   
##    Missing                setosa                   0   
##                           versicolor               0   
##                           virginica                0   
##    Mean                   setosa                5.01   
##                           versicolor            5.94   
##                           virginica             6.59   
##    Std. error mean        setosa              0.0498   
##                           versicolor          0.0730   
##                           virginica           0.0899   
##    Median                 setosa                5.00   
##                           versicolor            5.90   
##                           virginica             6.50   
##    Mode                   setosa                5.00   
##                           versicolor            5.50   
##                           virginica             6.30   
##    Sum                    setosa                 250   
##                           versicolor             297   
##                           virginica              329   
##    Standard deviation     setosa               0.352   
##                           versicolor           0.516   
##                           virginica            0.636   
##    Variance               setosa               0.124   
##                           versicolor           0.266   
##                           virginica            0.404   
##    Range                  setosa                1.50   
##                           versicolor            2.10   
##                           virginica             3.00   
##    Minimum                setosa                4.30   
##                           versicolor            4.90   
##                           virginica             4.90   
##    Maximum                setosa                5.80   
##                           versicolor            7.00   
##                           virginica             7.90   
##    Skewness               setosa               0.120   
##                           versicolor           0.105   
##                           virginica            0.118   
##    Std. error skewness    setosa               0.337   
##                           versicolor           0.337   
##                           virginica            0.337   
##    Kurtosis               setosa              -0.253   
##                           versicolor          -0.533   
##                           virginica           0.0329   
##    Std. error kurtosis    setosa               0.662   
##                           versicolor           0.662   
##                           virginica            0.662   
##    25th percentile        setosa                4.80   
##                           versicolor            5.60   
##                           virginica             6.23   
##    50th percentile        setosa                5.00   
##                           versicolor            5.90   
##                           virginica             6.50   
##    75th percentile        setosa                5.20   
##                           versicolor            6.30   
##                           virginica             6.90   
##  ─────────────────────────────────────────────────────
```

![](R-Giris_files/figure-html/descriptive-1.png)<!-- -->![](R-Giris_files/figure-html/descriptive-2.png)<!-- -->

---


```r
# install.packages("scatr")

scatr::scat(
    data = irisdata,
    x = "Sepal.Length",
    y = "Sepal.Width",
    group = "Species",
    marg = "dens",
    line = "linear",
    se = TRUE)
```

![](R-Giris_files/figure-html/scatter-1.png)<!-- -->

## summarytools

https://cran.r-project.org/web/packages/summarytools/vignettes/Introduction.html


```r
library(summarytools)
summarytools::freq(iris$Species, style = "rmarkdown")
```

### Frequencies  
#### iris$Species  
**Type:** Factor  

|         &nbsp; | Freq | % Valid | % Valid Cum. | % Total | % Total Cum. |
|---------------:|-----:|--------:|-------------:|--------:|-------------:|
|     **setosa** |   50 |   33.33 |        33.33 |   33.33 |        33.33 |
| **versicolor** |   50 |   33.33 |        66.67 |   33.33 |        66.67 |
|  **virginica** |   50 |   33.33 |       100.00 |   33.33 |       100.00 |
|     **\<NA\>** |    0 |         |              |    0.00 |       100.00 |
|      **Total** |  150 |  100.00 |       100.00 |  100.00 |       100.00 |


```r
summarytools::freq(iris$Species, report.nas = FALSE, style = "rmarkdown", omit.headings = TRUE)
```

```
'omit.headings' argument has been replaced by 'headings'; setting headings = FALSE
```


|         &nbsp; | Freq |      % | % Cum. |
|---------------:|-----:|-------:|-------:|
|     **setosa** |   50 |  33.33 |  33.33 |
| **versicolor** |   50 |  33.33 |  66.67 |
|  **virginica** |   50 |  33.33 | 100.00 |
|      **Total** |  150 | 100.00 | 100.00 |


```r
with(tobacco, print(ctable(smoker, diseased), method = 'render'))
```

<!--html_preserve--><div class="container st-container">
<h3>Cross-Tabulation, Row Proportions</h3>
<h4>smoker * diseased</h4>
<strong>Data Frame</strong>: tobacco
<br/>
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="8" align="center" class="st-protect-top-border">diseased</th>
<th colspan="4"></th>
</tr>
<tr>
<td align="center">
<strong>smoker</strong>
</td>
<th colspan="4" align="center">Yes</th>
<th colspan="4" align="center">No</th>
<th colspan="4" align="center">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<strong align="center">Yes</strong>
</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">125</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">41.9%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">173</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">58.1%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">298</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">100.0%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
</tr>
<tr>
<td>
<strong align="center">No</strong>
</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">99</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">14.1%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">603</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">85.9%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">702</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">100.0%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
</tr>
<tr>
<td>
<strong align="center">Total</strong>
</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">224</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">22.4%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">776</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">77.6%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">1000</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">100.0%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
</tr>
</tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.9.3 (<a href='https://www.r-project.org/'>R</a> version 3.5.3)<br/>2019-04-18</p>
</div><!--/html_preserve-->



```r
with(tobacco, 
     print(ctable(smoker, diseased, prop = 'n', totals = FALSE), 
           omit.headings = TRUE, method = "render"))
```

```
'omit.headings' will disappear in future releases; use 'headings' instead
```

<!--html_preserve--><div class="container st-container">
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="2" align="center" class="st-protect-top-border">diseased</th>
</tr>
<tr>
<td align="center">
<strong>smoker</strong>
</td>
<th colspan="1" align="center">Yes</th>
<th colspan="1" align="center">No</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<strong align="center">Yes</strong>
</td>
<td>
<span>125</span>
</td>
<td>
<span>173</span>
</td>
</tr>
<tr>
<td>
<strong align="center">No</strong>
</td>
<td>
<span>99</span>
</td>
<td>
<span>603</span>
</td>
</tr>
</tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.9.3 (<a href='https://www.r-project.org/'>R</a> version 3.5.3)<br/>2019-04-18</p>
</div><!--/html_preserve-->




```r
summarytools::descr(iris, style = "rmarkdown")
```

```
Non-numerical variable(s) ignored: Species
```

### Descriptive Statistics  
#### iris  
**N:** 150  

|          &nbsp; | Petal.Length | Petal.Width | Sepal.Length | Sepal.Width |
|----------------:|-------------:|------------:|-------------:|------------:|
|        **Mean** |         3.76 |        1.20 |         5.84 |        3.06 |
|     **Std.Dev** |         1.77 |        0.76 |         0.83 |        0.44 |
|         **Min** |         1.00 |        0.10 |         4.30 |        2.00 |
|          **Q1** |         1.60 |        0.30 |         5.10 |        2.80 |
|      **Median** |         4.35 |        1.30 |         5.80 |        3.00 |
|          **Q3** |         5.10 |        1.80 |         6.40 |        3.30 |
|         **Max** |         6.90 |        2.50 |         7.90 |        4.40 |
|         **MAD** |         1.85 |        1.04 |         1.04 |        0.44 |
|         **IQR** |         3.50 |        1.50 |         1.30 |        0.50 |
|          **CV** |         0.47 |        0.64 |         0.14 |        0.14 |
|    **Skewness** |        -0.27 |       -0.10 |         0.31 |        0.31 |
| **SE.Skewness** |         0.20 |        0.20 |         0.20 |        0.20 |
|    **Kurtosis** |        -1.42 |       -1.36 |        -0.61 |        0.14 |
|     **N.Valid** |       150.00 |      150.00 |       150.00 |      150.00 |
|   **Pct.Valid** |       100.00 |      100.00 |       100.00 |      100.00 |




```r
descr(iris, stats = c("mean", "sd", "min", "med", "max"), transpose = TRUE, 
      omit.headings = TRUE, style = "rmarkdown")
```

```
'omit.headings' argument has been replaced by 'headings'; setting headings = FALSE
```

```
Non-numerical variable(s) ignored: Species
```


|           &nbsp; | Mean | Std.Dev |  Min | Median |  Max |
|-----------------:|-----:|--------:|-----:|-------:|-----:|
| **Petal.Length** | 3.76 |    1.77 | 1.00 |   4.35 | 6.90 |
|  **Petal.Width** | 1.20 |    0.76 | 0.10 |   1.30 | 2.50 |
| **Sepal.Length** | 5.84 |    0.83 | 4.30 |   5.80 | 7.90 |
|  **Sepal.Width** | 3.06 |    0.44 | 2.00 |   3.00 | 4.40 |




```r
# view(dfSummary(iris))
```


![](figures/dfsummary.png)




```r
dfSummary(tobacco, plain.ascii = FALSE, style = "grid")
```

```
text graphs are displayed; set 'tmp.img.dir' parameter to activate png graphs
```

### Data Frame Summary  
#### tobacco  
**Dimensions:** 1000 x 9  
**Duplicates:** 2  

+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| No | Variable      | Stats / Values           | Freqs (% of Valid)  | Graph                        | Valid   | Missing |
+====+===============+==========================+=====================+==============================+=========+=========+
| 1  | gender\       | 1\. F\                   | 489 (50.0%)\        | IIIIIIIIII \                 | 978\    | 22\     |
|    | [factor]      | 2\. M                    | 489 (50.0%)         | IIIIIIIIII                   | (97.8%) | (2.2%)  |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 2  | age\          | Mean (sd) : 49.6 (18.3)\ | 63 distinct values  | \                            | 975\    | 25\     |
|    | [numeric]     | min < med < max:\        |                     | . \ \ \ \ . \ \ \ \ . . . :\ | (97.5%) | (2.5%)  |
|    |               | 18 < 50 < 80\            |                     | : : : : : . : : : :\         |         |         |
|    |               | IQR (CV) : 32 (0.4)      |                     | : : : : : : : : : :\         |         |         |
|    |               |                          |                     | : : : : : : : : : :\         |         |         |
|    |               |                          |                     | : : : : : : : : : :          |         |         |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 3  | age.gr\       | 1\. 18-34\               | 258 (26.5%)\        | IIIII \                      | 975\    | 25\     |
|    | [factor]      | 2\. 35-50\               | 241 (24.7%)\        | IIII \                       | (97.5%) | (2.5%)  |
|    |               | 3\. 51-70\               | 317 (32.5%)\        | IIIIII \                     |         |         |
|    |               | 4\. 71 +                 | 159 (16.3%)         | III                          |         |         |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 4  | BMI\          | Mean (sd) : 25.7 (4.5)\  | 974 distinct values | \                            | 974\    | 26\     |
|    | [numeric]     | min < med < max:\        |                     | \ \ \ \ \ \ \ \ \ \ :\       | (97.4%) | (2.6%)  |
|    |               | 8.8 < 25.6 < 39.4\       |                     | \ \ \ \ \ \ \ \ : : :\       |         |         |
|    |               | IQR (CV) : 5.7 (0.2)     |                     | \ \ \ \ \ \ \ \ : : :\       |         |         |
|    |               |                          |                     | \ \ \ \ \ \ : : : : :\       |         |         |
|    |               |                          |                     | \ \ \ \ . : : : : : .        |         |         |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 5  | smoker\       | 1\. Yes\                 | 298 (29.8%)\        | IIIII \                      | 1000\   | 0\      |
|    | [factor]      | 2\. No                   | 702 (70.2%)         | IIIIIIIIIIIIII               | (100%)  | (0%)    |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 6  | cigs.per.day\ | Mean (sd) : 6.8 (11.9)\  | 37 distinct values  | \                            | 965\    | 35\     |
|    | [numeric]     | min < med < max:\        |                     | :\                           | (96.5%) | (3.5%)  |
|    |               | 0 < 0 < 40\              |                     | :\                           |         |         |
|    |               | IQR (CV) : 11 (1.8)      |                     | :\                           |         |         |
|    |               |                          |                     | :\                           |         |         |
|    |               |                          |                     | : \ \ . . . . . .            |         |         |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 7  | diseased\     | 1\. Yes\                 | 224 (22.4%)\        | IIII \                       | 1000\   | 0\      |
|    | [factor]      | 2\. No                   | 776 (77.6%)         | IIIIIIIIIIIIIII              | (100%)  | (0%)    |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 8  | disease\      | 1\. Hypertension\        | 36 (16.2%)\         | III \                        | 222\    | 778\    |
|    | [character]   | 2\. Cancer\              | 34 (15.3%)\         | III \                        | (22.2%) | (77.8%) |
|    |               | 3\. Cholesterol\         | 21 ( 9.5%)\         | I \                          |         |         |
|    |               | 4\. Heart\               | 20 ( 9.0%)\         | I \                          |         |         |
|    |               | 5\. Pulmonary\           | 20 ( 9.0%)\         | I \                          |         |         |
|    |               | 6\. Musculoskeletal\     | 19 ( 8.6%)\         | I \                          |         |         |
|    |               | 7\. Diabetes\            | 14 ( 6.3%)\         | I \                          |         |         |
|    |               | 8\. Hearing\             | 14 ( 6.3%)\         | I \                          |         |         |
|    |               | 9\. Digestive\           | 12 ( 5.4%)\         | I \                          |         |         |
|    |               | 10\. Hypotension\        | 11 ( 5.0%)\         | \                            |         |         |
|    |               | [ 3 others ]             | 21 ( 9.5%)          | I                            |         |         |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+
| 9  | samp.wgts\    | Mean (sd) : 1 (0.1)\     | 0.86!: 267 (26.7%)\ | IIIII \                      | 1000\   | 0\      |
|    | [numeric]     | min < med < max:\        | 1.04!: 249 (24.9%)\ | IIII \                       | (100%)  | (0%)    |
|    |               | 0.9 < 1 < 1.1\           | 1.05!: 324 (32.4%)\ | IIIIII \                     |         |         |
|    |               | IQR (CV) : 0.2 (0.1)     | 1.06!: 160 (16.0%)\ | III \                        |         |         |
|    |               |                          | ! rounded           | \                            |         |         |
+----+---------------+--------------------------+---------------------+------------------------------+---------+---------+



```r
# First save the results

iris_stats_by_species <- by(data = iris, 
                            INDICES = iris$Species, 
                            FUN = descr, stats = c("mean", "sd", "min", "med", "max"), 
                            transpose = TRUE)

# Then use view(), like so:

view(iris_stats_by_species, method = "pander", style = "rmarkdown")
```

```
Non-numerical variable(s) ignored: Species
```

### Descriptive Statistics  
#### iris  
**Group:** Species = setosa  
**N:** 50  

|           &nbsp; | Mean | Std.Dev |  Min | Median |  Max |
|-----------------:|-----:|--------:|-----:|-------:|-----:|
| **Petal.Length** | 1.46 |    0.17 | 1.00 |   1.50 | 1.90 |
|  **Petal.Width** | 0.25 |    0.11 | 0.10 |   0.20 | 0.60 |
| **Sepal.Length** | 5.01 |    0.35 | 4.30 |   5.00 | 5.80 |
|  **Sepal.Width** | 3.43 |    0.38 | 2.30 |   3.40 | 4.40 |

**Group:** Species = versicolor  
**N:** 50  

|           &nbsp; | Mean | Std.Dev |  Min | Median |  Max |
|-----------------:|-----:|--------:|-----:|-------:|-----:|
| **Petal.Length** | 4.26 |    0.47 | 3.00 |   4.35 | 5.10 |
|  **Petal.Width** | 1.33 |    0.20 | 1.00 |   1.30 | 1.80 |
| **Sepal.Length** | 5.94 |    0.52 | 4.90 |   5.90 | 7.00 |
|  **Sepal.Width** | 2.77 |    0.31 | 2.00 |   2.80 | 3.40 |

**Group:** Species = virginica  
**N:** 50  

|           &nbsp; | Mean | Std.Dev |  Min | Median |  Max |
|-----------------:|-----:|--------:|-----:|-------:|-----:|
| **Petal.Length** | 5.55 |    0.55 | 4.50 |   5.55 | 6.90 |
|  **Petal.Width** | 2.03 |    0.27 | 1.40 |   2.00 | 2.50 |
| **Sepal.Length** | 6.59 |    0.64 | 4.90 |   6.50 | 7.90 |
|  **Sepal.Width** | 2.97 |    0.32 | 2.20 |   3.00 | 3.80 |


```r
# view(iris_stats_by_species)
```

![](figures/DescriptiveStatistics.png)

---


```r
data(tobacco) # tobacco is an example dataframe included in the package
BMI_by_age <- with(tobacco, 
                   by(BMI, age.gr, descr, 
                      stats = c("mean", "sd", "min", "med", "max")))
view(BMI_by_age, "pander", style = "rmarkdown")
```

### Descriptive Statistics  
#### BMI by age.gr  
**Data Frame:** tobacco  
**N:** 258  

|      &nbsp; | 18-34 | 35-50 | 51-70 |  71 + |
|------------:|------:|------:|------:|------:|
|    **Mean** | 23.84 | 25.11 | 26.91 | 27.45 |
| **Std.Dev** |  4.23 |  4.34 |  4.26 |  4.37 |
|     **Min** |  8.83 | 10.35 |  9.01 | 16.36 |
|  **Median** | 24.04 | 25.11 | 26.77 | 27.52 |
|     **Max** | 34.84 | 39.44 | 39.21 | 38.37 |

---


```r
BMI_by_age <- with(tobacco, 
                   by(BMI, age.gr, descr,  transpose = TRUE,
                      stats = c("mean", "sd", "min", "med", "max")))

view(BMI_by_age, "pander", style = "rmarkdown", omit.headings = TRUE)
```

```
'omit.headings' will disappear in future releases; use 'headings' instead
```


|    &nbsp; |  Mean | Std.Dev |   Min | Median |   Max |
|----------:|------:|--------:|------:|-------:|------:|
| **18-34** | 23.84 |    4.23 |  8.83 |  24.04 | 34.84 |
| **35-50** | 25.11 |    4.34 | 10.35 |  25.11 | 39.44 |
| **51-70** | 26.91 |    4.26 |  9.01 |  26.77 | 39.21 |
|  **71 +** | 27.45 |    4.37 | 16.36 |  27.52 | 38.37 |

---


```r
tobacco_subset <- tobacco[ ,c("gender", "age.gr", "smoker")]
freq_tables <- lapply(tobacco_subset, freq)

# view(freq_tables, footnote = NA, file = 'freq-tables.html')
```

---


```r
what.is(iris)
```

$properties
      property      value
1        class data.frame
2       typeof       list
3         mode       list
4 storage.mode       list
5          dim    150 x 5
6       length          5
7    is.object       TRUE
8  object.type         S3
9  object.size 7256 Bytes

$attributes.lengths
    names     class row.names 
        5         1       150 

$extensive.is
[1] "is.data.frame" "is.list"       "is.object"     "is.recursive" 
[5] "is.unsorted"  

---


```r
freq(tobacco$gender, style = 'rmarkdown')
```

```
## ### Frequencies  
## #### tobacco$gender  
## **Type:** Factor  
## 
## |     &nbsp; | Freq | % Valid | % Valid Cum. | % Total | % Total Cum. |
## |-----------:|-----:|--------:|-------------:|--------:|-------------:|
## |      **F** |  489 |   50.00 |        50.00 |   48.90 |        48.90 |
## |      **M** |  489 |   50.00 |       100.00 |   48.90 |        97.80 |
## | **\<NA\>** |   22 |         |              |    2.20 |       100.00 |
## |  **Total** | 1000 |  100.00 |       100.00 |  100.00 |       100.00 |
```

---


```r
print(freq(tobacco$gender), method = 'render')
```

<!--html_preserve--><div class="container st-container">
<h3>Frequencies</h3>
<h4>tobacco$gender</h4>
<strong>Type</strong>: Factor
<br/>
<table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-freq-table ">
  <thead>
    <tr>
      <th colspan="2"></th>
      <th colspan="2" align="center" class="st-protect-top-border">Valid</th>
      <th colspan="2" align="center" class="st-protect-top-border">Total</th>
    </tr>
    <tr>
      <th align="center">gender</th>
      <th align="center">Freq</th>
      <th align="center">%</th>
      <th align="center">% Cum.</th>
      <th align="center">%</th>
      <th align="center">% Cum.</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th align="center" class="st-protect-top-border">F</th>
      <td align="center">489</td>
      <td align="center">50.00</td>
      <td align="center">50.00</td>
      <td align="center">48.90</td>
      <td align="center">48.90</td>
    </tr>
    <tr>
      <th align="center" class="st-protect-top-border">M</th>
      <td align="center">489</td>
      <td align="center">50.00</td>
      <td align="center">100.00</td>
      <td align="center">48.90</td>
      <td align="center">97.80</td>
    </tr>
    <tr>
      <th align="center" class="st-protect-top-border">&lt;NA&gt;</th>
      <td align="center">22</td>
      <td align="center"></td>
      <td align="center"></td>
      <td align="center">2.20</td>
      <td align="center">100.00</td>
    </tr>
    <tr>
      <th align="center" class="st-protect-top-border">Total</th>
      <td align="center">1000</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
      <td align="center">100.00</td>
    </tr>
  </tbody>
</table>
<p><p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.9.3 (<a href='https://www.r-project.org/'>R</a> version 3.5.3)<br/>2019-04-18</p></p>
</div><!--/html_preserve-->

---

## skimr

```
library(skimr)
skim(df)
```

---

## DataExplorer

```
library(DataExplorer)
DataExplorer::create_report(df)
```


[![](https://static1.squarespace.com/static/58eef8846a4963e429687a4d/t/5bdfc2fb4d7a9c04ee50b7aa/1541391160702/dataExplorerGifLg.gif?format=1500w)](https://www.littlemissdata.com/blog/simple-eda)



---

## Grafikler


```r
# library(ggplot2)
# library(mosaic)
# mPlot(irisdata)
```

---



```r
ctable(tobacco$gender, tobacco$smoker, style = 'rmarkdown')
```

### Cross-Tabulation, Row Proportions  
#### gender * smoker  
**Data Frame:** tobacco  

|        |        |             |             |               |
|-------:|-------:|------------:|------------:|--------------:|
|        | smoker |         Yes |          No |         Total |
| gender |        |             |             |               |
|      F |        | 147 (30.1%) | 342 (69.9%) |  489 (100.0%) |
|      M |        | 143 (29.2%) | 346 (70.8%) |  489 (100.0%) |
| \<NA\> |        |   8 (36.4%) |  14 (63.6%) |   22 (100.0%) |
|  Total |        | 298 (29.8%) | 702 (70.2%) | 1000 (100.0%) |

---



```r
print(ctable(tobacco$gender, tobacco$smoker), method = 'render')
```

<!--html_preserve--><div class="container st-container">
<h3>Cross-Tabulation, Row Proportions</h3>
<h4>gender * smoker</h4>
<strong>Data Frame</strong>: tobacco
<br/>
<table class="table table-bordered st-table st-table-bordered st-cross-table ">
<thead>
<tr>
<th></th>
<th colspan="8" align="center" class="st-protect-top-border">smoker</th>
<th colspan="4"></th>
</tr>
<tr>
<td align="center">
<strong>gender</strong>
</td>
<th colspan="4" align="center">Yes</th>
<th colspan="4" align="center">No</th>
<th colspan="4" align="center">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<strong align="center">F</strong>
</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">147</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">30.1%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">342</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">69.9%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">489</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">100.0%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
</tr>
<tr>
<td>
<strong align="center">M</strong>
</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">143</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">29.2%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">346</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">70.8%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">489</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">100.0%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
</tr>
<tr>
<td>
<strong align="center">&lt;NA&gt;</strong>
</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">8</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">36.4%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">14</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">63.6%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">22</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">100.0%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
</tr>
<tr>
<td>
<strong align="center">Total</strong>
</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">298</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">29.8%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">702</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">70.2%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
<td align="right" style="padding:0 0 0 15px;border-right:0;text-align:right">1000</td>
<td align="left" style="padding:0 1px 0 4px;border-left:0;border-right:0;text-align:left">(</td>
<td align="left" style="padding:0;border-left:0;border-right:0;text-align:right">100.0%</td>
<td align="left" style="padding:0 15px 0 1px;border-left:0;text-align:right">)</td>
</tr>
</tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.9.3 (<a href='https://www.r-project.org/'>R</a> version 3.5.3)<br/>2019-04-18</p>
</div><!--/html_preserve-->

```
descr(tobacco, style = 'rmarkdown')

print(descr(tobacco), method = 'render', table.classes = 'st-small')

dfSummary(tobacco, style = 'grid', plain.ascii = FALSE)

print(dfSummary(tobacco, graph.magnif = 0.75), method = 'render')
```


---



<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Here, building up a <a href="https://twitter.com/hashtag/ggplot2?src=hash&amp;ref_src=twsrc%5Etfw">#ggplot2</a> as slowly as possible, <a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a>.  Incremental adjustments.  <a href="https://twitter.com/hashtag/rstatsteachingideas?src=hash&amp;ref_src=twsrc%5Etfw">#rstatsteachingideas</a> <a href="https://t.co/nUulQl8bPh">pic.twitter.com/nUulQl8bPh</a></p>&mdash; Gina Reynolds (@EvaMaeRey) <a href="https://twitter.com/EvaMaeRey/status/1029104656763572226?ref_src=twsrc%5Etfw">August 13, 2018</a></blockquote><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


---


[![](https://raw.githubusercontent.com/dreamRs/esquisse/master/man/figures/esquisse.gif)](https://github.com/dreamRs/esquisse)


<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Dreaming of a fancy <a href="https://twitter.com/hashtag/Rstats?src=hash&amp;ref_src=twsrc%5Etfw">#Rstats</a> <a href="https://twitter.com/hashtag/ggplot?src=hash&amp;ref_src=twsrc%5Etfw">#ggplot</a> <a href="https://twitter.com/hashtag/dataviz?src=hash&amp;ref_src=twsrc%5Etfw">#dataviz</a> but still scared of typing <a href="https://twitter.com/hashtag/code?src=hash&amp;ref_src=twsrc%5Etfw">#code</a>? <a href="https://twitter.com/_pvictorr?ref_src=twsrc%5Etfw">@_pvictorr</a> esquisse package has you covered <a href="https://t.co/1vIDXcVAAF">https://t.co/1vIDXcVAAF</a> <a href="https://t.co/RlTkptnrNv">pic.twitter.com/RlTkptnrNv</a></p>&mdash; Radoslaw Panczak (@RPanczak) <a href="https://twitter.com/RPanczak/status/1047019588658040832?ref_src=twsrc%5Etfw">October 2, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


---

## Tablolar







---

# Bazı arayüzler

Link

## Rcmdr

```
library(Rcmdr)

Rcmdr::Commander()

```


- A Comparative Review of the R Commander GUI for R

http://r4stats.com/articles/software-reviews/r-commander/


---

## jamovi

https://www.jamovi.org/

![![](https://www.jamovi.org/assets/main-screenshot.png)](https://www.jamovi.org/)


https://blog.jamovi.org/2018/07/30/rj.html

![![](https://blog.jamovi.org/assets/images/rj.png)](https://blog.jamovi.org/2018/07/30/rj.html)

---

# R nereden öğrenilir


---

# Sonraki Konular

- RStudio ile GitHub
- Hipotez testleri
- R Markdown ve R Notebook ile tekrarlanabilir rapor


-----

# Geri Bildirim

- Geri bildirim için tıklayınız: _[Geri bildirim formu](https://goo.gl/forms/YjGZ5DHgtPlR1RnB3)_


---

<script id="dsq-count-scr" src="//https-sbalci-github-io.disqus.com/count.js" async></script>

<div id="disqus_thread"></div>
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://https-sbalci-github-io.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

---


\pagebreak

---

```
# Save Final Data

saved data after analysis to `Data-After-Analysis.xlsx`.

saveRDS(mydata, "Data-After-Analysis.rds")

writexl::write_xlsx(mydata, "Data-After-Analysis.xlsx")

file.info("Data-After-Analysis.xlsx")$ctime

```

---

\pagebreak


# Libraries Used


```r
citation()
```

```
## 
## To cite R in publications use:
## 
##   R Core Team (2019). R: A language and environment for
##   statistical computing. R Foundation for Statistical Computing,
##   Vienna, Austria. URL https://www.R-project.org/.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {R: A Language and Environment for Statistical Computing},
##     author = {{R Core Team}},
##     organization = {R Foundation for Statistical Computing},
##     address = {Vienna, Austria},
##     year = {2019},
##     url = {https://www.R-project.org/},
##   }
## 
## We have invested a lot of time and effort in creating R, please
## cite it when using it for data analysis. See also
## 'citation("pkgname")' for citing R packages.
```

```
citation("tidyverse")
citation("foreign")
citation("tidylog")
citation("janitor")
citation("jmv")
citation("tangram")
citation("finalfit")
citation("summarytools")
citation("ggstatplot")
citation("readxl")
```





---



```r
report::cite_packages(session = sessionInfo())
```

```
## Warning in citation(pkg_name): no date field in DESCRIPTION file of package
## 'summarytools'
```

                                                                                                                                                   References
1         Dominic Comtois (2019). summarytools: Tools to Quickly and Neatly Summarize Data. R package version 0.9.3. https://github.com/dcomtois/summarytools
2 Hadley Wickham, Jim Hester and Romain Francois (2018). readr: Read Rectangular Text Data. R package version 1.3.1. https://CRAN.R-project.org/package=readr


---




```r
sessionInfo()
```

```
## R version 3.5.3 (2019-03-11)
## Platform: x86_64-apple-darwin15.6.0 (64-bit)
## Running under: macOS Mojave 10.14.4
## 
## Matrix products: default
## BLAS: /Library/Frameworks/R.framework/Versions/3.5/Resources/lib/libRblas.0.dylib
## LAPACK: /Library/Frameworks/R.framework/Versions/3.5/Resources/lib/libRlapack.dylib
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] summarytools_0.9.3 readr_1.3.1       
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_1.0.1             lubridate_1.7.4        mvtnorm_1.0-10        
##  [4] lattice_0.20-38        tidyr_0.8.3            zoo_1.8-5             
##  [7] assertthat_0.2.1       digest_0.6.18          R6_2.4.0              
## [10] correlation_0.1.0      plyr_1.8.4             ggridges_0.5.1        
## [13] backports_1.1.4        evaluate_0.13          coda_0.19-2           
## [16] estimate_0.1.0         ggplot2_3.1.1          pillar_1.3.1          
## [19] rlang_0.3.4            lazyeval_0.2.2         multcomp_1.4-10       
## [22] performance_0.0.0.9000 magick_2.0             Matrix_1.2-17         
## [25] checkmate_1.9.1        rmarkdown_1.12         labeling_0.3          
## [28] splines_3.5.3          stringr_1.4.0          pander_0.6.3          
## [31] RCurl_1.95-4.12        munsell_0.5.0          compiler_3.5.3        
## [34] scatr_1.0.1            xfun_0.6               parameters_0.1.0      
## [37] pkgconfig_2.0.2        jmvcore_0.9.6.4        jmv_0.9.6             
## [40] htmltools_0.3.6        tcltk_3.5.3            insight_0.2.0.9000    
## [43] tidyselect_0.2.5       tibble_2.1.1           codetools_0.2-16      
## [46] matrixStats_0.54.0     crayon_1.3.4           dplyr_0.8.0.1         
## [49] withr_2.1.2            MASS_7.3-51.4          bitops_1.0-6          
## [52] grid_3.5.3             xtable_1.8-3           gtable_0.3.0          
## [55] bayestestR_0.1.1       magrittr_1.5           scales_1.0.0          
## [58] estimability_1.3       stringi_1.4.3          pryr_0.1.4            
## [61] rapportools_1.0        boot_1.3-20            sandwich_2.5-1        
## [64] cowplot_0.9.4          TH.data_1.0-10         rjson_0.2.20          
## [67] tools_3.5.3            report_0.1.0           glue_1.3.1            
## [70] purrr_0.3.2            hms_0.4.2              emmeans_1.3.3         
## [73] survival_2.44-1.1      yaml_2.2.0             colorspace_1.4-1      
## [76] knitr_1.22
```

---

\pagebreak



# Notes  

Completed on 2019-04-18 01:51:56.  

Serdar Balci, MD, Pathologist  
d  rserdarbalci@gmail.com  
https://rpubs.com/sbalci/CV   

  
https://sbalci.github.io/  
https://github.com/sbalci  
---



