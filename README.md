# Neural Network using R

![Workshop Title](https://github.com/The-Assembly/Neural_network_with_R/blob/master/NeuralNetwork_with_R.jpg)

In this workshop, we’ll apply this to the field of machine learning and show you how you can use R to create and visualize a neural network that takes in a dataset and trains a model to predict outcomes.

# What is R?
R is a programming language and free software environment for statistical computing and graphics.  The R language is widely used among statisticians and data miners for developing statistical software and data analysis.

## Advantages of using R
It’s open source language, related to other languages making it cross platform compatible.

# Installation Guide
Download R(*https://cran.r-project.org/bin/*) & RStudio (*https://www.rstudio.com/products/rstudio/download/*)

## Packages 
**CRAN - Comprehensive R Archive Network** <br/>
CRAN is a network of ftp and web servers around the world that store identical, up-to-date, versions of code and documentation for R. 

To install packages in R, type the below mentioned commands in R Console or Go To *Tools* and Click on *Install Packages* and install the below mentioned packages. 

<pre>
shiny - install.packages("shiny") <br/>
nnet - install.packages("nnet") <br/>
EBImage - install.packages("BiocManager") <br/>
          BiocManager::install("EBImage") <br/>
</pre>

## Syntax in R <br/>
To get familiear with R. Run the code from *Syntax.R* which contains an example of ifelse statement, for loop, while loop, break & next statement and a function. <br/>

## Linear Regression and Curve Fitting <br/>
Linear regression is a linear approach to modelling the relationship between a scalar response dependent variable and independent variables. 

Curve fitting is the process of constructing a curve, or mathematical function, that has the best fit to a series of data points, possibly subject to constraints.

Run the code from *Regression&Curvefit.R* to understand how Linear Regression and Curve Fitting works in R.<br/>

# Neural Network
## A primer in neural networks
An Artificial Neuron Network (ANN), popularly known as Neural Network is a computational model based on the structure and functions of biological neural networks. It is like an artificial human nervous system for receiving, processing, and transmitting information in terms of Computer Science.
Basically, there are 3 different layers in a neural network :-
Input Layer (All the inputs are fed in the model through this layer)
Hidden Layers (There can be more than one hidden layers which are used for processing the inputs received from the input layers)
Output Layer (The data after processing is made available at the output layer)

![Image of an Artificial Neural Network](https://github.com/The-Assembly/Neural_network_with_R/blob/master/ANNImage.jpeg)

## Input Layer
The Input layer communicates with the external environment that presents a pattern to the neural network. Its job is to deal with all the inputs only. This input gets transferred to the hidden layers which are explained below. The input layer should represent the condition for which we are training the neural network. Every input neuron should represent some independent variable that has an influence over the output of the neural network.

## Hidden Layer
The hidden layer is the collection of neurons which has activation function applied on it and it is an intermediate layer found between the input layer and the output layer. Its job is to process the inputs obtained by its previous layer. So it is the layer which is responsible extracting the required features from the input data. Many researches has been made in evaluating the number of neurons in the hidden layer but still none of them was successful in finding the accurate result. Also there can be multiple hidden layers in a Neural Network. So you must be thinking that how many hidden layers have to be used for which kind of problem. Suppose that if we have a data which can be separated linearly, then there is no need to use hidden layer as the activation function can be implemented to input layer which can solve the problem. But in case of problems which deals with complex decisions, we can use 3 to 5 hidden layers based on the degree of complexity of the problem or the degree of accuracy required. That certainly not means that if we keep on increasing the number of layers, the neural network will give high accuracy! A stage comes when the accuracy becomes constant or falls if we add an extra layer! Also, we should also calculate the number of nuerons in each network. If the number of neurons are less as compared to the complexity of the problem data then there will be very few neurons in the hidden layers to adequately detect the signals in a complicated data set. If unnecessary more neurons are present in the network then Overfitting may occur. Several methods are used till now which do not provide the exact formula for calculating the number of hidden layer as well as number of neurons in each hidden layer.

## Output Layer
The output layer of the neural network collects and transmits the information accordingly in way it has been designed to give. The pattern presented by the output layer can be directly traced back to the input layer. The number of neurons in output layer should be directly related to the type of work that the neural network was performing. To determine the number of neurons in the output layer, first consider the intended use of the neural network.

To understand a Neural Network we need to visualize a Neural Network.
Run the code from *NeuralNet_Visualization.R* which will plot a small Neural Network. 

![Neural Network Plot](https://github.com/The-Assembly/Neural_network_with_R/blob/master/NeuralNet_Plot.png)

## Running your first neural network!
It's as simple as it can get. The steps are as follows:
1. Clone this repository
2. Open up the NeuralNetwork.R file on RStudio
3. Install all the packages mentioned earlier in the readme.
4. Run the R file by clicking on the terminal tab at the lower half of the screen and typing Rscript "yourfilepath". An example of a valid file path in Mac would be "~/NeuralNetwork.R". In this file, the neural network is primed to recognize digits from a handwritten dataset called MNIST. Observe the terminal until it shows iteration. This signifies that training has occurred and the network is at its nth iteration. Wait until the terminal is empty.
5. Open up DigitRecognizer.R, which is the R file where the GUI interface using Shiny, an R package has been used. 
6. Install all the packages mentioned earlier in the readme.
7. Run the program and use the interface to upload test images present in this repository. Then watch your neural network as it successfully recognizes the digits.

![Digit Recognizer](https://github.com/The-Assembly/Neural_network_with_R/blob/master/DigitRecognizer.gif)

# Help
If you encounter any issues while trying to get the code to work or while trying to learn about neural networks, don't hesitate to contact us at the Assembly. We are available at most social media handles under the alias @MakeSmartThings and would be more than happy to help.
