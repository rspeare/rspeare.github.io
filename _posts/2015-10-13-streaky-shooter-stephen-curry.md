---
layout: post
title: Streaky Shooter, Stephen Curry
date: '2015-10-13T20:18:00.001-07:00'
author: Robert Speare
tags:
- Stationary Distribution
- conditional
- Markov
- Bayes
- cumulants. statistics
modified_time: '2016-05-18T20:33:29.817-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-5359845283144880148
blogger_orig_url: http://rspeare.blogspot.com/2015/10/streaky-shooter-stephen-curry.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">So, recently I was given 
the following problem: let's say some basketball player has an a priori 
probability  $P(y_1=1)=0.35$ of making  a three point shot. This implies the 
probability of missing the three-pointer is $P(y=0)=0.65$. (Note that $y=1$ 
denotes ``make'' and $y=0$ ``miss''.) Pretty good odds, for an NBA player -- I 
think. 

But let's say that our basketball player is streaky, in the sense that 
$P(y_2=1 \vert y_1=1)=0.6$, or the probability of making the next shot, given 
that he made the previous, is sixty percent. (This implies $P(y_2=0 \vert 
y_1=1)=0.4$.) And conversely, the probability of making the next shot, given 
that he missed the previous is a bit lower than the prior, $P(y_2=1 \vert 
y_0=0)=0.3$, which implies $P(y_2=0 \vert y_0=0)=0.7$. This defines something 
called a markov process, in the sense that the $n^\mathrm{th}$ shot only 
depends on the one before it. 

\begin{eqnarray} 
P(y_n \vert y_{n-1},y_{n-2},\dots y_2,y_1) &amp;=&amp; P(y_n \vert y_{n-1}) 
\end{eqnarray} 

To repeat an old aphorism: ``the future to depends on the past only through 
the present''. We can represent this conditional probability density with a 
matrix, 

\begin{eqnarray} 
P(y_n \vert y_{n-1}) &amp;=&amp; \mathbf{W}= \left(\begin{array}{cc} 
.6 &amp; .3 \\ 
.4 &amp; .7 \\ 
\end{array}\right) 
\end{eqnarray} 

and the a priori probability density with a vector: 

\begin{eqnarray} 
P(y_1) &amp;=&amp; \left(\begin{array}{c} 
0.35 \\ 
0.65 
\end{array}\right) 
\end{eqnarray} 

If we want to write down the joint probability density on a few shots, we can 
use Bayes' chain rule: 

\begin{eqnarray} 
P(y_3, y_2,y_1) &amp;=&amp; P(y_3 \vert y_2, y_1) P(y_2 \vert y_1) P(y_1) 
\end{eqnarray} 

which by markov property simplifies to 

\begin{eqnarray} 
P(y_3, y_2,y_1) &amp;=&amp; P(y_3 \vert y_2) P(y_2 \vert y_1) P(y_1) 
\end{eqnarray} 

Marginalizing over $y_2$ we see that we have a matrix multiplication: 

\begin{eqnarray} 
\sum_{y_2} P(y_3, y_2,y_1) &amp;=&amp; \sum_{y_2}  P(y_3 \vert y_2) P(y_2 
\vert y_1) P(y_1)\\ 
P(y_3,y_1) &amp;=&amp; \sum_{y_2}  P(y_3 \vert y_2) P(y_2 \vert y_1) P(y_1) 
\end{eqnarray} 

and, dividing through by $P(y_1)$ is the same as conditioning on $y_1$, so we 
have a new conditional probability, which connects the third shot to the 
first: 

\begin{eqnarray} 
P(y_3 \vert y_1) &amp;=&amp; \sum_{y_2}  P(y_3 \vert y_2) P(y_2 \vert y_1) 
\end{eqnarray} 

This is often called the Chapman Kolgomorov equation, and is the basis for 
much analysis in physics of the rate of change of probability distributions 
through the master equation and Fokker-Planck equation. 

It's pretty easy to see that any conditional distribution can now be written 
as $n-1$ matrix contractions: 

\begin{eqnarray} 
P(y_n \vert y_1) &amp;=&amp; (\mathbf{W})^{n-1} 
\end{eqnarray} 

If we multiply by the vector $P(y_1)$, we get the distribution on $y_n$ alone, 
since 

\begin{eqnarray} 
P(y_2) &amp;=&amp; \sum_{y_1} P(y_2 \vert y_1)P(y_1)\\ 
&amp;=&amp; \mathbf{W}\cdot \vec{\mathbf{P}}_1 \\ 
P(y_n) &amp;=&amp; (\mathbf{W})^{n-1} \cdot \vec{\mathbf{P}}_1 
\end{eqnarray} 

But Markov matrices, since their columns add to unity and have strictly 
non-negative entries have some very useful properties (the Perron-Frobenius 
Theorem). Their spectra -- or eigenvalues -- all lie within the unit circle in 
the complex plane, and there is guaranteed to be some eigenvector 
$\mathbf{\pi}$ with an eigenvalue $\lambda=1$. This eigenvector is called the 
stationary distribution, and after $n \to \infty$ time steps, we expect our 
distribution to converge to $\mathbf{\pi}$. For the matrix given above, this 
vector is 

\begin{eqnarray} 
\mathbf{\pi} &amp;=&amp; \left(\begin{array}{c} 
0.428 \\ 
0.572 
\end{array}\right) 
\end{eqnarray} 

So after sufficient shots, our shooter will converge to a 42.8 percent success 
rate, as compared to 35 -- or whatever you specified. This discrepancy is 
important, as the expected number of buckets given $m$ shots does not go like 
a binomial distribution 

\begin{eqnarray} 
\langle \sum_i y_i \rangle &amp;=&amp; m p_0 \\ 
p_0=0.35 
\end{eqnarray} 

but something slightly different. More like a binomial process with changing 
parameter $p$. As $m$ gets large we expect 

\begin{eqnarray} 
\langle \sum_i y_i \rangle &amp;\approx &amp; m \pi_0 \\ 
\pi_0 &amp;=&amp; 0.428 = \frac{3}{7} 
\end{eqnarray} 