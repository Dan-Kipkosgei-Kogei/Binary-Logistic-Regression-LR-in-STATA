# Binary Logistic Regression(LR) in STATA
### By Dan Kipkosgei Kogei
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

   $=\sum_{i=1}^{n} \left( y_i X_i \beta - \log(1 + \exp(X_i \beta)) \right)$
- Maximizing the likelihood (or log-likelihood) has no closed-form solution, so a technique like iteratively reweighted least squares is used to find an estimate of the regression coefficients, $\hat{\beta}$
- The Logistic regression model can be shown in linear form as;

    $\log\left(\frac{1 - \pi_i}{\pi_i}\right) = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \cdots + \beta_k x_{ik}$

   Where;

    - $\pi_i$: Probability that subject  i has the outcome (e.g., success, yes, 1)
     
    - $\frac{\pi_i}{1 - \pi_i}$ : Odds for subject 
  
    - log($\cdot$): Logarithm (this is called the logit function)

    - $\beta_0$: Intercept
       
    - $\beta_1$, $\beta_2$, $\ldots$: Coefficients
       
    - $x_{i1}$, $x_{i2}$, $\ldots$: Predictor variables for subject  i
## Practical Application of Binary Logistic Regression in STATA
- The dataset used is publicly available on the Kaggle website and it is from an ongoing cardiovascular study on residents of the town of Framingham, Massachusetts.
- The classification goal is to predict whether the patient has 10-year risk of future coronary heart disease (CHD).The dataset provides the patients’ information and it includes over 4,000 observations .

##### Importing Dataset to STATA
```stata
import delimited "C:\Users\Administrator\Desktop\Data Science\heart_disease.csv", clear
```
##### Checking Variable names
```stata
describe
```
<img width="700" height="500" alt="image" src="https://github.com/user-attachments/assets/26186f54-5123-444b-b23d-1864d11b4c61" />

##### Summary of the data
```stata
summarize
```
<img width="700" height="500" alt="image" src="https://github.com/user-attachments/assets/938d3be2-40d6-4627-bc6d-6f6985e71da3" />

- The output shows that variables like male, age, and others have 4,238 observations because they contain valid numeric data for all individuals in the dataset. However, variables such as education, cigsperday, bpmeds, totchol, bmi, heartrate, and glucose show 0 observations because Stata does not find any usable numeric values in them.
- This does not mean the variables are absent; rather, it means that every entry for those variables is missing or invalid (for example recorded as . or stored in a way Stata cannot interpret numerically).
- As a result, Stata cannot compute statistics like the mean, minimum, or maximum, and therefore reports zero observations. In short, those variables exist in the dataset but are effectively empty from Stata’s perspective because all their values are missing.
- T0 deal with these variables, they can be converted into proper numeric values or impute their missing value or drop them  if they contain no usable data.
###### Dealing with non numerics
```stata
destring education cigsperday bpmeds totchol bmi heartrate glucose, replace force
```
<img width="700" height="500" alt="image" src="https://github.com/user-attachments/assets/d862ad63-53a5-47a5-9dca-a4d520411c4a" />

From the output above, the variables are all now numeric.

