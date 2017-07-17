---
layout: post
title: 'Differential Regularizers as Priors over Functions $f(x)$: Gaussian Process
  Kernels as Green''s Functions'
date: '2015-11-02T10:27:00.002-08:00'
author: Robert Speare
tags:
- Stationary Distribution
- Regression
- stochastic process
- Machine Learning
- cumulants. statistics
- Gaussian
modified_time: '2015-12-02T13:28:36.055-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8995006586300579578
blogger_orig_url: http://rspeare.blogspot.com/2015/11/differential-regularizers-as-priors.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Often, when we are 
solving a regression problem, we are given the following functional: 

\begin{eqnarray} 
J[f] &amp;=&amp; l\left[f,y\right]+\Omega \left[f \right] 
\end{eqnarray} 

Where $l$ is some loss functional and $\Omega$ is some regularizer. Given some 
finite dataset, this might look like, in the case of squared loss: 

\begin{eqnarray} 
X &amp;=&amp; \lbrace \mathbf{x}_n \rbrace_{n=1}^N \\ 
J &amp;=&amp; \sum_{n=1}^N \left( f(\mathbf{x}_n)-y_n \right)^2 + \Omega(f) 
\end{eqnarray} 

For a linear basis expansion model, we have the following: 

\begin{eqnarray} 
f(\mathbf{x}) &amp;=&amp; \mathbf{w}\cdot \phi(x) \\ 
J(\mathbf{w}) &amp;=&amp; \sum_{n=1}^N \left(  \mathbf{w}\cdot \phi(x_n) -y_n 
\right)^2 + \lambda \vert \mathbf{w} \vert^2 
\end{eqnarray} 

where $\lambda \vert \mathbf{w} \vert^2$ plays the role of a prior over 
functions. The cost function in this example is proportional to the negative 
log prior, what we have is essentially: 

\begin{eqnarray} 
-\log P(\mathbf{w} \vert X, \mathbf{y}, \phi) &amp; \sim &amp; J(\mathbf{w}) 
\\ 
-\log \mathcal{L}(X, \mathbf{y} \vert \mathbf{w} \phi) &amp; \sim &amp; 
\sum_{n=1}^N \left(  \mathbf{w}\cdot \phi(x_n) -y_n \right)^2 \\ 
-\log P(\mathbf{w} \vert \phi) &amp; \sim &amp;  \Omega(f) = \lambda \vert 
\mathbf{w} \vert^2 
\end{eqnarray} 

(So that's a Gaussian likelihood and a Gaussian prior). Minimizing the cost 
with respect to $\mathbf{w}$ is same thing as finding the mode of the 
posterior, or Maximum a Posteriori. (MAP). We've already talked about how, for 
such a regularized regression problem, we can right the solution as a linear 
combination of kernels, centered at the data: 

\begin{eqnarray} 
f(\mathbf{x}) &amp;=&amp; \sum_{n=1}^N \alpha_n K(\mathbf{x},\mathbf{x}_n ) 
\end{eqnarray} 

a manifestation of the representer theorem. But one important question to ask, 
given some regularization functional, is, what's the ``best'' Kernel? Let's 
take for example the regularizer: 

\begin{eqnarray} 
J &amp;=&amp; \int dx \left(f(x)-y \right)^2 + \lambda \int dx 
\vert\frac{\partial^2 f(x)}{\partial x^2}\vert^2 
\end{eqnarray} 

This $\Omega$ functional penalizes curvature in our fitting function $f(x)$, 
and we can note that what such a regularizer really is, is a prior over 
functions, since: 

\begin{eqnarray} 
P(f  \vert f(X), \mathbf{y} ) &amp;=&amp;\frac{P(X,y \vert f) P(f)}{P(X, 
\mathbf{y})} \\ 
&amp;=&amp; \frac{\mathrm{exp}\left[-\int dx \delta^D(y-f(X)) \left(f(x)-y 
\right)^2 - \lambda \int dx \vert\frac{\partial^2 f(x)}{\partial x^2}\vert^2 
\right] }{P(X, \mathbf{y})} \\ 
\end{eqnarray} 

We see that the prior on our function is: 

\begin{eqnarray} 
P[f] &amp;\sim &amp; \mathrm{exp}\left(-\lambda \int \vert f^{\prime 
\prime}(x)\vert^2 dx \right) 
\end{eqnarray} 

where $\lambda$ controls the "strength" of our penalty for curvature. To be 
more general, we could have written the prior on our function as a 
superposition of differential operators: 

\begin{eqnarray} 
P[f] &amp;\sim &amp; \mathrm{exp}\left(-\int \sum_{m=1}^\infty a_m 
\frac{\partial^m }{\partial x^m}\vert f(x)\vert^2 dx \right) 
\end{eqnarray} 

If we integrate by parts, we note that this prior functional can be put into 
the form: 

\begin{eqnarray} 
P[f] &amp;\sim &amp; \mathrm{exp}\left(-\int dx dx^\prime f(x) 
K(x,x^\prime)^{-1} f(x^\prime) \right) 
\end{eqnarray} 

Which of course gives us the familiar prior assumptions that $f(x)$ has mean 
and covariance: 

\begin{eqnarray} 
\langle f(x) \rangle &amp;=&amp; 0 \\ 
\mathrm{Var}\left(f(x) \right) &amp;=&amp; K(x,x^\prime) 
\end{eqnarray} 

But, for a given differential regularizer, how do we find the associated 
Kernel? The answer is simple, it's just the Green's function of the operator: 

\begin{eqnarray} 
\hat{L} &amp;=&amp; \sum_m a_m \frac{\partial^m}{\partial x^m}\\ 
\hat{L}K &amp;=&amp; \sum_m a_m \frac{\partial^m}{\partial x^m} K(x,x^\prime) 
= \delta(x-x^\prime) 
\end{eqnarray} 

An easy way to get the green's function -- or in this case Kernel -- is to 
fourier transform. We can re-write our prior in $s$ space: 

\begin{eqnarray} 
f(s) &amp;=&amp; \int dx e^{-isx}f(x) \\ 
P[f] &amp;\sim &amp; \mathrm{exp}\left(-\int ds\sum_{m=1}^\infty a_m 
\vert\mathbf{s}\cdot \mathbf{s}\vert^m\vert f(s)\vert^2 dx \right) 
\end{eqnarray} 

We see now the fourier transform of our inverse kernel is: 

\begin{eqnarray} 
\frac{1}{K(s,s^\prime)} &amp;=&amp; \sum_m a_m (-1)^m \vert \mathbf{s}\cdot 
\mathbf{s} \vert^m \delta^D(\mathbf{s}+\mathbf{s}^\prime) 
\end{eqnarray} 

We see that the kernel is diagonal and in $s$ space and semi-positive 
definite. Which means that we are translationally invariant in $x$ space. We 
have: 

\begin{eqnarray} 
K(x,x^\prime) &amp;=&amp; \int ds ds^\prime e^{isx+is^\prime x^\prime} 
\frac{1}{\sum_m a_m (-1)^m \vert \mathbf{s}\cdot \mathbf{s}^\prime 
\vert^m}\delta^D(\mathbf{s}+\mathbf{s}^\prime)\\ 
K(x-x^\prime) &amp;=&amp; \int ds  e^{is(x-x^\prime)} \frac{1}{\sum_m a_m 
\vert \mathbf{s}\cdot \mathbf{s} \vert^m} 
\end{eqnarray} 

We see that, indeed, our Kernel will be translationally invariant, and when we 
put a prior over functions, what is essentially a Lagrangian in physics: 

\begin{eqnarray} 
\Omega[f] \sim L &amp;=&amp; \int dx f(x) \left(\sum_m a_m 
\frac{\partial^m}{\partial x^m}\right) f(x) 
\end{eqnarray} 

We find that the kernel is just the correlation function -- or, the propagator 
-- for the resulting stochastic process. One example is the massive free 
particle in higher dimensions -- or the free process in higher dimensional 
feature space -- for which we get the Yukawa potential: 

\begin{eqnarray} 
\Omega[f] \sim L &amp;=&amp; \int dx \frac{m^2}{2}f(x)^2+\frac{1}{2}\nabla^2 
f(x) \\ 
K(x-x^\prime) &amp;\sim &amp; \frac{1}{\vert x - x^\prime \vert }e^{-\vert 
x-x^\prime \vert m} 
\end{eqnarray} 

So, the Kernel we use when interpolating some field, or, specifying the prior 
of our Gaussian process, can be viewed as the Green's function to our 
penalizing "regularizer". If we want smooth functions up to order $m=M$, we 
know precisely how to formulate the associated $K(x-x^\prime)$. Note that all 
differential regularizers, such as discussed here will lead to stationary 
kernels and thus stationary processes. 