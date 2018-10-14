---
title: "R1-Introduction"
author: "Chao Jon Yann"
date: "9 lokakuuta 2018"
output: pdf_document
---

# *Readme* before starting!

Welcome to Environmental Data Sciences introducing R session. In this
session we start from scratch and assume no prior knowledge of R. Fill in
the blanks as you go to test your understanding.

Used R before?

Did you glance at the first section and think, this is very basic? 

It could still be worth going through the whole notebook or 
just particular sections; there might even be something you skipped over
first time round. 

On the other hand if you understand and can explain each of the 
following terms and how they relate to R, then perhaps this tutorial is
not for you. In this session we will go over:

* variable and operators 
* data types
* objects  
* Data structures 
* lists 
* factors
* dataframes 
* matrices
* functions 
* applying functions.     

By the end of the session you should know what each of these terms
refers to. 

As an aside, the *dictionary* of programming languages
borrows heavily from logic and mathematics. This is especially true
for R, which is a language desgined with mathematics (statistics) in
mind. Knowing the mathematical meaning of a word, e.g. a matrix is 
(imprecisely) a grid of numbers, helps with knowing what R is 
aiming for.


Let's get started!  

#1.Variables and operators

A **variable** is used to store your data or various information that could be
changed.

##1.1. Assign a variable using <- , ->or =
This is how we assign a variable using <- , ->or =


```r
x<-1
#now we want to show the contents of x using print function 
print(x)
```

```
## [1] 1
```


```r
y=c(12,3)
print(y)
```

```
## [1] 12  3
```


```r
c('h','i',9)->z
print(z)
```

```
## [1] "h" "i" "9"
```

##1.2. Give your variable a name!
The name of a variable should be unique, and can consist of letters, numbers, underline or dots. The
variable should start with: a letter or a dot (this dot cannot followed by a number), but cannot start
with a number or underline.
For example, can you find which variable name is not correct?

x.1<-1 ; x_2<-2 ;.x<-3 ; 4y<-5 ; *_z<-6; _2<-7, .2a<-8*

Try here:



##1.3. Data types

Each variables has a **data types**. The data type of a variable is its
defining quality, it is what it is!

In R, there are 4 basic data types that we typically use:

character: ‘a’ 

numeric: 2,0, or 5.6 

integer: 4L (the L means R will store 4 as integer) 

logical: TRUE, FALSE

The data types of R objects can be the variable types. These variables can consist of a dataset.
Try to find the type of above mentioned variables x,y,z using class(), and the structure of x,y,z using str()
The common used structure of the dataset in R include:
vector (basis), factor, matrix,array, data frame and list.

##1.4. Operators 

we can use operator to. . .

###1.4.1.Arithmetic operators

add, substract, mutiply, divide, equal, expeonent: 

+, -, *, /, =, ^ 


```r
math1=5+6*8-9+5/6
print(math1)
```

```
## [1] 44.83333
```

```r
4^3
```

```
## [1] 64
```

###1.4.2.Relational operators

great, less, equal: **>, <, >=, <=, ==, !=**


```r
34!=5
```

```
## [1] TRUE
```

###1.4.3. Logical operators

and, or, not:       **&, |, !** 




###1.4.4.Miscellaneous Operators

colon operator: **:**, generate a sequence of numbers


```r
1:10
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

%in%: detect if the elements in **A** also in **B**


```r
A<-1:10
B<-3:6
print(A%in%B)
```

```
##  [1] FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
```


### Objects

#2. Data structures and Control flow


##2.1. Data structures are ...

Data structures are ...

###2.1.1. A vector is the first basic data structure.

Vectors are one dimension array that can consist of numberic, character,or logical data. All the elements inside a vector should be one data type (numberic, character,or logical).

A vector is formed using function: c(), which combines all the arguments into one common type.

For example (1) Create a vector named as a, store letters of b to e into a, (2) print a, (3) check type of a, and (4) structure of a.


```r
#(1)create a character vector: a
a<-c('b','c','d','e')
#(2)print: a
print(a)
```

```
## [1] "b" "c" "d" "e"
```


```r
#(3)check type of a
class(a)
```

```
## [1] "character"
```


```r
#(4)check structure of a
str(a)
```

```
##  chr [1:4] "b" "c" "d" "e"
```

Try to (1) create a vector named as a1, store first 10 numbers into a1,(2) print a1, (3) check type of a1, and
(4) structure of a1.
Which type of above mentiond variable z (z<-c(‘h’,‘i’,9))?



###2.1.2. A matix is a two-dimentsion array in where all the elements should be same type

Matices are created by matrix() function.


```r
d<-c(1:20)
#create a matrix
matr1<-matrix(d,nrow = 5,ncol=4,byrow = T,
              dimnames =list(c('r1','r2','r3','r4','r5'),
                             c('c1','c2','c3','c4')))
matr1
```

```
##    c1 c2 c3 c4
## r1  1  2  3  4
## r2  5  6  7  8
## r3  9 10 11 12
## r4 13 14 15 16
## r5 17 18 19 20
```


```r
str(matr1)
```

```
##  int [1:5, 1:4] 1 5 9 13 17 2 6 10 14 18 ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : chr [1:5] "r1" "r2" "r3" "r4" ...
##   ..$ : chr [1:4] "c1" "c2" "c3" "c4"
```

###2.1.3. An array is similar to a matrix, but can have more than two dimensions.

Arrays are created by array() function


```r
x<-c('a1','a2','a3')
y<-c('b1','b2')
z<-c('c1','c2','c3','c4','c5')
mydata<-c(1:30)
array1<-array(mydata,c(3,2,5),
dimnames = list(x,y,z))
array1
```

```
## , , c1
## 
##    b1 b2
## a1  1  4
## a2  2  5
## a3  3  6
## 
## , , c2
## 
##    b1 b2
## a1  7 10
## a2  8 11
## a3  9 12
## 
## , , c3
## 
##    b1 b2
## a1 13 16
## a2 14 17
## a3 15 18
## 
## , , c4
## 
##    b1 b2
## a1 19 22
## a2 20 23
## a3 21 24
## 
## , , c5
## 
##    b1 b2
## a1 25 28
## a2 26 29
## a3 27 30
```

###2.1.4. A list can contain mant types of datasets.

A list is ...


```r
alist<-list(c('b','c','d','e'),
            c('control','control','drought'),
            c(1:10),
            c(1L,3L),
            88,
            '%&()',
            c(0.3,2.34,6.57,0),
            3+9,
            c('4','9'),
            list(c(1,2,'g')))
print(alist)
```

```
## [[1]]
## [1] "b" "c" "d" "e"
## 
## [[2]]
## [1] "control" "control" "drought"
## 
## [[3]]
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## [[4]]
## [1] 1 3
## 
## [[5]]
## [1] 88
## 
## [[6]]
## [1] "%&()"
## 
## [[7]]
## [1] 0.30 2.34 6.57 0.00
## 
## [[8]]
## [1] 12
## 
## [[9]]
## [1] "4" "9"
## 
## [[10]]
## [[10]][[1]]
## [1] "1" "2" "g"
```


```r
class(alist)
```

```
## [1] "list"
```


```r
str(alist)
```

```
## List of 10
##  $ : chr [1:4] "b" "c" "d" "e"
##  $ : chr [1:3] "control" "control" "drought"
##  $ : int [1:10] 1 2 3 4 5 6 7 8 9 10
##  $ : int [1:2] 1 3
##  $ : num 88
##  $ : chr "%&()"
##  $ : num [1:4] 0.3 2.34 6.57 0
##  $ : num 12
##  $ : chr [1:2] "4" "9"
##  $ :List of 1
##   ..$ : chr [1:3] "1" "2" "g"
```

##2.4. Conditions and Loops using vector: if, for, while, repeat

###2.4.1. conditions

if (condition) {statement} or if (condition) statement


```r
x<-10
if (x<5) {print('X is smaller than 5')}
if (x>5) print('X is larger than 5')
```

```
## [1] "X is larger than 5"
```

if (condition) { statement1 } else { statement2 }
or
if (condition) { statement1 } else if (condition2){ statement2 } else if (condition3){ statement3 } else if
(condition4){ statement4 } else { statement5 }


```r
y<-20
if (y>10) {
print ('y is larger than 10')
} else {
print('y is smaller than 10')
}
```

```
## [1] "y is larger than 10"
```


```r
y<-20
if (y<0) {
print ('y is a negative number')
} else if (y==0) {
print('y is 0')
} else if (y>0 & y <10) {
print('y is greater than 0 and smaller than 10')
} else if (y==10) {
print ('y is 10')
} else if (y>10 & y <20){
print ('y is greater than 10 and smaller than 20')
} else {
print ('y is 20')
}
```

```
## [1] "y is 20"
```

ifesle (statement, a, b) #if statement is true, print a, if false print b


```r
z<-c(1,10,30)
ifelse (z==10|z>15,'yes','no')
```

```
## [1] "no"  "yes" "yes"
```

##2.4.2. Loop

for (variable in sequence) {statement}



```r
x<-c(1:10)
y<-2
for (i in x){
 z<-y+x
}
print(z)
```

```
##  [1]  3  4  5  6  7  8  9 10 11 12
```

while (condition) {statement}


```r
x<-2
while(x<10) {
  print('yes')
  x=x+2
  }
```

```
## [1] "yes"
## [1] "yes"
## [1] "yes"
## [1] "yes"
```

repeat()



#2.5 Advanced data structure: Dataframe 

Dataframe is the main and fundamental data structure used in R

Dataframes are generated by data.frame() function, which has silimar format with the dataset we use in Excel, SPASS, SigmaPlot etc.

In a dataframe: (1)the columns are variables, the rows are observations (the row numbers will be object numbers); (2) all the variables are of same length.


```r
#create a dataframe
x=c(1:3)
y=c('a','b','c')
z=c(30,40,50)
df1<-data.frame(x,y,z)
#print df1
print(df1)
```

```
##   x y  z
## 1 1 a 30
## 2 2 b 40
## 3 3 c 50
```


```r
#check the structure of df1
str(df1)
```

```
## 'data.frame':	3 obs. of  3 variables:
##  $ x: int  1 2 3
##  $ y: Factor w/ 3 levels "a","b","c": 1 2 3
##  $ z: num  30 40 50
```

Try to create a new dataframe names as mydata, which has 2 variables and 4 objects:



#3. Additional data type: factors

Factor is created using a vector

All the elements inside this factor will be character. A factor can efficiently store characters, because only once per character is stored.


```r
#create a vector
treatment<-c('control','control','drought','nutrient','drought')
#check the type of treatment
class(treatment)
```

```
## [1] "character"
```


```r
#check the structure of treatment
str(treatment)
```

```
##  chr [1:5] "control" "control" "drought" "nutrient" "drought"
```

Now let’s create a factor and check the class and structure of this factor. 

Can you see the difference between **treatment** and **treatment.factor**?


```r
#create a factor
treatment.factor<-factor(treatment)
#check the type
class(treatment.factor)
```

```
## [1] "factor"
```


```r
#check the structure
str(treatment.factor)
```

```
##  Factor w/ 3 levels "control","drought",..: 1 1 2 3 2
```

Yes, the numbers of these unique character are called levels in R, which can be examined using **levels()** function


```r
#check levels of treatment.factor
levels(treatment.factor)
```

```
## [1] "control"  "drought"  "nutrient"
```

Try to create a factor named as **plantnum.factor** which is from a vector **plant.number** contains 5 elements
c(1,2,3,3,2). How many levels **plantnum.factor** have, and what are they? Can you see the difference between **plant.number** and **plantnum.factor**?




#4. Functions and Applying functions

Functions are central to the way R works; think of them as the
building blocks of larger programs. Just like building blocks,
functions are elements of a larger whole. If you want to take the next
step beyond writing simple scripts, then functions are your friend!

In simple terms, a function takes an input, does something to it, 
then returns something else which is the results of that something.  
In R language, functions consist of *arguments* which are the input,
the *body* which is the bit where things happen, and the *name*, which
is self evident! 

##4.1. built-in functions

Most things in R involve functions, typically these are built-in to 
the language or perhaps part of a package that you have installed.

When you print something to the screen then you are using the **print** 
function:

```r
print("print is a commonly used function!")
```

```
## [1] "print is a commonly used function!"
```

Sometimes there is more than one function that achieves a similar result.
Can you think of another function that prints messages to the screen?


##4.2. User-defined functions

##4.3. 



##4.4. Extra functions and other stuff

cat() is similar print(paste())


```r
x<-2
#print('This is',x), this will generate an error
#but car can do it
cat('This is',x)
```

```
## This is 2
```


```r
#or use paste() function
print(paste('This is', x))
```

```
## [1] "This is 2"
```




