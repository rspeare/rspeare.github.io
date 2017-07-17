---
layout: post
title: Recommender Systems -- Second Order Collaborative Filtering
date: '2015-09-05T16:13:00.002-07:00'
author: Robert Speare
tags:
- recommender systems
- Collaborative Filtering
- probability
- Regression
- Matrix Derivatives
- Machine Learning
- Multinormal
- cumulants. statistics
modified_time: '2015-10-19T10:47:19.924-07:00'
thumbnail: http://2.bp.blogspot.com/-63bchrmMg-w/Vet3TXw1q9I/AAAAAAAACPg/GuCnAFByysI/s72-c/Screenshot%2B2015-09-05%2B18.43.34.png
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8725996511709387825
blogger_orig_url: http://rspeare.blogspot.com/2015/09/recommender-systems-second-order.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">So I've been working with 
recommender systems recently, which take in some incomplete set of product 
ratings, represented by a matrix $Y$ 

\begin{eqnarray} 
Y_{ij} &amp;=&amp; \left(\begin{array}{cc} 
\leftarrow \mathrm{ratings\ for\ movie\ 1} \rightarrow \\ 
\leftarrow \mathrm{ratings\ for\ movie\ 2} \rightarrow \\ 
\vdots \\ 
\leftarrow \mathrm{ratings\ for\ movie}\ n_m \rightarrow \end{array}\right) 
\end{eqnarray} 

and come up with a model to ``recommend'' similar products -- in this case 
we'll call them movies -- to users. What this essentially is is a regression 
problem. But we don't have the vector inputs $\vec{x}$. What's very cool about 
collaborative filtering is that we find we can solve the problem by 
**guessing** the regression inputs $\vec{x}$ and weights $\vec{\theta}$ for 
each individual and each movie, minimize the cost function, and still get a 
working model! Even more astoundingly, the ``feature vectors'' $\vec{x}$ that 
emerge might contain some important information as to categorizing products. 

Let's say we have $n_m$ movies in our database and $n_u$ users: then this $Y$ 
matrix is $n_m \times n_u$, and all entries for which the $j^\mathrm{th}$ user 
has not rated the $i^{\mathrm{th}}$ movie, we put a question mark (?) in our 
matrix. Or, correspondingly we can make a mask matrix, $R_{ij}$ which has 
entries of 1 wherever we have a rating, and 0 wherever we don't. When modeling 
 $Y_{ij}$, we normally use a linear model, giving each movie a feature vector 
$\vec{x}^{(i)}$, of dimension of our choosing, and each individual a 
regression coefficient vector $\vec{\theta}^{j}$, of dimension of our 
choosing. (Let's call it $D$) We have 

\begin{eqnarray} 
\vec{x}^{(i)} &amp; \in &amp; \mathcal{R}^D \ \ \forall i \\ 
\vec{\theta}^{(j)} &amp; \in &amp; \mathcal{R}^D \ \ \forall j \\ 
Y_{ij} &amp;=&amp; \vec{x}^{(i)}  \cdot \vec{\theta}^{(j)} + \epsilon_{ij} 
\end{eqnarray} 


And our error matrix, $\epsilon_{ij}$ is drawn from some probability 
distribution. This model can be more concisely -- or perhaps more clearly -- 
written as a matrix multiplication: 

\begin{eqnarray} 
Y_{ij} &amp;=&amp; \mathbf{X}_{il}  \mathbf{\Theta}_{jl} + \epsilon_{ij} 
\end{eqnarray} 

where we use Einstein summation convention above. If we assume Gaussian 
independent errors, our cost function -- or, the log likelihood -- becomes, 

\begin{eqnarray} 
2 J\left( \mathbf{X}_{il},  \mathbf{\Theta}_{jl} \right) &amp;=&amp; \sum_{i,j 
\in R_{ij}} \left[ Y_{ij} - \mathbf{X}_{il}  \mathbf{\Theta}_{jl} \right]^2 
\end{eqnarray} 

And our sum above only calculates the errors for movies which we have actually 
received ratings. If we want to regularize our model, we can put simple priors 
on our movie Feature vectors $\vec{x}$ and individual regression vectors 
$\vec{\theta}$ to get: 

\begin{eqnarray} 
2J\left( \mathbf{X}_{il},  \frac{1}{2}\mathbf{\Theta}_{jl} \right) &amp;=&amp; 
\sum_{i,j \in R_{ij}} \left[ Y_{ij} - \mathbf{X}_{il}  \mathbf{\Theta}_{jl} 
\right]^2+\lambda \left(\mathbf{X}_{il} \mathbf{X}_{il}  + 
\mathbf{\Theta}_{jl} \mathbf{\Theta}_{jl}  \right) 
\end{eqnarray} 

The regularization term is just the sum of two traces. Now, what's interesting 
about collaborative filtering is that a priori, we don't know our movie 
feature vectors, and we don't know what the regression weights are either -- 
we only choose their dimension and hope things work out OK! Since this cost 
function is quadratic, the Newton-Rhapson method should optimize it in a 
``single'' step. We can compute the derivatives of this cost function with 
respect to matrices in the following way: 

\begin{eqnarray} 
\frac{\partial J}{\partial \mathbf{X}_{i^\prime l^\prime}} &amp;=&amp; 
-\sum_{j \in R_{i^\prime j}} \left[ Y_{i^\prime j} - \mathbf{X}_{i^\prime l}  
\mathbf{\Theta}_{jl} \right]  \mathbf{\Theta}_{jl^\prime}+ \lambda 
\mathbf{X}_{i^\prime l^\prime} \\ 
\frac{\partial^2 J}{\partial \mathbf{X}_{i^\prime l^\prime} \partial 
\mathbf{X}_{i l}} &amp;=&amp; \sum_{j \in R_{i^\prime j}} \mathbf{\Theta}_{jl} 
\mathbf{\Theta}_{jl^\prime}\delta^K_{i,i^\prime}+ \lambda  
\delta^K_{l,l^\prime}\delta^K_{i,i^\prime} 
\end{eqnarray} 

Where $\delta^K$ is the Kronecker delta function. A similar expression pops 
out for partial derivatives with respect $\mathbf{\Theta}$, but the important 
point to note with Newton-Rhapson, is that we seek to find the root of the 
gradient. Normally, when setting $f(x)$ to zero one writes: 

\begin{eqnarray} 
f(x+\delta x) &amp;=&amp; f(x) + \delta x \frac{\partial f}{\partial 
x}+O(\delta x^2) 
\end{eqnarray} 

And so if we update according to 

\begin{eqnarray} 
\frac{-f(x)}{\left( \frac{\partial f}{\partial x} \right)} &amp;=&amp; \delta 
x 
\end{eqnarray} 

For the cost function $J$ we are doing the same thing, except with matrices: 

\begin{eqnarray} 
f \to f_{il} &amp;=&amp; \frac{\partial J}{\partial \mathbf{X}_{i^\prime 
l^\prime}} 
\end{eqnarray} 

So our update takes the form of a double matrix multiplication (and 
inversion): 

\begin{eqnarray} 
\delta \mathbf{X}_{i l} &amp;=&amp; - \frac{\partial J}{\partial 
\mathbf{X}_{i^\prime l^\prime}} \left( \frac{\partial^2 J}{\partial 
\mathbf{X}_{i^\prime l^\prime} \partial \mathbf{X}_{i l}} \right)^{-1} 
\end{eqnarray} 

A similarly ugly expression for $\mathbf{\Theta}_{jl} $ applies. 

Now I find that updating simultaneously the matrices $X$ and $\Theta$ 
according to the above second order rule causes the model to **diverge**, not 
converge, which I suppose makes sense because the gradient of $J$ with respect 
to $\mathbf{X}_{i l}$ changes with $\mathbf{\Theta}_{j l}$. A more clever set 
up to solve this problem would be to apply second order updates, alternately, 
to $X$ and $\Theta$ -- i.e. something that is truly collaborative. This would 
cause the gradients $\frac{\partial J}{\partial \mathbf{X}_{il}}$, 
$\frac{\partial J}{\partial \mathbf{\Theta}_{jl}}$, to alternately be set to 
zero, and over time, hopefully cause the model to converge to a $J$-cost 
minimum. 

One could also use a first order method -- which is mathematically much easier 
-- where one must choose some arbitrary step size $\alpha$ -- or ``learning 
rate'' -- and hope that things work with a parameter update of the form 

\begin{eqnarray} 
\delta \mathbf{X}_{i l} &amp;=&amp; - \alpha \frac{\partial J}{\partial 
\mathbf{X}_{i^\prime l^\prime}} 
\end{eqnarray} 

I find that it takes thousands of iterations for a first order method, 
choosing some step size $\alpha$ -- and hopefully getting lucky -- to achieve 
the same performance of a second order method with 20 iterations. Here are the 
learning curves for a collaborative second order method, after 20 iterations: 

<div class="separator" style="clear: both; text-align: center;">[<img 
border="0" height="195" 
src="http://2.bp.blogspot.com/-63bchrmMg-w/Vet3TXw1q9I/AAAAAAAACPg/GuCnAFByysI/s320/Screenshot%2B2015-09-05%2B18.43.34.png" 
width="320" 
/>](http://2.bp.blogspot.com/-63bchrmMg-w/Vet3TXw1q9I/AAAAAAAACPg/GuCnAFByysI/s1600/Screenshot%2B2015-09-05%2B18.43.34.png)<div 
class="separator" style="clear: both; text-align: center;"> 
<div class="separator" style="clear: both; text-align: left;">And for a 
``simultaneous'' first order method, after 100 iterations:<div 
class="separator" style="clear: both; text-align: center;">[<img border="0" 
height="176" 
src="http://4.bp.blogspot.com/-dFUqlVZ-XU8/Vet31S_37_I/AAAAAAAACPo/ZtwqfBTiCK8/s320/Screenshot%2B2015-09-05%2B19.16.26.png" 
width="320" 
/>](http://4.bp.blogspot.com/-dFUqlVZ-XU8/Vet31S_37_I/AAAAAAAACPo/ZtwqfBTiCK8/s1600/Screenshot%2B2015-09-05%2B19.16.26.png)<div 
class="separator" style="clear: both; text-align: center;"> 
<div class="separator" style="clear: both; text-align: left;">The data for 
these plots came from Andrew Ng's course on Machine learning, using a 
regularization parameter $\lambda \approx .01$ and a step size $\alpha \approx 
.005$. With this code fully implemented and vectorized in python, I find that 
it takes only a few seconds to achieve an almost perfect fit! (And by that I 
mean the improvement in the cost function $J$ per iteration is less than one 
part in one thousand). <div class="separator" style="clear: both; text-align: 
left;"> 
<div class="separator" style="clear: both; text-align: left;">This example 
shows the power of convergence for second order methods when the cost function 
is truly second order. The one bottleneck that could appear in this example is 
the matrix inversion of what are essentially $n_m$ and $n_u$ $D \times D$ 
matrices, which goes like $O\left((n_m+n_u)D^3 \right)$. If one chooses the 
feature space to be very high-dimensional, with a great number of users and 
movies, the vectorized second order algorithm may slow down quite a bit. (But 
there is no replacing being able to set a matrix of derivatives to zero in a 
single step!) For separate linear regression problems of this type, it can 
take a great deal of time for things to converge, and in general that step 
size should not be the same for all regression coefficients, 
$\mathbf{\Theta}_{jl}$. <div class="separator" style="clear: both; text-align: 
left;"> 
<div class="separator" style="clear: both; text-align: left;">I wonder how 
this approach could be parallelized, or distributed, choosing the same 
dimension $D$ for many clusters. After all, the number of movies on Netflix is 
prohibitively large for such a model, even if it converges on my laptop in a 
few seconds for $n_m \sim 2000$ and $n_u \sim 1000$. <div class="separator" 
style="clear: both; text-align: left;"> 