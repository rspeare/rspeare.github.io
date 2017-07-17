---
layout: post
title: A Brief Note on the Bias-Variance Decompositon
date: '2015-11-24T12:44:00.002-08:00'
author: Robert Speare
tags:
- Bias-Variance
- Learning Theory
- Machine Learning
- cumulants. statistics
modified_time: '2015-11-24T14:22:04.619-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-7041825633756348820
blogger_orig_url: http://rspeare.blogspot.com/2015/11/a-brief-note-on-bias-variance.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"> 
When one trains a model that is highly flexible, highly ``articulate'' on a 
training set, you often get a great training score -- be it AUC, accuracy, 
MSE, etc. But such models -- as I've talked about before -- often have trouble 
generalizing to ``test'' sets, or, the real world. One of the easiest ways to 
see this is by a simple FOIL operation on the following quantity: 

\begin{eqnarray} 
Y&amp;=&amp; f(X)+\epsilon 
\end{eqnarray} 

Here $X$ is a random variable -- the independent inputs -- $f(X)$ is the 
generative process that creates our object of interest $Y$ -- be it cardinal 
or $\in \mathcal{R}$ -- and $\epsilon$ is drawn from some noise distribution, 
say a Gaussian process with zero mean, $\mathcal{N}(0,K(X,X^\prime))$. Let 
$g(X)$ be our picked model for $Y$. (Normally people write $\hat{f}(X)=g(X)$ 
but I chose $g$ to avoid confusion.) If we take a look at the mean squared 
error, we get 

\begin{eqnarray} 
MSE &amp;=&amp; \langle \vert f(X)+\epsilon-g(X) \vert^2 \rangle\\ 
&amp;=&amp; \langle f(X)^2 \rangle + \langle \epsilon^2 \rangle +\langle 
g(X)^2 \rangle - 2 \langle \epsilon \rangle \langle f(X) \rangle - 2 \langle 
\epsilon \rangle \langle g(X) \rangle - 2 \langle f(X) \rangle \langle g(X) 
\rangle 
\end{eqnarray} 

Where I've assumed the noise and our $f,g$ are uncorrelated. We see the terms 
that are linear in $\epsilon$ fall away and we can write: 


\begin{eqnarray} 
MSE &amp;=&amp; \langle f(X)^2 \rangle + \langle \epsilon^2 \rangle +\langle 
g(X)^2 \rangle - 2 \langle f(X) \rangle \langle g(X) \rangle 
\end{eqnarray} 

Adding and subtracting the mean of our model squared $\langle g(X) \rangle^2$ 
we get: 

\begin{eqnarray} 
MSE &amp;=&amp; \langle \left(f(X)-\langle g(X)\rangle \right)^2 \rangle 
+\mathrm{Var}\left(g(X) \right)+\mathrm{Var}\left(\epsilon \right) 
\end{eqnarray} 

So now, term by term, we see we have: the squared difference between our data 
and our average model -- the Bias, which quantifies how much our model is 
``off'' (a quantity that will be quite low for complex models and high for 
simple ones); the variance of the model itself, which quantifies how much our 
$g(X)$ changes given different training inputs (a quantity that will be high 
for complex models and low for simple ones) ; and the variance of the noise 
variable $\epsilon$, which is an ineluctable contribution to our error. 

Recall from [last 
post](http://rspeare.blogspot.com/2015/11/learning-theory-and-xgboost-failure-on.html) 
we had a very similar bias-variance decomposition: 

\begin{eqnarray} 
\epsilon(h_{\hat{\theta}}) &amp;\le &amp; \left( \min_{h_\theta} \epsilon 
(h_{\theta}(X)) \right)+\sqrt{\frac{2\log \left( \frac{2K}{\delta} 
\right)}{N}} 
\end{eqnarray} 

The bias is the first term and the variance the second, which goes like square 
root logarithm of the degrees of freedom $K$. This decomposition illustrates 
the balancing act we have to play, as model builders, between simplicity and 
goodness of fit. Refer to these when explaining why your highly un-regularized 
gradient boosted decision tree -- or boosted anything -- did a poor job of 
generalizing! (This doesn't always happen, of course, just a word of caution.) 