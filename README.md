# 10.0-Chi-Square-Analysis

What is a Chi-Square Test?
Chi-square analysis enables you to look at the relationship between two categorical variables. There are 2 kinds of chi-square analysis:

One-way chi-square test evaluates whether the subcategories within a categorical variable are significantly different from each other. A question you may ask that would require running a one-way chi-square test is whether the frequency of terrorist incidents significantly differ across countries.
Two-way chi-square test evaluates whether two categorical variables are significantly related to each other. A question that would require running a two-way chi-square test is whether the type of weapon used in a terrorist attack varies across countries.
This lesson will focus on the latter of these two types (i.e., a two-way chi-square test).

 

Why Do We Use Chi-Square Tests?
Statistical analyses help us determine if what we observe is significantly different from what we expected based on chance. So far, we’ve mainly been relying on the mean to determine the value that would occur based on chance. However, with categorical variables the mean isn’t interpretable. For example, if we have a set of data on the number of terrorist attacks in three different countries (coded as 1 = United States, 2 = Canada, 3 = Mexico) knowing that you have a mean of 2.10 doesn’t tell you much. We would instead report the proportion of attacks in each country (e.g., 35% in the United States, 20% in Canada, and 45% in Mexico) or the frequency of attacks in each country (e.g., 105 in the United States, 61 in Canada, and 134 in Mexico). Chi-square analysis uses frequencies and proportions to determine significant effects as opposed to the mean.

 

How to Calculate a Chi-Square Value
We’ll discuss how to calculate a chi-square value within the context of an example. Let’s say we want to evaluate whether the terrorist attacks that occur across different countries vary based on the type of weapon used in the attack. If we look at trends across 300 terrorist incidents across these countries, we may come up with a contingency table like the one shown below.

![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/02e5ad67-a48e-449b-9b84-ce2198ae9b7c)

This table shows the total number of observations in the subcategories of each categorical variables. Looking at the table we can tell, for example, that there have been 50 biological attacks in the United States.

![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/e4b4c514-cf84-4efa-b1c9-88cc64e318a3)

When translated into words, the chi-square equation essentially determines how much the frequencies we observed differ from the frequencies we would expect to see based on chance, standardizes these proportions using their expected frequencies, and creates a sum of these standardized differences.

As you can see the first step in the process would be to determine the expected frequencies. If we were to calculate these for the data in the contingency table shown earlier, we would get the following results:

![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/74b5b852-e280-436b-b7dc-be83ab5bb6ca)

To determine the chi-square value we would then need to subtract each expected frequency from their observed frequency, square the difference, divide by the expected frequency, then sum the numbers.

![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/dd59d49a-c2e8-4bc5-864a-f2c23cf11004)

We now know that when examining the relationship between the type of attack weapon and country, the chi-square value is 50.01 but this doesn’t tell us much unless we know whether or not this value is significant. The next section will explain how we can determine statistical significance using the chi-square value.

 

How to Determine Statistical Significance
There are two ways to determine the statistical significance of the chi-square value. If you are doing this analysis in R, these results will be displayed under the heading "Pearson's Chi-squared test" then look for the p value in this section. Another way to determine the statistical significance of the chi-square value is to use the Critical Chi-Square values table. To do this, you will first need to calculate the degrees of freedom (df) of the test. For a two-way chi-square test, degrees of freedom is equal to the product of the differences between the number of columns (c) in the table minus 1 and the number of rows (r) in the table minus 1.
![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/d0aa0b93-f65b-473f-aa0d-08f381314e22)

In our example, we had 3 columns in our table and 5 rows. Our degrees of freedom would therefore be:
![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/9fb07b9c-c033-477b-b75c-f3a0fe6ae54c)

Using the Critical Chi-Square values table (shown in the back of most statistics textbooks), we can see that with a degrees of freedom of 8 and a default p-value of .05, we need to have a critical chi-square value that is larger than 15.51 for it to be statistically significant.

Given that our computed chi-square value is 50.01, which is larger than 15.51, we would conclude that our findings are greater than we would expect based on chance alone. In other words, our findings are statistically significant and the type of weapon used in a terrorist attack does vary across countries.

 

How to Run Post-Hoc Tests
A chi-square test does a good job of telling you whether or not there are differences in your proportions but it does not tell you where those differences are. In order to determine this, you will need to compute the standardized residuals for each subcategory.

 ![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/36edaa6d-88be-4764-9c0e-ce050f3e8602)

Below is an example of how this equation can be used to determine the standardized residual for the first cell in our earlier contingency table:
![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/26e71462-624e-4ba5-a994-b6714c767f46)

Note that calculations of the standardized residuals will yield separate values for each subcategory represented in the contingency table. This would mean that in our example, we would have 15 separate standardized residuals for each cell.

Standardized residuals can be interpreted like a z-score in which scores with an absolute value higher than 1.96 are considered statistically significant at a p < .05 level. A positive standardized residual shows that the observed frequency is higher than its expected frequency and ones that are negative show that the observed frequency is lower than its expected frequency. A standardized residual greater than 1.96 shows that the observed frequency is significantly higher than its expected frequency or significantly higher than we would expect based on chance. A standardized residual less than -1.96 shows that the observed frequency is significantly lower than its expected frequency or significantly lower than we would expect based on chance. If the absolute value of a standardized residual is not greater than 1.96, we would conclude that the value is no different than we would expect based on chance.

In our example, we can see that the standardized residual for biological attacks in the United States is 1.54. This standardized residual is positive, which means that our observed frequency is higher than our expected frequency. However, its absolute value is not greater than 1.96. This means that even though 50 (observed frequency) is higher than 40.25 (expected frequency), this value is no different from what we would expect it to be based on chance.

 

How to Determine Effect Size Estimates
There are a few different ways to determine the practical significance or meaningfulness of your results. When you have a 2 x 2 matrix (i.e., 2 categorical variables with 2 subcategories each), you can calculate an odds ratio and a phi-coefficient. Both of these estimates tell us different things. An odds ratio shows the likelihood of an event occurring provided the likelihood of the event not occurring. We determine this by calculating the ratio of the odds of the event occurring in one group compared to the odds of the event occurring in another group. 

A phi-coefficient is interpreted differently from an odds ratio. It is more similar to a correlation by the fact that it represents the strength of the relationship between the two variables. Unlike odds ratios a phi-coefficient ranges between 0 and 1. We can therefore use Cohen’s cutoffs for determining whether our phi-coefficient is very small (less than .1), small (.1-.29), moderate (.3-.49), or large (.5 or higher).

A phi-coefficient can be calculated using the following equation:
![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/7c2375d6-afe9-4463-9a37-4af197c3b282)

If your matrix is bigger than a 2 x 2, odds ratios can be difficult to calculate and interpret. Depending on how large the matrix is, a phi-coefficient also cannot be used to determine your effect size. In situations like this, you would need to calculate Cramer’s V.

Cramer’s V is used when your contingency table is larger than 2 x 2, i.e., either or both of the 2 categorical variables in your analysis have more than 2 subcategories. In the calculation of Cramer’s V you will see that a different type of degrees of freedom is used in the denominator (i.e., df*). This represents the smaller value of r-1 or c-1, where r is the number of rows and c is the number of columns in your contingency table. This degrees of freedom is unique to the calculation of Cramer’s V and should not be confused with the degrees of freedom of the overall model.
![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/dd3002a2-98f6-4396-9b83-308cabd65dc2)

Using our earlier example, we can see that our matrix was a 5 x 3 (i.e., 5 rows and 3 columns). With a chi-square value of 50.01, a sample size of 300, and using 2 as the smaller of r-1 or c-1, our Cramer’s V would be .29.
![image](https://github.com/Xnrrrrrr/10.0-Chi-Square-Analysis/assets/133546385/4d908f96-6b5d-4f61-9efc-8e0caeaf6c2c)

Similar to our phi-coefficient, Cramer’s V can be interpreted using Cohen’s cutoffs of very small, small, moderate, and large effect sizes. Based on these cutoffs we can conclude that the relationship between type of weapon used in a terrorist attack and country have a small effect size.

 

How to Manage Small Samples
The following tests are used to determine chi-square values when your sample size is small.

Fisher’s exact test:
This test will be produced when you run your analysis in R.
We often rely on Fisher’s exact test when we find that our expected frequency for any one of our cells falls below 5.
The likelihood ratio:
This test compares your observed frequencies to those predicted by the model.
For large samples, this ratio will be fairly similar to our typical chi-square value.
Yate’s correction:
This test will be produced when you run your analysis in R.
It applies a correction to our chi-square value by subtracting 0.5 from our residuals before squaring them.
It is often argued that this technique overcorrects the problem of small samples and produces chi-square values that are too small.
Given that many of these techniques tend to overcorrect the problems you encounter with small sample sizes and that you’ll most likely be examining large sets of data, it is good to know that these techniques exist but you will not be expected to calculate or interpret them in this course.

 

What Assumptions Do We Make?
Even though chi-square analyses have fewer assumptions than most tests, there are still two core assumptions that we need to meet when we run a chi-square test. The first assumption involves evaluating whether or not each case in the dataset is independent of the other. Independence of observations means that each individual, item, entity, or event contributes to only one cell of the contingency table. Any one event is not related to other events in the dataset.

The second assumption is that the size of the expected frequencies in any cell is not less than 5. It’s clear that this assumption is much less subjective than the first and would therefore be easier to evaluate. In large matrices (i.e., bigger than a 2 x 2), it is okay to have up to 20 percent of your expected frequencies fall below 5 but none of these values should fall below 1.

 

R Tutorial: Chi-Square Analysis
To run a chi-square analysis in R:

Create a new project using the following steps:
Open R Studio
Navigate to File > New Project > New Directory > New Project
Create a name for your new project folder. “Chi Square” may be appropriate or anything else you’d like.
Click Browse to select where you’d like to save the new project folder.
Download the dataset provided Then, import it in R.
Install and load the gmodels package in R by running the following syntax in R studio:
packages(“gmodels”) #Installs the package
library(gmodels) #Loads the package
Complete the tutorial following the step in the R script file provided in the Additional Required Reading & Data Files section.
















