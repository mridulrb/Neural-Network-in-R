#ifelse statement 
x <- 5
if(x > 0){
  print("Non-negative number")
  } else {
       print("Negative number")
  }

#for loop statement 
for (year in 2010:2015){
  print(paste("The year is", year))
}

#while loop statement
i <- 1
while (i < 6) {
  print(i)
  i = i+1
}

#break statement
x <- 1:5
for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}

#next statement
x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}

#function 
new.function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}

new.function(6)