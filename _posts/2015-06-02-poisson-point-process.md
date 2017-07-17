---
layout: post
title: Poisson Point Process and Cosmological Surveys
date: '2015-06-02T08:42:00.003-07:00'
author: Robert Speare
tags: 
modified_time: '2015-06-02T09:37:52.252-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-2805457290432459327
blogger_orig_url: http://rspeare.blogspot.com/2015/06/poisson-point-process.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Reading today about 
inhomogeneous Poisson Point Processes. How to even begin to describe what 
these things are? I'll start from what I know. 

The poisson distribution can be built from the exponential distribution, which 
is a memoryless property: 

\begin{eqnarray} 
P(x) &amp;=&amp; \lambda e^{-\lambda x} \\ 
P(x &gt;= t) &amp;=&amp; e^{-\lambda t} 
\end{eqnarray} 

One way of putting those two equations into words is, if the ``intensity'' or 
average number of subway trains to arrive per minute is $\lambda$, then the 
probability you have to wait more than $t$ minutes to grab a subway train goes 
down exponentially with $t$. But, it's important to note that if you've 
already been waiting 10 minutes, the Subway train ``doesn't care'' in the 
sense that your probability distribution stays the same. We can use Bayes' 
theorem to write this down. 

\begin{eqnarray} 
P(x &gt; t+t_0 \vert x &gt; t_0)  &amp;=&amp; \frac{P(x &gt; t_0  \vert x &gt; 
t+t_0)P(x &gt; t+t_0)}{P(x &gt; t_0)} \\ 
&amp;=&amp; \frac{P(x &gt; t+t_0)}{P(x &gt; t_0)} \\ 
&amp;=&amp; P(x &gt; t) 
\end{eqnarray} 

The first factor in our numerator is unity, since $t+t_0 &gt; t_0$, and by the 
property of exponentials, the arguments cancel. So why do we care? 

Well, let's take a step further and not that the sum of waiting times, 

\begin{eqnarray} 
T &amp;=&amp; \sum_{i=1}^n x_n 
\end{eqnarray} 

is drawn from the convolution of many exponential distributions, which is a 
Gamma distribution: 

\begin{eqnarray} 
T &amp;\sim &amp; \frac{T^{n-1}\lambda^n e^{-\lambda T}}{(n-1)!} 
\end{eqnarray} 

And now, if we want to construct the Poisson distribution, we ask ourselves, 
what is the probability that we had to wait time $T$ to see precisely $n$ 
arrivals -- be it of Subway cars, sandwiches, etc. 

\begin{eqnarray} 
P( T_{n+1} &gt; t)-P( T_{n} &gt; t) &amp;=&amp; \frac{(\lambda t)^n 
e^{-\lambda t}}{n!} 
\end{eqnarray} 

This is our Poisson distribution. One can get this quite easily by integrating 
the Gamma distribution by parts. But what if the ``intensity'' or underlying 
probability of a subway arrival time is not uniform throughout the day? What 
if $\lambda$ is in fact a unit of time? 

Such a situation is related to an inhomogeneous Poisson process, which has 
certain properties. But before we move onto that, let's talk about a 
homogeneous Poisson process. I've learned from Statistical mechanics that the 
exponential distribution is the ``most random'' or ``most entropic'' or 
``least informed'' of all distributions, corresponding to some expectation 
value $\lambda$ (which can be treated as a lagrange multiplier when maximizing 
the entropy of our probability distribution). This means that the Poisson 
distribution is the maximally entropic description of arrival counts up to 
some time $T$, given some arrival intensity $\lambda$. 

Apparently, the Poisson process can be defined in three equivalent ways: 

(1) The probability of an event in some infinitesimal window of time $dt$ is 
$\lambda dt$. This is reminiscent of the exponential distribution -- not a big 
deal 
(2) The inter-arrival times are independent and obey the exponential 
distribution. 
(3) The number of arrivals within some finite interval of time $T$ is drawn 
from Poisson. 

These are all things we already know, that we have already built in, but good 
to review. One way to generate a Poisson process is to draw the total number 
of arrivals from a Poisson distribution $P(n,\lambda)$, then `sprinkle' $n$ 
points along some interval $T$ with a uniform distribution.  It's important to 
note that two Poisson processes with intensities $\lambda_1,\lambda_2$ have an 
effective intensity $\lambda_1+\lambda_2$. Also, if one selects from this 
final Poisson process sample with a probability density $p(t)$, then the 
effective sample becomes representative of an underlying intensity 
$\lambda(t)$. In practice, this is how inhomogeneous Poisson processes are 
created. 

For cosmological surveys, we use inhomogeneous Poisson point process to model 
Galaxy occupation numbers in redshift space. The underlying ``intensity'' or 
``arrival rate'' of Galaxy occupation goes like the window function, 
$W(\mathbf{x})$. 