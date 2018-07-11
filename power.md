R scripts
================
Marcello Gallucci, Giulio Constantini & Marco Perugini

Introduction
============

In this page one can found all the R functions discussed in Perugini, Gallucci, Constantini (2018), A practical primer to power analysis for simple experimental designs. **International Review of Social Psychology**. [rewf here](here). Examples are taken from the papers. In all the examples that require multiple lines of code the user needs to update only the variables listed before `### end of input ###` comment. The results are computed automatically for the required N. Small changes in the code are required to compute other power parameters.

t-test
======

Independent Samples
-------------------

A very simple function for independent samples t-test. To use with Cohen's d, set `sd=1` and put `delta=d`, where `d` is your effect size.

``` r
power.t.test(power=.80, sig.level=.05, delta=.5, sd=1)
```

    ## 
    ##      Two-sample t test power calculation 
    ## 
    ##               n = 63.76576
    ##           delta = 0.5
    ##              sd = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE: n is number in *each* group

Required n for each group should be rounded up to the first whole number. Exactly one of `n`, `delta`, `sd`, `power`, and `sig.level` must be NULL. The NULL parameter is estimated by the function. Thus, post-hoc analysis is done omitting `power` and including `n`.

``` r
power.t.test(n=64, sig.level=.05, delta=.5, sd=1)
```

    ## 
    ##      Two-sample t test power calculation 
    ## 
    ##               n = 64
    ##           delta = 0.5
    ##              sd = 1
    ##       sig.level = 0.05
    ##           power = 0.8014586
    ##     alternative = two.sided
    ## 
    ## NOTE: n is number in *each* group

`?power.t.test` for all the other options.

Sensitivity analysis
--------------------

In the paper we suggested to look at the relationship between total sample size and effect size for a given power level (.80 in the example) and alpha (.05 in the example). In R this can be done as follows:

``` r
library("ggplot2")

N<-seq(20,140,by=20)

## end of input ##
dat<-data.frame(n=N)
for (i in seq(N)) {
   one.power<-power.t.test(power=.80, sig.level=.05, sd=1, n=N[i])
   dat$d[i]<-one.power$delta
}

plt<-ggplot(dat,aes(y=d,x=n, label = round(d,digits = 2))) +stat_smooth(method = "loess",se=FALSE)
plt<-plt+labs(x="Totale sample size",y="Effect size d")
plt<-plt+scale_x_continuous(breaks=seq(min(N),max(N),by=20))
plt<-plt+geom_label()
plt
```

![](github_files/figure-markdown_github/unnamed-chunk-3-1.png)

Paired Samples
--------------

Same function with the option `type = "paired"`

``` r
power.t.test(power=.80, sig.level=.05, delta=0.527, sd=1,type = "paired")
```

    ## 
    ##      Paired t test power calculation 
    ## 
    ##               n = 30.23788
    ##           delta = 0.527
    ##              sd = 1
    ##       sig.level = 0.05
    ##           power = 0.8
    ##     alternative = two.sided
    ## 
    ## NOTE: n is number of *pairs*, sd is std.dev. of *differences* within pairs

One way Analysis of Variance
============================

For all F-test related power analysis, it is generally better to use `pwr.f2.test()` function from [pwr package](https://cran.r-project.org/web/packages/pwr/index.html). The function uses *f*<sup>2</sup> as effect size, which is the square of the *f* used by GPower "ANOVA: Fixed effects, omnibus and one-way". Here we assume one has the *η*<sub>*p*</sub><sup>2</sup>, which in one-way ANOVA is the *R*<sup>2</sup>. For required N (total sample size) one needs to input also *k*, the number of groups defined by the independent variable.

``` r
library("pwr")

## input ##
etap<-.326
k<-8 # number of groups in the design
## end of input ##
f2=etap/(1-etap)
dfn<-k-1 # numerator degrees of freedom

(res<-pwr.f2.test(u = dfn,f2 = f2,sig.level = .05,power = .80))
```

    ## 
    ##      Multiple regression power calculation 
    ## 
    ##               u = 7
    ##               v = 29.31529
    ##              f2 = 0.4836795
    ##       sig.level = 0.05
    ##           power = 0.8

``` r
## required N ##
ceiling(res$v)+res$u+1
```

    ## [1] 38

Factorial Designs
=================

"Assume that in a 3 X 2 factorial design the researcher expects the interaction to explain around 10% of the variance. If the researcher expects no main effect, the proportion of residual variance is 1-.10=.90, so the pη2=.10."

method 1
--------

Here we keep using `pwr.f2.test` because it can be used for any F-test in the linear model. However, for prospective power (required total N) the function returns the required error degrees of freedom, so the required N must be approximate adding the effects degrees of freedom to the error degrees of freedom. The following code does it automatically.

``` r
library("pwr")

## input for interaction##
etap<-.10
k1<-3 # levels of the first factor
k2<-2 # levels of the second factor
## end of input ##

(f2=etap/(1-etap))
```

    ## [1] 0.1111111

``` r
dfn<-(k1-1)*(k2-1) # df for the interaction

(res<-pwr.f2.test(u = dfn,f2 = f2,sig.level = .05,power = .80))
```

    ## 
    ##      Multiple regression power calculation 
    ## 
    ##               u = 2
    ##               v = 86.77678
    ##              f2 = 0.1111111
    ##       sig.level = 0.05
    ##           power = 0.8

``` r
## required N ##
ceiling(res$v)+(k1*k2)-1
```

    ## [1] 92

``` r
## input for main effects##
etap<-.10
k1<-3 # levels of the first factor
k2<-2 # levels of the second factor
## end of input ##

(f2=etap/(1-etap))
```

    ## [1] 0.1111111

``` r
dfn<-(k1-1) # df for the main effect 1
(res<-pwr.f2.test(u = dfn,f2 = f2,sig.level = .05,power = .80))
```

    ## 
    ##      Multiple regression power calculation 
    ## 
    ##               u = 2
    ##               v = 86.77678
    ##              f2 = 0.1111111
    ##       sig.level = 0.05
    ##           power = 0.8

``` r
## required N ##
ceiling(res$v)+(k1*k2)-1
```

    ## [1] 92

``` r
dfn<-(k2-1) # df for the main effect 2
(res<-pwr.f2.test(u = dfn,f2 = f2,sig.level = .05,power = .80))
```

    ## 
    ##      Multiple regression power calculation 
    ## 
    ##               u = 1
    ##               v = 70.61137
    ##              f2 = 0.1111111
    ##       sig.level = 0.05
    ##           power = 0.8

``` r
## required N ##
ceiling(res$v)+(k1*k2)-1
```

    ## [1] 76

Method 2
--------

The package [easypower](https://cran.r-project.org/web/packages/easypower/index.html) provides short cuts for factorial ANOVA power analysis. It provides a dedicated function `n.multiway()` which simplifies computation of required N for main effects and interaction. It does not provide estimates for post-hoc power and other applications of power analysis.

``` r
library("easypower")
## input ##
etap<-.10
k1<-3
k2<-2
## end of input ##

main.eff1 <- list(name = "A", levels = k1, eta.sq = etap)
main.eff2 <- list(name = "C", levels = k2, eta.sq = etap)
int.eff1 <- list(name = "A*C", eta.sq = etap)
n.multiway(iv1 = main.eff1, iv2 = main.eff2, int1 = int.eff1)
```

    ## 
    ## The following sample size recommendations are for each treatment and all possible interactions.
    ## Sample sizes are calculated independently using the estimated effect size to achieve 
    ## the desired power level.
    ## 
    ## Desired power: 0.80
    ## Significance level: 0.05
    ## Effect size used in calculations: Cohen's f-squared
    ## Cutoffs: small = 0.01, med = 0.06, large = 0.14
    ## 
    ##  Treatment    Effect Size    Total    n per cell
    ##          A            0.1       93            16
    ##          C            0.1       77            13
    ##        A*C            0.1       93            16

Results are the same than *method 1* a part from rounding.

Power analysis for contrasts
----------------------------

### Generic Contrasts

Main effects and interaction for example in Table 2. They are all equivalent, so we go for the interaction. We compute the *f* as in the paper, but use *f*<sup>2</sup> as required by \`pwr.f2.

``` r
## input ##
means<-c(10,0,0,0)
sd=5
contInt<-c(1,-1,-1,1)

## end input ##

### contrast value
cvInt<-contInt%*%means

## Effect sizes ##

fInt<-cvInt/sqrt(length(means)*sum(contInt^2*sd^2))

#### expected N
res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=fInt^2)
ceiling(res$v)+length(means)
```

    ## [1] 36

Guessing the interaction effect size from one-way designs
---------------------------------------------------------

Consider the case in which the pattern of means in Table 3, case 1, in the paper is taken from a one-way design in which A1 and A2 show means equal to 5 and 2, respectively, and the same within groups variability (say equal to 1). Basically, the researcher observes in the literature a one-way design with only A as a factor and wishes to test the moderating effect of B in a 2 x 2 design. The B factor has two levels, that for simplicity we name “replicated” and “moderated”. The problem is to determine the power parameters of the expected interaction effect.

Means based method
------------------

``` r
# observed means #
A1<-c(5,2)
# expected means #
A2<-c(0,0)

sd=1
contInt<-c(1,-1,-1,1)

## end input ##

means<-c(A1,A2)
cvInt<-contInt%*%means

## Effect sizes ##

fInt<-cvInt/sqrt(length(means)*sum(contInt^2*sd^2))

#### expected N
res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=fInt^2)
ceiling(res$v)+length(means)
```

    ## [1] 19

### Percentage of moderation

Researcher should estimate the percentage of moderation, where 100% means full suppression of the effec, 200% full reversing of the effect.

``` r
# observed means #
A1<-c(5,2)
cont1<-c(1,-1)
l<-2 #levels of moderators
sd=1
# percentage of moderation
pm<-100

## end of input ##

k1<-length(A1)
k2<-length(A1)*l
f0<-(A1%*%cont1)/(sqrt(length(A1)*sum(cont1^2)*sd^2))

f<-(pm/100)*f0*sqrt(length(cont1)/(length(cont1)*l^2))

#### expected N
(res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=f^2))
```

    ## 
    ##      Multiple regression power calculation 
    ## 
    ##               u = 1
    ##               v = 14.12059
    ##              f2 = 0.5625
    ##       sig.level = 0.05
    ##           power = 0.8

``` r
ceiling(res$v)+length(cont1)*l
```

    ## [1] 19

### Paper example "An example of a more complex design"

Consider a researcher who wishes to design a moderation study based on an one-way design with four conditions implementing an increasing intensity of a stimulus, such that the observed pattern of mean shows a linear trend. In particular, the observed linear trend contrast has an p=.184, corresponding to a f=0.475.

``` r
### starting from eta-squared ###

# percentage of moderation
pm<-125
# observed parameters #
etap<-.184
cont<-c(-3,-1,1,3)
l<-2 # levels of moderator
### end of input ###

(f0<-sqrt(etap/(1-etap)))
```

    ## [1] 0.4748581

``` r
(f<-(pm/100)*f0*sqrt(length(cont1)/(length(cont1)*l^2)))
```

    ## [1] 0.2967863

``` r
#### expected N (total sample)
(res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=f^2))
```

    ## 
    ##      Multiple regression power calculation 
    ## 
    ##               u = 1
    ##               v = 89.0696
    ##              f2 = 0.08808211
    ##       sig.level = 0.05
    ##           power = 0.8

``` r
ceiling(res$v)+(length(cont)*l)
```

    ## [1] 98

The same results can be obtained if one anticipates all expected means and pooled standard deviation (tedious method)

``` r
Replicated<-c(5,9,16,20)
sd<-12.239
Expected<-c(5,3,2,1)
cont<-c(-3,-1,1,3)
## end of input ##
contInt<-c(cont,-cont)
means<-c(Replicated,Expected)

(f<-(contInt%*%means)/sqrt(length(contInt)*sum(contInt^2)*sd^2))
```

    ##           [,1]
    ## [1,] 0.2968879

``` r
#### expected N
res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=f^2)
ceiling(res$v)+length(cont1)*2
```

    ## [1] 94

Regression Analysis
===================

Any effect in simple and the multiple regression for which the *η*<sub>*p*</sub><sup>2</sup> is available can be evaluated witht he following code. here is an example for a regression with three predictors and a small effect size, according to Cohen's (Cohen, 1988) classification.

``` r
## input ##
etap<-0.02
k<-3 # number of predictors
## end of input ###
(f2<-etap/(1-etap))
```

    ## [1] 0.02040816

``` r
res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=f^2)
ceiling(res$v)+k
```

    ## [1] 93

Moderated regression
====================

Interaction between continuous and dichotomous predictors.
----------------------------------------------------------

The researcher needs to estimate the expected correlation between the continuous independent variable and the dependent variable for the two groups defined by the moderator.

``` r
## input ##
ra<-.0
rb<-.50
k<-3 # number of coefficients in the regression (not considering the intercept)
## end of input ##

(bint<-abs(ra-rb))
```

    ## [1] 0.5

``` r
(f2<-bint^2/(2*(2-ra^2-rb^2)))
```

    ## [1] 0.07142857

``` r
## expected N ###
res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=f2)
ceiling(res$v)+k+1
```

    ## [1] 114

Interaction between continuous predictors
-----------------------------------------

The researcher needs to estimate the expected correlation between the continuous independent variables and the dependent variable, and the change of correlation from the average value of the moderator to one standard deviation above average of the moderator. We assume here that there

``` r
## input ##
r_yx<-.35
r_ym<-.25
r_change<-.175
k<-3 # number of coefficients in the regression (not considering the intercept)
## end of input ##

(f2<-r_change^2/(1-r_yx^2-r_ym^2))
```

    ## [1] 0.03757669

``` r
## expected N ###
res<-pwr.f2.test(u=1,power=.80,sig.level = .05, f2=f2)
ceiling(res$v)+k+1
```

    ## [1] 213

Mediation
=========

### method based on Sobel test

``` r
library("powerMediation")
### input ###
# a, b,  are the coefficients as in standard mediational path diagram
a<-.8186
b<-.4039
c<- .4334
### end of input ###

# compute sigma.epsilon
sigma.epsilon<-sqrt(1-(b^2+c^2+2*a*b*c))

## results: expected N
res<-ssMediation.Sobel(power = .80,  theta.1a = .8186, lambda.a = .4039, sigma.x = 1, sigma.m = 1, sigma.epsilon = .6020)
```

    ## [1] 56.71795

``` r
ceiling(res$n)
```

    ## [1] 57

### method based on bootstrap analysis

The code below allows computing the power achieved with a certain sample size, that must be indicated as nobs below. The achieved power for the Indirect/Mediation effect (ab) using a sample of size nobs can be read under column "Power".

The following code is based on boostrap and it takes a lot of time (several hours) to run. Be extremely patient (or leave it running at night). If you have a multi-core processor, function power.boot implements parallel processing to speed-up computations. See ?power.boot for details.

``` r
library("bmem")
### input ###
# a, b,  are the coefficients as in standard mediational path diagram, n is the sample size-
a<-.8186
b<-.4039
c<- .4334
nobs <- 100

### end of input ###

model <- paste(c(
  'M ~ a*X + start(',a,')*X',
  'Y ~ b*M + c*X + start(',b,') * M + start(.4334)*X',
  'X ~~ start(1)*X',
  'M ~~ start(1)*M',
  'Y ~~ start(1)*Y'), collapse = "\n"
)
set.seed(1234)
power.result <- power.boot(model, indirect = 'ab := a*b', nobs = nobs) 
summary(power.result)
```

    ## Basic information:
    ##   Esimation method                                  ML
    ##   Standard error                              standard
    ##   Number of requested bootstrap                   1000
    ##   Number of requested replications                1000
    ##   Number of successful replications               1000
    ##                        True  Estimate      MSE      SD     Power Power.se Coverage
    ## Regressions:
    ##   M ~
    ## Basic information:
    ## X         (a)      0.819    0.826    0.100    0.104    1.000    0.000    0.942
    ## Y ~
    ## M         (b)      0.404    0.402    0.101    0.105    0.966    0.006    0.933
    ## X         (c)      0.433    0.431    0.131    0.129    0.897    0.010    0.946
    ## 
    ## Variances:
    ## X                  1.000    0.989    0.136    0.135    1.000    0.000    0.927
    ## M                  1.000    0.978    0.135    0.135    1.000    0.000    0.921
    ## Y                  1.000    0.974    0.134    0.140    1.000    0.000    0.894
    ## 
    ## Indirect/Mediation effects:
    ## ab                 0.331    0.332    0.094    0.095    0.966    0.006    0.928
