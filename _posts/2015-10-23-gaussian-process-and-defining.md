---
layout: post
title: Gaussian Process and Defining a Stochastic Process (Connection with Rasmussen)
date: '2015-10-23T11:00:00.002-07:00'
author: Robert Speare
tags:
- stochastic process
- Machine Learning
- rasmussen
- Statistics
- cumulants. statistics
modified_time: '2015-10-23T11:18:38.314-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-4457592761289533818
blogger_orig_url: http://rspeare.blogspot.com/2015/10/gaussian-process-and-defining.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">About a week ago I posted 
about [how to define a stochastic 
process](http://rspeare.blogspot.com/2015/10/defining-stochastic-processes.html), 
and the conclusion was, if we wanted to write some function: 

\begin{eqnarray} 
f(x) \sim P[f(x)] &amp;=&amp; \frac{1}{Z}e^{\int dx dx^\prime f(x) 
K^{-1}(x,x^\prime)f(x^\prime)} 
\end{eqnarray} 

with mean zero and covariance $\mathrm{Var}[f(x)]=K(x,x^\prime)$, we can 
decompose the kernel into basis functions through Mercer's theorem and write 

\begin{eqnarray} 
K(x,x^\prime) &amp;=&amp; \sum_n \lambda_n \phi_n(x) \phi_{n}(x^\prime) \\ 
f(x) &amp;=&amp; \sum_m \phi_m(x) \sqrt{2\lambda_m} \mathrm{erf}^{-1}(X_m) 
\end{eqnarray} 

This is precisely the basis function regression we see so often in Rasmussen: 

\begin{eqnarray} 
f(x) &amp;=&amp; \vec{\mathbf{w}}\cdot \vec{\phi}(x) \\ 
\vec{\mathbf{w}}_m &amp;=&amp; \sqrt{2\lambda_m} \mathrm{erf}^{-1}(X_m)\\ 
\mathrm{Var}(ww^T) &amp;=&amp; 2 \sqrt{\lambda_m \lambda_n} \langle  
\mathrm{erf}^{-1}(X_m)  \mathrm{erf}^{-1}(X_n)\rangle 
\end{eqnarray} 

Since the erf transformed variables are unit normal, we get a kronecker delta 
in $n,m$ and 

\begin{eqnarray} 
\mathrm{Var}(w_m w_n)  &amp;=&amp; 2\lambda_m \delta^K_{mn} 
\end{eqnarray} 

I've missed a factor of two somehow but no matter. The basic point comes 
across. We can define an arbitrary Gaussian process with arbitrary Kernel by 
expanding in basis functions $\phi(x)$, much like we did when moving from the 
univariate Gaussian to the multivariate Gaussian, with non-trivial covariance 
between the components of our random vector. 

In the case of the squared exponential kernel, the set of basis functions is 
formally infinite, but ultimately this doesn't matter for the conditional 
distribution, 

\begin{eqnarray} 
f(x^*) \vert X &amp;=&amp; \sum_{i} \alpha_i K(x^*, X_i) 
\end{eqnarray} 

which is a piece of wisdom from the representer theorem. For any regularized 
regression problem with quadratic cost -- which, is the same thing as putting 
a prior on the weights $\vec{w}$ in our model and maximizing the Gaussian 
posterior -- we can represent our smooth solution completely in terms of the 
input data $X$. 

This may have a simple connection, in the process view, to the "family of 
functions", and that when we observe our stochastic process at discrete 
intervals $X$ with values $\vec{f}$, we are really hitting our original pdf 
with a series of dirac delta functions. 