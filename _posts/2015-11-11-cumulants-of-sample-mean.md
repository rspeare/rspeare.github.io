---
layout: post
title: Cumulants of the Sample Mean
date: '2015-11-11T06:54:00.001-08:00'
author: Robert Speare
tags:
- Estimators
- random variables
- transforming a pdf
- Statistics
- cumulants. statistics
modified_time: '2015-11-11T06:55:05.159-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8564179465017549616
blogger_orig_url: http://rspeare.blogspot.com/2015/11/cumulants-of-sample-mean.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Let a random variable $X$ 
be drawn from some probability distribution, $X \sim P(x)$. Then, the sum of 
$N$ i.i.d. samples, or realizations is drawn from: 

\begin{eqnarray} 
P(s_N=\sum_{n=1}^N x_n) &amp;=&amp; (P*P*P\cdots P)(s_N)\\ 
&amp;=&amp; \int dk e^{iks_N}\phi(k)^N = \int dk e^{iks_n+N\log \phi(k)}\\ 
&amp;=&amp; \int dk e^{iks_N+N\psi(k)} 
\end{eqnarray} 

This means that the equivalent cumulants for the sample mean -- which is 
simply $\frac{s_N}{N}$ -- are: 

\begin{eqnarray} 
\bar{x} &amp;=&amp; \sum_n^N \frac{x_n}{N} \\ 
\langle \bar{x}^k \rangle_c &amp;=&amp; \frac{1}{N^k}\langle \left(\sum_n x_n 
\right)^k \rangle_c 
\end{eqnarray} 
Expanding out the term inside the brackets using the multinomial theorem, we 
get: 

\begin{eqnarray} 
\langle \bar{x}^k \rangle_c &amp;=&amp; \frac{1}{N^k}\langle \sum_{\vec{k}} 
\frac{k!}{k_1!k_2! \cdot k_N!} \prod_{n=1}^N x_n^{k_n}\rangle_c \\ 
&amp;=&amp; \frac{1}{N^k} \sum_{\vec{k}} \left(\begin{array}{c} 
k \\ 
k_1 \cdots k_N 
\end{array}\right) \langle  \prod_{n=1}^N x_n^{k_n} \rangle_c 
\end{eqnarray} 

any dependence between the samples $x_n$ yields this expression nontrivial, 
but if we assume i.i.d. we just get: 

\begin{eqnarray} 
\langle \bar{x}^k \rangle_c &amp;=&amp; \frac{1}{N^{k-1}} \langle x^k 
\rangle_c 
\end{eqnarray} 

Where the term in the RHS brackets is just a single realization of our random 
variable $x$. Why is this important? Because it tells us that the variance, 
which is the $k=2$ cumulant, scales as $\frac{1}{N}$, and the skewness, which 
is defined as: 

\begin{eqnarray} 
\mathrm{skew}&amp;=&amp;\frac{\langle \bar{x}^3 \rangle_c}{\left(\langle 
\bar{x}^2 \rangle_c \right)^{3/2}} \sim \frac{1}{\sqrt{N}} 
\end{eqnarray} 

scales as one over square root $N$. This means that our distribution on the 
mean collapses to a Gaussian AT LEAST as fast as $\frac{1}{\sqrt{N}}$, given 
some initial asymmetry in the distribution of $x$. (If we have symmetry, 
things are even better and we need only worry about the kurtosis, which goes 
like $\frac{1}{N}$. ) 

Such considerations are important when you ask yourself: at what point can I 
consider the estimator of the mean to be drawn from a Gaussian? How does my 
approximation scale with sample size? These are very important questions in 
the real world, and it nice to have a sense of what's holding you back from 
being exact -- namely, that $\frac{1}{\sqrt{N}}$ for skewness, which goes 
along with a hermite polynomial, and $\frac{1}{N}$, which goes with another.) 