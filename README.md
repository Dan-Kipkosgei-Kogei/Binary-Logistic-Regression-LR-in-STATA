# Binary-Logistic-Regression-LR-in-STATA
## Introduction
- Logistic regression models a relationship between predictor variables and a categorical response variable. For example, we could use logistic regression to model the relationship between various measurements of a manufactured specimen (such as dimensions and chemical composition) to predict if a crack greater than 10 mils will occur (a binary variable: either yes or no).
- Binary Logistic Regression is used when the response is binary (i.e., it has two possible outcomes). The cracking example given above would utilize binary logistic regression. Other examples of binary responses could include passing or failing a test, responding yes or no on a survey, and having high or low blood pressure.
- The multiple binary logistic regression model is the following:

  $\pi_i = \frac{e^{\beta_0 + \beta_1 x_{i1} + \cdots + \beta_k x_{ik}}}{1 + e^{\beta_0 + \beta_1 x_{i1} + \cdots + \beta_k x_{ik}}}
  $
- $\pi$ is the probability that an observation is in a specified category of the binary Y variable, generally called the "success probability."
- Notice that the model describes the probability of an event happening as a function of X variables. For instance, it might provide estimates of the probability that an older person has heart disease.
- With the logistic model, estimates of $\pi$ from equations like the one above will always be between 0 and 1. The reasons are:
   - The numerator $e^{\beta_0 + \beta_1 x_{i1} + \cdots + \beta_k x_{ik}}$
 must be positive because it is a power of a positive value (e).
   - The denominator of the model is (1 + numerator), so the answer will always be less than 1.
- For a sample of size n, the likelihood for a binary logistic regression is given by:

 $L(\beta; y, X) = \prod_{i=1}^{n} \pi_i^{y_i} (1 - \pi_i)^{1 - y_i}$

 $=\prod_{i=1}^{n} \left( \frac{\exp(X_i \beta)}{1 + \exp(X_i \beta)} \right)^{y_i}
\left( \frac{1}{1 + \exp(X_i \beta)} \right)^{1 - y_i}$
 - This yields the log-likelihood:

   $\ell(\beta) = \sum_{i=1}^{n} \left( y_i \log(\pi_i) + (1 - y_i)\log(1 - \pi_i) \right)$

   
