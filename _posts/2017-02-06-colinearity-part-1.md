---
layout: post
title: Colinearity (Part 1)
date: '2017-02-06T19:15:00.002-08:00'
author: Robert Speare
tags: 
modified_time: '2017-02-06T19:22:09.956-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-2617153850762805053
blogger_orig_url: http://rspeare.blogspot.com/2017/02/colinearity-part-1.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">I've heard a lot comments 
-- some captions, some cowardly -- about "co-linearity" recently, from both 
colleagues at work and friends using statistics in their jobs. And, well, 
GUESS WHAT? Co-linearity is not as scary as it used to be! Many people don't 
realize that there are a variety of ways to avoid or control "co-linearity" in 
data when performing basic regressions, and I  want to take some time to 
outline them. 

Let's begin by saying we've got regression problem on our hands: one where we 
have $N$ examples of some feature vectors $\mathbf{x}$, of dimension $D$, 
contained in an $N \times D$ data matrix: 

\begin{eqnarray} 
X &amp;=&amp; \left( \begin{array}{c} 
\leftarrow \vec{x_1} \rightarrow \\ 
\leftarrow \vec{x_2} \rightarrow \\ 
\vdots \\ 
\leftarrow \vec{x_N} \rightarrow 
\end{array}\right) 
\end{eqnarray} 

and, $N$ real-valued response variable examples, $Y$: 

\begin{eqnarray} 
Y &amp;=&amp; \left( \begin{array}{c} 
y_1\\ 
y_2 \\ 
\vdots \\ 
y_N 
\end{array}\right) 
\end{eqnarray} 

Our goal is to write a linear model of some sort: 

\begin{eqnarray} 
\hat{y_n} &amp;\approx &amp; \mathbf{\beta} \cdot \mathbf{x_n} + \epsilon 
\end{eqnarray} 

Where we assume the errors are drawn from some probability distribution. In 
standard regression problems Normal, so we'll keep it that way: 

\begin{eqnarray} 
\epsilon &amp; \sim &amp; \mathcal{N}(0,\sigma^2) 
\end{eqnarray} 

Now, as we've covered before in this blog, the likelihood of the data -- or, 
the co-occurence of features and labels we see in the world $(X,Y)$ --  given 
some model, specified by $\mathbf{beta}$, is equal to: 

\begin{eqnarray} 
P(X,Y \vert \mathbf{\beta}) &amp;=&amp; \prod_{n=1}^N \frac{1}{\sqrt{2\pi 
\sigma^2}}\mathrm{exp}\left(-(y_n - \beta \cdot x_n)^2/ 2\sigma^2 \right) 
\end{eqnarray} 

Where, by taking a product above, we assume each data instance $n = 1, \dots 
N$ is independent. Taking the log of this likelihood we get: 

\begin{eqnarray} 
\mathcal{L}(X,Y \vert \beta) &amp;=&amp; -\frac{N}{2} \log(2\pi \sigma^2) - 
\sum_{n=1}^N \frac{(y_n - \beta \cdot x_n)^2}{ 2\sigma^2 } 
\end{eqnarray} 

This is a convex function of $\beta$, meaning that if we set the derivative 
equal to zero, we are guaranteed to find a global maximum / minimum (very 
good), and so our MLE or maximum likelihood estimate of the model $\beta$ 
becomes, if we write things now in matrix notation: 

\begin{eqnarray} 
\mathcal{L}(X,Y \vert \beta) &amp;=&amp; -\frac{N}{2} \log(2\pi \sigma^2) - 
\frac{(\beta_d X_{nd}-Y_n)^2}{ 2\sigma^2 } 
\end{eqnarray} 

Taking the derivative with respect to $\beta_d$ (a gradient) we get: 
\begin{eqnarray} 
\frac{\partial \mathcal{L}(X,Y \vert \beta)}{\partial \beta_d}\vert_{\beta = 
\beta^\prime} &amp;=&amp;  (\beta_l X_{nl}-Y_n) X_{nd}  = 0 \\ 
\beta_l X_{nl}X_{nd} &amp;=&amp; X_{nd} Y_n\\ 
\beta_l  &amp;=&amp; (X_{nl}X_{nd})^{-1} X_{nd} Y_n 
\end{eqnarray} 

This is called the Normal Equation, can actually be well understood that 
noting: 

\begin{eqnarray} 
X_{nl}X_{nd} &amp; \approx &amp; N \mathrm{Cov}(x_l, x_d) \\ 
X_{nl}Y_{n} &amp; \approx &amp; N \mathrm{Cov}(x_l, y) 
\end{eqnarray} 

which, words, is the covariance betwen the $l^{\mathrm{th}}$ $d^{\mathrm{th}}$ 
components of the feature vector and the covariance between the 
$l^{\mathrm{th}}$ feature and the target, $y$. 

There's a very important thing to notice here, straight off the bat, which is 
that the Normal Equation -- which is the standard way of solving regression, 
or OLS (ordinary least squares) problems -- accounts for interactions between 
the features: we can see it in the "discounting" factor of the inverted 
matrix, above. Highly correlated features will dampen each other's effect, 
which is very, very cool. Regression coefficients $\beta_d$ represent the 
``net'' effect of the $d$ feature, not the ``gross'' effect, as one would get 
by doing a single, univariate regression of $x_d$ on $y$. This is important to 
keep in mind, but we're not out of the -- or even into the -- co-linearity 
woods yet. 


---------------------------------------- 

People get upset or concerned about colinearity when they want: 


<ul style="text-align: left;">1. Interpretable Models 
1. Stable Regression Coefficients $\mathbf{\beta}$ in the face of changing 
data. 
1. A bone to pick with a model or feature set that they don't trust or 
understand. 


Now, most of the "spookiness" of co-linearity comes from linear algebra, and 
**the complete absence of Bayesian Statistics in Traditional circles of past 
Statisticians, where putting priors on regression coefficients is equivalent 
to regularizing, and therefore controlling and containing, co-linearity.** 

Take for example a data matrix where we have $N=15$ data points in our set, 
but $D=45$ features. The old-time statisticians might tell you that the 
problem is ill-specified or ill-defined, because if we create a regression 
model with 45 degrees of freedom, there simply aren't enough data points to 
"figure out" what's going on. And that's true, but it really comes from the 
fact that when inverting a matrix -- as we're doing above -- with linearly 
dependent columns, we could run into a lot of numerical trouble. 

This has to be the situation in the case I just mentioned above, as it is 
impossible for the square matrix $X_{nl}X_{nd}$ -- which is $D \times D$ -- to 
be properly invertible. And this is simply because the column space of $X$ is 
at most of dimension $N=15$. I won't get into the dirty details, but suffice 
it to say that when you tried to regress in such a situation, solving using 
the old methods, you were hosed. 

And so how did you to wiggle out of it, in the "old days"? 


<ol style="text-align: left;">1. Sub-select the features, such that $D &lt; 
N$, and move on with the analysis. 
1. Use PCA to "represent" the matrix $X_{nl}X_{nd}$ in terms of its most 
prominent eigenvectors, and once again make sure that $D&lt;N$. 
1. Add some other method I'm not currently remembering here. 
But, in modern times this is a brutal way to do things, and especially with 
genetic data, where the feature space has far more dimensions than the dataset 
has examples (often by a factor of 10, 100 or even a 1000). We can do better 
than this. 