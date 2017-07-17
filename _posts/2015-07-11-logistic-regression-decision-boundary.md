---
layout: post
title: Basic Logistic Regression and $\vec{\theta}$ as the gradient of the Decision
  Boundary
date: '2015-07-11T16:29:00.001-07:00'
author: Robert Speare
tags:
- logistic regression
- lagrange multipliers
- Machine Learning
- Bayes
- cumulants. statistics
modified_time: '2015-10-16T07:54:13.329-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-1486897953774140917
blogger_orig_url: http://rspeare.blogspot.com/2015/07/logistic-regression-decision-boundary.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">A few months ago I was 
asked about a classification problem in a phone interview, and, not knowing 
much about machine learning or basic regression at that time, I didn't realize 
what was really being asked. I fumbled about in the dark only to suggest basic 
use of histograms and correlations, when the answer was really quite simple: 
Logistic regression. 

Linear regression takes the following form: you have some input vector 
$\vec{x}$, which lives in a ``feature space'' and you'd like to map that 
$\vec{x}$ onto a corresponding $y$, which has some scalar value. If you have a 
set, or a ``census'' of sorts, of such pairs $\lbrace \vec{x}_i, y_i 
\rbrace_{i=1}^N$, you'd like to learn from this data and be able derive an 
analytical relationship between $\vec{x}$ and $y$. 

It turns out this problem is analytically solve-able by some nasty linear 
algebra -- I did it once years ago, following David Hogg and Dustin Lang's 
paper on Bayesian inference -- if you model the errors, or deviations from 
your model as being Gaussian. Then the cost function is a $\chi^2$ statistic, 
essentially, and if you maximize the likelihood function you get something 
called the normal equation: 

\begin{eqnarray} 
y_i &amp;=&amp; \vec{\theta} \cdot \vec{x}_i \\ 
- \log \left(\mathcal{L}(\vec{x},y \vert \vec{\theta})\right) &amp;=&amp; 
\sum_{i=1}^N 
\frac{(\vec{\theta}\cdot \vec{x}_i-y_i)^2}{N}\\ 
\theta_j &amp;=&amp; \frac{X_{ji} y_i}{(X^TX)} 
\end{eqnarray} 

Where $X$ is something called the data matrix, which I won't take the time to 
define here. The point is that for linear regression we get a nice plane in 
hyper-space, that maps our inputs $\vec{x}$ onto scalar values $y$. And, 
logistic regression works the same way, but now $y$ can only take on two 
values, $0$ or $1$, and we wrap our linear model in a sigmoid function: 

\begin{eqnarray} 
y_i &amp;=&amp; \frac{1}{1+e^{-\vec{\theta} \cdot \vec{x}_i}} 
\end{eqnarray} 

And what this model really means is the probability of our output $y$ being 
``yes'' or ``no'', 0 or 1: 

\begin{eqnarray} 
P(y=1 \vert \vec{\theta}, \vec{x}) &amp;=&amp; \frac{1}{1+e^{-\vec{\theta} 
\cdot \vec{x}_i}} 
\end{eqnarray} 
Now, when you maximize the likelihood, which can no longer be done 
analytically, by any method I know of, but must be done numerically, with 
something like stochastic gradient descent, you will find that the same 
hyperplane defined by the $\vec{\theta}$ in the linear model now describes the 
**gradient** of the **decision** **boundary** in $\vec{x}$ space. By the 
properties of the sigmoid function, we will classify $y$ with a ``yes'' or a 
1, when $\vec{\theta}\cdot \vec{x}$ is greater than zero and a ``no'' or a 0, 
when $\vec{\theta}\cdot \vec{x}$ is less than zero. Let's look at when we are 
right on the ``cusp'' of a decision: 

\begin{eqnarray} 
 \frac{1}{1+e^{-\vec{\theta} \cdot \vec{x}_i}}&amp; \approx&amp; \frac{1}{2}\\ 
e^{-\vec{\theta} \cdot \vec{x}_i} &amp; \approx &amp; 1 
\end{eqnarray} 

So we can taylor expand our hypothesis $P(y=1 \vert \vec{x},\vec{\theta})$ and 
get 

\begin{eqnarray} 
P(y=1 \vert \vec{\theta}, \vec{x}) &amp;=&amp;\frac{1}{2}+\vec{\theta} \cdot 
\vec{x}_i+O()^2 
\end{eqnarray} 

If we take the derivative of this function with respect to the vector 
$\vec{x}$, we see that the normal vector to our decision boundary in feature 
space is precisely $\vec{\theta}$. Mathematically, gradient presents the 
direction of **fastest increase, **and so relatively dominant components of 
our $\vec{\theta}$ vector correspond to relatively dominant features in 
classification. 

\begin{eqnarray} 
\frac{P(y=1 \vert \vec{\theta}, \vec{x})}{\partial \vec{x}} 
&amp;=&amp;\vec{\theta}+O()^2 
\end{eqnarray} 

So, regression coefficients, at least near the decision boundary, play the 
same intuitive role. If we have a large coefficient, we know that the 
associated parameter plays a prominent role in classification. 

------------------------------------------------------------------------ 

Of course, adding higher order terms to the expression in our sigmoid 
function, say: 

\begin{eqnarray} 
 \frac{1}{1+e^{\sum_j \theta_{2j} x_j^ + \sum_j \theta_{2j+1} x_j^{2}}} 
\end{eqnarray} 

allows for a curved decision boundary in feature space $\vec{x}$ -- not just a 
hyperplane. 