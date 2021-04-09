library(tidyverse)
#create a vector with 150 random values between 0 and 100
vpoints<-sample(0:100, 150, replace=T)
vpoints
#change values based on intervals
mark <- cut(vpoints, breaks = 10, labels <- c(1:10), right = FALSE)
mark
#variable numTens represents how many students got a 10
numTens <- sum(mark == 10)
numTens
#create 150 unique names with consonants for the first letter, vowels for the second and 2 arbitrary letters at the end
CONSONANT <- LETTERS[-c(1, 5, 9, 15, 21)]
vowel <- letters[c(1, 5, 9, 15, 21)]
name <- "" 
for (i in 1:150)
  name[i] <- paste(c(sample(CONSONANT,1), sample(vowel,1), sample(letters,2)), sep="", collapse = "")
name
#determine if the student passed bysed on the mark
passed <- cut(as.numeric(mark), breaks = 2, labels <- c("FALSE", "TRUE"))
passed
#create a dataframe that will hold the name, points, and grade of a student as well as if the student passed
df <- data.frame("Name" = name, "Points" = vpoints, "Grade" = mark, "Pass" = passed)
#return the names and grades of students that passed
test <- filter(df, Pass == "TRUE")
test
return <- test[ , c(1,3)]
return
