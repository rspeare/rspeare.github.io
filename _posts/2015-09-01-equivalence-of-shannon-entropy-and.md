---
layout: post
title: Equivalence of Shannon Entropy and Logarithm of Posterior Partition function
  (under Laplace Approximation)
date: '2015-09-01T06:07:00.002-07:00'
author: Robert Speare
tags:
- Partition Function
- entropy
- cumulants. statistics
- Gaussian
modified_time: '2015-10-16T07:58:23.261-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-881850256490669844
blogger_orig_url: http://rspeare.blogspot.com/2015/09/equivalence-of-shannon-entropy-and.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Now, the integral of the 
posterior over parameter space is called the evidence: 

\begin{eqnarray} 
P(D) = Z &amp;=&amp; \int d\vec{\theta} \mathcal{L}(D \vert 
\vec{\theta})P(\vec{\theta}) 
\end{eqnarray} 

If we approximate the un-normalized posterior as a Gaussian -- which I've 
recently learned from Christopher Bishop is called the Laplace approximation 
-- by taking logarithmic derivatives, then we get: 

\begin{eqnarray} 
P(D \vert \vec{\theta})P(\vec{\theta}) &amp;\approx &amp; P(D \vert 
\vec{\theta}_{\mathrm{MAP}})P(\vec{\theta}_{\mathrm{MAP}})\mathrm{exp}\left[-(\vec{\theta}-\vec{\theta}_{\mathrm{MAP}})_i\left(F_{ij}+\Sigma_{ij}^{-1}\right)(\vec{\theta}-\vec{\theta}_{\mathrm{MAP}})_j 
\right] 
\end{eqnarray} 

We already know what the integral of this Gaussian over parameter space will 
be: 

\begin{eqnarray} 
\log Z &amp;=&amp; \frac{D}{2}\log(2\pi)+\frac{1}{2}\log \left( \vert 
F_{ij}+\Sigma_{ij}^{-1} \vert\right) 
\end{eqnarray} 

Comparing this with our measured entropy of the posterior, we see we're off by 
just a constant: 

\begin{eqnarray} 
H\left[ P(\vec{\theta} \vert D \right] &amp;=&amp;  
\frac{D}{2}\log(2\pi)+\frac{1}{2}\log \left( \vert F_{ij}+\Sigma_{ij}^{-1} 
\vert\right) + \frac{D}{2} 
\end{eqnarray} 

This is another example of why a statistical mechanics interpretation of $Z$, 
our normalization of the posterior, is right on point. It's logarithm -- up to 
an additive constant, which can be thrown away -- is equal to the Entropy of 
our distribution, which is a common point of wisdom in statistical mechanics. 
So in conclusion, under the laplace approximation, writing our posterior as a 
Gaussian by expanding in the exponential, collecting the first 
$\vec{\theta}_{\mathrm{MAP}}$ and second $F_{ij}$ cumulants, we get: 

\begin{eqnarray} 
\log Z &amp;=&amp; H\left[P(\vec{\theta} \vert D )\right] + \mathrm{const} 
\end{eqnarray} 