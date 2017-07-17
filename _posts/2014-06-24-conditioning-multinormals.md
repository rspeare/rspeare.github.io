---
layout: post
title: Conditioning Multinormals
date: '2014-06-24T10:58:00.001-07:00'
author: Robert Speare
tags:
- conditional
- cumulants
- Machine Learning
- Statistics
- Multinormal
modified_time: '2015-10-16T07:56:42.438-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-4876449324413240921
blogger_orig_url: http://rspeare.blogspot.com/2014/06/conditioning-multinormals.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">In the following, all 
equals signs will really mean "proportional" as we're going to work with 
probability densities and for the time being, don't want to worry about 
normalization. 

Let $\mathbf{x}$ and $\mathbf{y}$ be random vectors drawn from the following 
multinormal: 

\begin{eqnarray} 
P(\mathbf{x},\mathbf{y}) \sim \mathrm{N}\left( \left[\begin{array}{c} \mu_x \\ 
\mu_y \end{array}\right], \left[\begin{array}{cc} A &amp; C \\ C^T &amp; B 
\end{array}\right]^{-1} \right)\\ 
\sim e^{-\frac{1}{2} \left( \left[\begin{array}{cc} x-\mu_x ,&amp; y - \mu_y 
\end{array}\right] \cdot \left[\begin{array}{cc} A &amp; C \\ C^T &amp; B 
\end{array}\right]\cdot \left[\begin{array}{c} x-\mu_x, \\ y-\mu_y 
\end{array}\right] \right)} 
\end{eqnarray} 

The covariance matrix above is quite complicated, but we can think of $C^{-1}$ 
as cross correlating our vectors $\mathbf{x}$ and $\mathbf{y}$ and $A^{-1}$ 
and $B^{-1}$ "auto"-correlating within the vectors $\mathbf{x}$ and 
$\mathbf{y}$. We have set this up to be a **Block Diagonal Matrix**. We need 
not have $\mathbf{x}$ and $\mathbf{y}$ be of the same dimension. 

To find the inverse of a block diagonal matrix, like the above, we write 

\begin{equation} 
A=\left[\begin{array}{cc} P &amp; Q \\ R &amp; S \end{array}\right] 
\end{equation} 

we write: 

\begin{eqnarray} 
\left[\begin{array}{cc} P &amp; Q \\ R &amp; S 
\end{array}\right]\left[\begin{array}{cc} X_1 &amp; X_2 \\ X_3 &amp; X_4 
\end{array}\right] &amp;=&amp; \left[\begin{array}{cc} I &amp; 0 \\ 0 &amp; I 
\end{array}\right] 
\end{eqnarray} 

Which results in the following linear equations: 

\begin{eqnarray} 
PX_1+QX_3 &amp;=&amp; I \\ 
PX_2 &amp;=&amp; - Q X_4 \\ 
RX_1 = - S X_3 \\ 
RX_2+SX_4 &amp;=&amp; I 
\end{eqnarray} 

with the solutions: 

\begin{eqnarray} 
X_1 &amp;=&amp; P^{-1}+P^{-1}QMRP^{-1}\\ 
X_2 &amp;=&amp; -P^{-1}QM\\ 
X_3 &amp;=&amp; -MRP^{-1} \\ 
X_4 &amp;=&amp; M \\ 
M &amp;=&amp; (S-RP^{-1}Q)^{-1} 
\end{eqnarray} 

and 

\begin{eqnarray} 
X_1 &amp;=&amp; N\\ 
X_2 &amp;=&amp; -NQS^{-1}\\ 
X_3 &amp;=&amp; -S^{-1}RN \\ 
X_4 &amp;=&amp; S^{-1}+S^{-1}RNQS^{-1} \\ 
N &amp;=&amp; (P-QS^{-1}R)^{-1} 
\end{eqnarray} 

Now, let's say we are interested in the conditional multinormal 

\begin{eqnarray} 
(x \vert y) \sim ? 
\end{eqnarray} 

We expect ?, above, to be another Gaussian, which will be uniquely determined 
by its mean and variance -- the first two cumulants. Let's right down the 
conditional expectation value using Bayes' Theorem: 

\begin{eqnarray} 
\langle\mathbf{x} \vert \mathbf{y}\rangle &amp;=&amp; \int \mathbf{x} P(x\vert 
y) d\mathbf{x} \\ 
&amp;=&amp; \int \mathbf{x} \frac{P(\mathbf{x},\mathbf{y})}{P(\mathbf{y})} 
d\mathbf{x} 
\end{eqnarray} 

And now, to expand things to higher order in $\mathbf{x}$, we can create a 
conditional moment generating function: 

\begin{eqnarray} 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; \int d\mathbf{x} 
\left(e^{\mathbf{\lambda}\cdot (\mathbf{x} \vert \mathbf{y})}\right)\ \ 
\frac{e^{-\frac{1}{2} \left( \left[\begin{array}{cc} x-\mu_x &amp; y-\mu_y 
\end{array}\right] \cdot \left[\begin{array}{cc} A &amp; C \\ C^T &amp; B 
\end{array}\right]\cdot \left[\begin{array}{c} x-\mu_x \\ y-\mu_y 
\end{array}\right] \right)} }{e^{-\frac{1}{2} \left( \left[\begin{array}{cc} 
x-\mu_x &amp; y-\mu_y \end{array}\right] \cdot \left[\begin{array}{cc} 0 &amp; 
0 \\ 0 &amp; B \end{array}\right]\cdot \left[\begin{array}{c} x-\mu_x \\ 
y-\mu_y \end{array}\right] \right)}} 
\end{eqnarray} 

Notice how the denominator is just the Probability density on $\mathbf{y}$. 
Let's rewrite $\mathbf{x}^\prime = \mathbf{x}-\mathbf{\mu}_x$ and 
$\mathbf{y}^\prime = \mathbf{y}-\mathbf{\mu}_y$ to simplify things. Let's also 
get rid of the conditional notation $\vert y $ in the exponent to clean things 
up and make conditioning implicit: 

\begin{eqnarray} 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; \int d\mathbf{x} 
\left(e^{\mathbf{\lambda}\cdot (\mathbf{x^\prime}+\mathbf{\mu}_x )}\right)\ \ 
e^{-\frac{1}{2} \left( \left[\begin{array}{cc} x^\prime &amp; y^\prime 
\end{array}\right] \cdot \left[\begin{array}{cc} A &amp; C \\ C^T &amp; 0 
\end{array}\right]\cdot \left[\begin{array}{c} x^\prime \\ y^\prime 
\end{array}\right] \right)} \\ 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; \int d\mathbf{x} 
\left(e^{\mathbf{\lambda}\cdot (\mathbf{x^\prime}+\mathbf{\mu}_x )}\right)\ \ 
e^{-\frac{1}{2} \left( \left[\begin{array}{cc} x^\prime &amp; y^\prime 
\end{array}\right] \cdot \left[\begin{array}{c} Ax^\prime+Cy^\prime \\ 
C^Tx^\prime \end{array}\right] \right)} \\ 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; e^{\lambda \cdot 
\mathbf{\mu}_x }\int d\mathbf{x} \left(e^{\mathbf{\lambda}\cdot 
\mathbf{x^\prime}}\right)\ \ e^{-\frac{1}{2}\left( x^\prime_i 
A_{ij}x^\prime_j)- C_{ij} x^\prime_i y^\prime_j \right)} 
\end{eqnarray} 

Now we can simplify things a little bit, by writing $ik_i = 
\lambda_i-C_{ij}y^\prime_j$ 
\begin{eqnarray} 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; e^{\lambda \cdot 
\mathbf{\mu}_x }\int d\mathbf{x} 
\left(e^{(\lambda_i-C_{ij}y^\prime_j)x^\prime_i}\right)\ \ 
e^{-\frac{1}{2}\left( x^\prime_i A_{ij}x^\prime_j \right)}\\ 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; e^{\lambda \cdot 
\mathbf{\mu}_x }\int d\mathbf{x} e^{ik_i x^\prime_i}\ \ e^{-\frac{1}{2}\left( 
x^\prime_i A_{ij}x^\prime_j \right)} 
\end{eqnarray} 

And now we have a multidimensional Fourier transform of a Gaussian, (which is 
another Gaussian) 

\begin{eqnarray} 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; e^{\lambda \cdot 
\mathbf{\mu}_x }e^{-\frac{1}{2}k_i A^{-1}_{ij}k_j}\\ 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; e^{\lambda \cdot 
\mathbf{\mu}_x 
-\frac{1}{2}(\lambda_i-C_{il}y^\prime_l)A^{-1}_{ij}(\lambda_j-C_{jm}y^\prime_m)}\\ 
\end{eqnarray} 

Foiling out and collecting like terms in $\lambda $, we've got: 

\begin{eqnarray} 
\langle e^{(\mathbf{x} \vert \mathbf{y})} \rangle &amp;=&amp; e^{\lambda_i 
\left[\mathbf{\mu}^{(x)}_i  -\frac{1}{2}A^{-1}_{ij} 
C_{jm}(y_m-\mu^{(y)}_m)\right]-\left[\frac{1}{2}\lambda_i 
A^{-1}_{ij}\lambda_j\right] \ \ - \ \ 
(y_l-\mu^{(y)}_l)C_{il}A^{-1}_{ij}C_{jm}(y_m-\mu^{(y)}_m)} \\ 
\end{eqnarray} 

And now we see that the first moment and variance behave differently than one 
would expect: 
\begin{eqnarray} 
\frac{\partial}{\partial \lambda_i}\langle e^{(\mathbf{x} \vert 
\mathbf{y})}\vert_{\mathbf{\lambda}=0} \rangle &amp;=&amp;\langle x_i \rangle 
= \mathbf{\mu}^{(x)}_i  - A^{-1}_{ij} C_{jm}(y_m-\mu^{(y)}_m) \\ 
\frac{\partial^2}{\partial \lambda_i \lambda_j}\langle e^{(\mathbf{x} \vert 
\mathbf{y})}\vert_{\mathbf{\lambda}=0} \rangle &amp;=&amp;\langle x_i x_j 
\rangle = A^{-1}_{ij} = A-C B^{-1}C^T 
\end{eqnarray} 

Where each of these expectation values are modified by the Gaussian on 
$\mathbf{y}$, which is essentially another normalization factor that we've 
thrown out: 
\begin{eqnarray} 
f(y) &amp;=&amp; 
\mathrm{Exp}\left[-\frac{1}{2}(y_l-\mu^{(y)}_l)C_{il}A^{-1}_{ij}C_{jm}(y_m-\mu^{(y)}_m)\right] 
\end{eqnarray} 

So now, if we write the conditional Probability density function** 
**$\mathbf{P(x \vert y)}$, we have: 

\begin{eqnarray} 
P(\mathbf{x} \vert \mathbf{y}) &amp;=&amp; N\left[ \mathbf{\mu}^{(x)}_i  - 
A^{-1}_{ij} C_{jm}(y_m-\mu^{(y)}_m), A^{-1}_{ij} \right] \\ 
P(\mathbf{x} \vert \mathbf{y}) &amp;=&amp; N\left[ \mathbf{\mu}^{(x)}_i  - 
A^{-1}_{ij} C_{jm}(y_m-\mu^{(y)}_m), A-C B^{-1}C^T \right] 
\end{eqnarray} 