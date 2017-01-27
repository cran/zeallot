## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = '#>')

library(zeallot)

## ------------------------------------------------------------------------
{ lat : lng } %<-% list(38.061944, -122.643889)

## ------------------------------------------------------------------------
lat
lng

## ------------------------------------------------------------------------
lat : lng %<-% c(38.061944, -122.643889)
lat
lng

## ------------------------------------------------------------------------
min_wt : q1_wt : med_wt : mean_wt : q3_wt : max_wt %<-% summary(mtcars$wt)
min_wt
q1_wt
med_wt
mean_wt
q3_wt
max_wt

## ---- error=TRUE---------------------------------------------------------
{ stg1 : stg2 : stg3 } %<-% list("Moe", "Donald")

## ---- error=TRUE---------------------------------------------------------
{ stg1 : stg2 : stg3 } %<-% list("Moe", "Larry", "Curley", "Donald")

## ------------------------------------------------------------------------
#
# A function which returns a list of 2 numeric values.
# 
coords_list <- function() {
  list(38.061944, -122.643889)
}

{ lat : lng } %<-% coords_list()
lat
lng

## ------------------------------------------------------------------------
#
# Convert cartesian coordinates to polar
#
to_polar = function(x, y) {
  c(sqrt(x^2 + y^2), atan(y / x))
}

radius : angle %<-% to_polar(12, 5)
radius
angle

## ------------------------------------------------------------------------
inter : slope %<-% coef(lm(mpg ~ cyl, data = mtcars))
inter
slope

## ---- eval = require('purrr')--------------------------------------------
safe_log <- purrr::safely(log)

## ---- eval = require('purrr')--------------------------------------------
pair <- safe_log(10)
pair$result
pair$error

## ---- eval = require('purrr')--------------------------------------------
pair <- safe_log('donald')
pair$result
pair$error

## ---- eval = require('purrr')--------------------------------------------
{ res : err } %<-% safe_log(10)
res
err

## ------------------------------------------------------------------------
{ mpg : cyl : disp : hp } %<-% mtcars[, 1:4]

head(mpg)

head(cyl)

head(disp)

head(hp)

## ------------------------------------------------------------------------
quartet <- lapply(1:4, function(i) anscombe[, c(i, i + 4)])

{ an1 : an2 : an3 : an4 } %<-% lapply(quartet, head, n = 3)

an1

an2

an3

an4

## ------------------------------------------------------------------------
{a : { b : c } : d } %<-% list('begin', list('middle1', 'middle2'), 'end')
a
b
c
d

## ---- error=TRUE---------------------------------------------------------
{a : { b : c : x} : d } %<-% list('begin', list('middle1', 'middle2'), 'end')

## ------------------------------------------------------------------------
ch1 : ch2 : ch3 %<-% 'abc'
ch1
ch2
ch3

## ------------------------------------------------------------------------
y : m : d %<-% Sys.Date()
y
m
d

## ------------------------------------------------------------------------
f <- lm(mpg ~ cyl, data = mtcars)

{ fcall : fterms : resids : ...rest } %<-% summary(f)

fcall

fterms

head(resids)

## ------------------------------------------------------------------------
str(rest)

## ---- error = TRUE-------------------------------------------------------
{ fcall : fterms : resids : rest } %<-% summary(f)

## ------------------------------------------------------------------------
{ ...skip : e : f } %<-% list(1, 2, 3, 4, 5)
skip
e
f

## ------------------------------------------------------------------------
{ begin : ...middle : end } %<-% list(1, 2, 3, 4, 5)
begin
middle
end

## ------------------------------------------------------------------------
min_wt : . : . : mean_wt : . : max_wt %<-% summary(mtcars$wt)
min_wt
mean_wt
max_wt

## ------------------------------------------------------------------------
{begin: ....: end} %<-% list('hello', 'blah', list('blah'), 'blah', 'world!')
begin
end

## ------------------------------------------------------------------------
{ begin : . : ...middle : end } %<-% as.list(1:5)
begin
middle
end

## ------------------------------------------------------------------------
first : last %<-% c('Ai', 'Genly')
first
last

first : last %<-% c(last, first)
first
last

## ------------------------------------------------------------------------
cat <- 'meow'
dog <- 'bark'

cat : dog : fish %<-% c(dog, cat, dog)
cat
dog
fish

