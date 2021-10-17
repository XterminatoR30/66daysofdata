# 66 Days Of Data 
## Day 1-22 (Python: Basics, Machine Learning & Deep Learning) 

### Day 1:
Python Variables, Operators and Conditional Statements

- Learned about python data types such as strings, integer, float and boolean.
- Also learned about arithmetic operators, comparison operators, and logical operators
- Learned how to use indexing such as x[7]
- Learned conditional statements such as if, elif and else statements

### Day 2:
Python Functions, Sequences,Iterations

- Learned about define functions, built in functions such as max,min,abs,pow,sum,round and len
- Also learnt about lists, how to append, extend,delete and indexing a list with slicing method
- Able to differentiate lists,tuples and dictionaries. Learned too about how to sort using tuples and using the split method. Also, the key value pair of dictionaries
- Able to use different kinds of loops such as for loop, while loop and use it inside a define function

### Day 3&4:

- Learned OOP using multiple classes and class inheritance
- Installing statsmodels library and learned simple linear regression equations and models
- Creating a simple linear regression OLS model summary and first time plotting a scatterplot

### Day 5:
Spend a full day trying to dive deep down into the core of REGRESSION such as SST,SSE and SSR

- Learned about values that determines how good a regression model is in OLS (Ordinary Least Squared) model summary. Such as r squared, f statistic, and Durbin Watson value
- Learned how to plot multiple regression lines using seaborn
- Learned to made a dataframe using pandas and made a regression predicitive model using statsmodels
- Learned how to use numpy to reshaping arrays

### Day 6:
Another day of Multiple Linear Regression on 365 careers data science udemy course

- Learned how to do multiple linear regression using sklearn such as finding the bias, r square value, p values,etc
- Learned standardization, feature scalling using sklearn modules
- Learned pandas dataframe to modify and insert a new value into a row or column
- Learned underfitting and overfitting of a model and how to use train test splits with a determined test size and a fixed random state

### Day 7:
Spent another day with Linear Regression but this time with raw dataset that needs to be futher pre processed

Things learned:
- Remove null values, adding and removing columns using pandas
- Reset index after data is being preprocessed
- Quantile to remove outliers in a dataset
- Differentiate a benchmark of a specific value or column in a weighted dataset
- Convert data into a dummy data using pandas get_dummies
- Use seaborn's displot to observe outliers in a dataset
- VIF (Variance Inflation Factor) that indicates multicollinearity in a Regression model
- Comparing y test with the predicted value using Linear Regression

### Day 8:
Logistic Non Linear Regression

Things Learned:
- Plotting Logit scatterplot with a non linear regression line using seaborn
- Creating logit regression summary and understand the meaning of MLE(Maximum Likelihood Estimation), Log Likelihood, LL Null, LLR and Pseudo R Squared variables
- Comparing prediction value and obtaining confusion matrix and accuracy score using sklearn
- Binary predictor using numpy exponential function to predict the possible outcome event of the prediction

### Day 9: 
K-Means Clustering

Things Learned:
- The elbow method that determines the Optimum Number of Clusters needed
- WCSS (Within Cluster Sum of Squares) that calculates the distance between points in a cluster. The smaller the WCSS value, the better the number of clusters used
- Standardize key values to obtain optimal clustering solution
- Market Segementaion (Loyalty and Satisfaction) and Species Segmentation (Iris Dataset) to determine which number of clusters is optimal for different kind of datasets
- Clustermap/Heatmap to create a dendrogram using seaborn

### Day 10:
Linear Algebra (Matrix) & Intro to Neural Networks

Things Learned:
- Transposing, Dot Product of Scalars, Vectors and Matrix
- Differences in Machine Learning types: Supervised, Unsupervised, Reinforcement Learning 
- L2 Norm and Cross-Entropy Loss function for Regression and Classification problems, and Gradient Descent, Learning Rate for Optimization functions
- NumPy randomize uniform function to generate artificial input data in the form of arrays

### Day 11:
Tensorflow Sequential Model

Things Learned:
- Storing NumPy arrays in .npz file format
- Creating machine learning model using Keras Sequential method and compile it using SGD optimizer and Mean Squared Error loss
- Differences in verbose values:
  * Verbose=0 -> Silent or No Output
  * Verbose=1-> Displaying Progress Bar
  * Verbose=2-> Display only Loss/ Accuracy Value without Progress Bar
- Comparing predicted input values that has been trained with the targets
- Lower Learning Rate (0.001-0.005) value might increase the speed the neural network to learn the model, as i tried experimenting different values of learning rate using Stochastic Gradient Descent (Result might differ using different optimizer)

### Day 12-13:
DNN: Activation function, Optimizer function, MNIST Classification

Things Learned:
- Theory of differences in activation functions and their usage (Sigmoid, TanH, ReLu, Softmax)
- SGD (Stochastic Gradient Descent) which is a optimizer that increases computational efficiency as it splits the dataset into mini batches and will reach the global minimum much faster with the help of Momentum
- Advanced Adaptive Learning Rate Scheduler (Optimization Function) such as AdaGrad, RMSProp and Adam. Adam is most commonly used as it combines both Momentum and RMSProp together.
- Numerical and Categorical data Pre-Processing such as PCA (Principle Component Analysis), Whitening, One Hot Encoding and Binary Encoding
- Building a Convolutional Neural Network model with 1 hidden layer for MNIST dataset and managed to got 91-92% test and training accuracy.

### Day 14-15:
Feed-Forward Multi Layer Perceptron

Things Learned:
1. Audiobook Dataset:
- Preprocess dataset to remove or delete rows in a dataset by using np.delete() and append the dataset that are used into an empty array list
- Standardize the inputs using preprocessing.scale() to equalize the weight of higher value and the lower value in the input dataset
- Splitting training, validation and test set to 80-10-10 ratio and save the dataset into a .npz file format using np.savez() ]
- Building a Feed Forward Multi Layer Perceptron Sequential model with 1 input layer, 2 hideen layers and 1 output layer using Adam Optimizer and Sparse Categorical Crossentropy Loss function. (Some overfitting spotted)
- Applying earlystopping with patience value of 10 to the model to prevent overfitting by stopping at a certain epoch or iteration when there's no improvement in validation accuracy or validation loss

2. MNIST:
- Using LabelBinarizer to turn all integer classes (0-9) to a One-Hot Encoded column vector [1,0,0,0,0,0,0,0,0]
- Creating a classification report of all MNIST number classes

### Day 16-18:
Absenteeism Dataset PreProcessing, Logistic Regression Model and Visualizing in Tableau

- Absenteeism data focuses on filtering individuals who is absent during work hours for more than the 'Median' absent hours

- Summary table that consists of variables name, coefficient value and odd values (Weights) can determine whether or not a variable is a significant contributor of an individual being absent during working hours

- Transposing and Standardizing coefficient variable obtained by Logistic Regression and the Exponential of the standardized coefficient helps to determine which variable is the main factor for an individual to be absent during work hours

### Day 19-22:
It's been a long time not to update #66daysofdata progress.
Been through so many re-learned theories and applications on probability and statistics.

Things Learned:
- Triple Nested Loops, List Comprehensions
- Re-learning Probabiliity, Expected Value, Permutations, Variations and Combinations
- Discrete Distributions: Uniform, Bernoulli, Binomial and Poisson Distributions
- Continuous Distributions: Normal, Student's-T, Chi-Squared, Exponential, Logistic Distributions
- Mean, Median, Mode, Population/Sample Variance and Standard Deviations
- Level of significance, Z-Score, T-Score and P-Values for Hypothesis Testing and Confidence Interval Estimates

### Day 23-25:
CRUD (Create, Read, Update, Delete)

Things Learned:
- Creating, Dropping, Selecting Database
- Inserting values into a Table, Assigning Primary Key, Not Null values, and Default values
- Aliases and Deleting Specific Value in a Table
