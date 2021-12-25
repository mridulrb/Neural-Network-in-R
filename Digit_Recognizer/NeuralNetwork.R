cat("\nSTART\n")
startTime = proc.time()[3]
startTime

library(nnet)

modelName <- "neuralNetwork"
InputDataFileName="mnist_train.csv"

trainDataset <- read.csv(InputDataFileName)      # Read the datafile
trainDataset <- trainDataset[sample(nrow(trainDataset)),]  # Shuffle the data row wise

head(trainDataset)   # Show Top 6 records
nrow(trainDataset)   # Show number of records
names(trainDataset)  # Show fields names or columns names

#--------------------------------------------------------------
# Step 1: Choose Target variable
#--------------------------------------------------------------
cat("\nStep 1: Choose Target Variable")
target  <- names(trainDataset)[1] #label name
target



#--------------------------------------------------------------
# Step 2: Choose inputs Variables
#--------------------------------------------------------------
cat("\nStep 2: Choose Inputs Variable")
inputs <- setdiff(names(trainDataset),target)
inputs
length(inputs)
#--------------------------------------------------------------
# Step 3: Select Training Data Set
#--------------------------------------------------------------
cat("\nStep 3: Select training dataset")

head(trainDataset)    # Show Top 6 records
nrow(trainDataset)    # Show number of train Dataset

X=trainDataset[,-1] # contains all pixels value
Y=trainDataset[,1] # labels only
Xreduced <- X/255

Xcov <- cov(Xreduced)
pcaX <- prcomp(Xcov)

Xfinal <- as.matrix(Xreduced) %*% pcaX$rotation[,1:45]
Y <- class.ind(Y)

#--------------------------------------------------------------
# Step 4: Select Testing Data Set
#--------------------------------------------------------------
cat("\nStep 4: Select testing dataset")
testDataset <- read.csv("mnist_test.csv")
head(testDataset)
nrow(testDataset)

test=testDataset[,-1]
testreduced <- test/255 
testreduced <- as.matrix(testreduced) %*% pcaX$rotation[,1:45]
#write.csv(testDataset,file="testDataset.csv",row.names=FALSE);
#--------------------------------------------------------------
# Step 5: Model Building (Training)
#--------------------------------------------------------------
cat("\nStep 5: Model Building -> ", modelName)
#formula <- as.formula(paste(target, "~", paste(c(inputs), collapse = "+")))
#formula

#model   <- nnet(formula, trainDataset, size=10, linout=TRUE, skip=TRUE, MaxNWts=10000, trace=FALSE, maxit=100,softmax=TRUE)
model <- nnet(Xfinal,Y,size=150,softmax=TRUE,maxit=130,MaxNWts =80000)
model

#--------------------------------------------------------------
# Step 6: Prediction (Testing)
#--------------------------------------------------------------
cat("\nStep 6: Prediction using -> ", modelName)
Predicted <- predict(model, testreduced,type="class")
Predicted <- as.data.frame(Predicted);
head(Predicted) 


#--------------------------------------------------------------
# Step 7: Extracting Actual
#--------------------------------------------------------------
cat("\nStep 7: Extracting Actual")
Actual <- as.double(unlist(testDataset[target]))
head(Actual)



#--------------------------------------------------------------
# Step 8: Model Evaluation
#--------------------------------------------------------------
cat("\nStep 8: Model Evaluation")

# Step 8.1: Accuracy
accuracy <- round(mean(Actual==Predicted) *100,2)
accuracy


# Step 8.2: Total Time
totalTime = proc.time()[3] - startTime
totalTime


# Step 8.3: Save evaluation resut 
result <- data.frame(modelName,accuracy, totalTime)[1:1,]
result



#--------------------------------------------------------------
# Step 9: Writing to file
#--------------------------------------------------------------
cat("\nStep 9: Writing to file")

# Step 9.1: Writing to file (evaluation result)
write.csv(result, file=paste(modelName,"-Evaluation-Result.csv",sep=''), row.names=FALSE)

# Step 9.2: Writing to file (Actual and Predicted)
write.csv(data.frame(Actual,Predicted), file=paste(modelName,"-ActualPredicted-Result.csv",sep=''), row.names=FALSE)



#--------------------------------------------------------------
# Step 10: Saving the Model
#--------------------------------------------------------------
cat("\nStep 10: Saving the Model ->",modelName)
save.image(file=paste(modelName,"-Model.RData",sep=''))


cat("\nDone")
cat("\nTotal Time Taken: ", totalTime," sec")


#--------------------------------------------------------------
#                           END 
#--------------------------------------------------------------
