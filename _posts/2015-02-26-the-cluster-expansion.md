---
layout: post
title: The Cluster Expansion and "Connected" Cumulants
date: '2015-02-26T15:52:00.003-08:00'
author: Robert Speare
tags:
- cluster
- probability
- Statistical Mechanics
- cumulants. statistics
modified_time: '2015-02-26T20:19:22.485-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8549618632557213008
blogger_orig_url: http://rspeare.blogspot.com/2015/02/the-cluster-expansion.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"> 
Something that has been bothering me for a long time is the diagrammatic 
connection between moments and the connected moments. Or the moments of a 
distribution and the cumulants: 

\begin{eqnarray} 
\langle x \rangle \sim \langle x \rangle_c 
\end{eqnarray} 

The simplest way to deal with this is to write the moment generating function 
and cumulant generating function in a Taylor series. For the moment generating 
function, or should I say characteristic function we have: 

\begin{eqnarray} 
\phi(k) &amp;=&amp; \int P(x) e^{ikx}dx \\ 
&amp;=&amp; \sum_{n=0}^\infty \frac{(-ik)^n}{n!}\langle x^n \rangle 
\end{eqnarray} 

and for the cumulant generating function: 

\begin{eqnarray} 
\psi(k) &amp;=&amp; \log \phi(k) \\ 
&amp;=&amp;  \sum_{n=0}^\infty \frac{(-ik)^n}{n!}\langle x^n \rangle_c 
\end{eqnarray} 

Equating these two expressions, we have 

\begin{eqnarray*} 
\sum_{n=0}^\infty \frac{(-ik)^n}{n!}\langle x \rangle &amp;=&amp; 
e^{\sum_{n=0}^\infty \frac{(-ik)^n}{n!}\langle x^n \rangle_c} 
\end{eqnarray*} 

The sum in the exponential on the right hand side is really just a product, 
which I can write as: 

\begin{eqnarray*} 
\sum_{m=0}^\infty \frac{(-ik)^m}{m!}\langle x^m \rangle &amp;=&amp; 
\prod_{n=1}^\infty \left( e^{\frac{(-ik)^n}{n!}\langle x^n \rangle_c }\right) 
\\ 
&amp;=&amp;\prod_{n=1}^\infty  \left( \sum_p 
\frac{(-ik)^{np}}{p!(n!)^p}\langle x^n \rangle_c^p \right) 
\end{eqnarray*} 

So this is an interesting comparison. Since both expansions rely on certain 
powers -- or should I say a certain number of derivatives -- of $k$. If we 
equate the two sides under the condition 

\begin{eqnarray} 
\sum p n = m 
\end{eqnarray} 

where, $p$ is different for every $n$, so we had better write: 

\begin{eqnarray} 
\sum p_n n = m 
\end{eqnarray} 

we get: 

\begin{eqnarray*} 
\langle x^m \rangle &amp;=&amp; \sum_{\lbrace p_n \rbrace}m! 
\prod_{n=1}^\infty \frac{1}{p_n! (n!)^{p_n}}\langle x^n \rangle_c^{p_n} 
\end{eqnarray*} 

Where we sum over the set $p_n \epsilon \lbrace p \rbrace $ that satisfies 
$\sum p_n n = m$. Kardar says that this combinatoric factor is just the number 
of ways we can break up $m$ objects into $p_n$ clusters, each of $n$ 
components. When you think about it, this works. Take four points and split 
them into one cluster of two points, $p_2=1$ and two ``clusters'' of one 
point, $p_1=2$. We satisfy $\sum p_n n = m$ since $p_2+p_1=4$. Now, the 
points, as a whole, can be ordered in $4!$ ways, but once we bunch them into 1 
cluster of $2$ points, we find that those remaining two points are 
indistinguishable ``inside the cluster''. So we get a combinatoric factor of 
6. Similarly, there are 3 ways of breaking four points into two clusters of 
two points, one way of breaking four points into four clusters of four points, 
one way of breaking four points into one cluster of four points, etc. 

You could go on and on like this until your head falls off. But this finally 
makes explicit -- and, kind of intuitive -- the connection between cumulants 
and moments. 

So, the question becomes, \textbf{**why define cumulants anyway**}? 
\textbf{**What are their properties**}? One of the things I've learned is that 
cumulants add under convolution, so when we add two random variables, and 
thereby convolve their probability densities, we get a multipliciation of the 
characteristic functions (by the convolution theorem). And this means that 

\begin{eqnarray} 
P(z=x_1+x_2) &amp;=&amp; P(x_1) \star P(x_2) = \int P(\tau)P(z-\tau)d \tau  \\ 
\phi(k_1,k_2) &amp;=&amp; \phi(k_1)\phi(k_2) = e^{\psi(k_1)+\psi(k_2)} 
\end{eqnarray} 

So cumulants, as I'm beginning to learn in Thermodynamics are 
\textbf{**extensive**}. The cumulant generating function itself is 
\textbf{**extensive**}. Just like the partition function $Z$ is 
\textbf{**extensive**}. This extensivity property has very deep implications 
because when we take the average of a sum of independently identically 
distributed random variables: 

\begin{eqnarray} 
Z &amp;=&amp; \frac{x_1+x_2+\dots x_N}{N} 
\end{eqnarray} 

The cumulant generating function of that sum goes like the sum as well: 

\begin{eqnarray} 
\psi(k) &amp;=&amp; \sum_{i=1}^N \psi_i(k) 
\end{eqnarray} 

and therefore, the variance of the mean is not extensive but inversely 
extensive, as many many mathematicians know because of the law of large 
numbers: 

\begin{eqnarray} 
\sigma^2_{x_1+x_2+\dots} &amp;=&amp; N \sigma_{x} \\ 
\sigma^2_Z &amp;=&amp; \frac{\sigma^2}{N} 
\end{eqnarray} 

Higher order cumulants, as $N$ gets large will vanish even faster: 

\begin{eqnarray} 
\langle Z^n \rangle_c \sim \frac{1}{N^{n-1}} 
\end{eqnarray} 

And this is another way to prove the the law of large numbers. All higher 
order cumulants will diminish faster than $\frac{1}{N}$, so the leading order 
contribution comes from variance. This convergence of averages is a very 
powerful tool in Statistical mechanics, where $N$ is absurdly large, like 
$10^{23}$. 

------------------------------------------ 

The central limit theorem, I am still convinced, relies on something else, 
which is the boundedness above of the characteristic function $\phi(k)$ by 
unity. Under many many multiplications, this multivariate $\phi(k)$ collapses 
about the origin, and one is well justified in Taylor expanding in $k$ only to 
second order, which is, a Gaussian. 

----------------------------------------- 

Now back to this cluster expansion. This formula, the combinatoric factor for 
breaking $m$ balls into $p_n$ clusters of $n$ constituents is a very important 
concept, because it is, in the multivariate case, what underlies Wick's 
theorem in field theory. Field Theory is so heavily based on Gaussian 
statistics because all free fields have Gaussian properties, so it is often 
easy to forget how to generally break down a multi-variate cumulant, but the 
key lies in this cluster expansion. 

Let's see if we can do the cluster expansion in the multi-variate case. The 
characteristic function can be expanded as 

\begin{eqnarray} 
\phi(\vec{k}) &amp;=&amp; \sum_{m=0}^\infty \frac{(-i)^m}{m!} \prod_{i=1}^N 
\left(k_i^{m_i}\right)\langle x_1^{m_1}x_2^{m_2}\dots x_N^{m_N} \rangle 
\end{eqnarray} 

equating this with the cumulant generating function, we get something quite 
nasty: 

\begin{eqnarray*} 
\phi(\vec{k}) &amp;=&amp; \prod_{n=1}^\infty \left(\sum_{p_n=0}^\infty 
\frac{(-i)^{np_n}}{(n!)^{p_n}p_n!} \left(\prod_{i=1}^N k_i^{n_i}\right)^{p_n} 
\langle x_1^{n_1}x_2^{n_2}\dots x_N^{n_N} \rangle_c \right) 
\end{eqnarray*} 

Equating like powers of $k_1,k_2,k_3,\dots$ separately, I get the condition 

\begin{eqnarray} 
\sum_n p_n n_i &amp;=&amp; m_i \ \forall i \epsilon [1,N] \\ 
\sum_n p_n n &amp;=&amp; m 
\end{eqnarray} 

Which is equivalent of saying, in each expectation value, we require the same 
total number of random variables and the same number of each type of random 
variable $x_i$. The combinatoric factors in this case might be tricky, since 
we are equating: 

\begin{eqnarray*} 
\sum_{m=0}^\infty \frac{(-i)^m}{m!} \prod_{i=1}^N 
\left(k_i^{m_i}\right)\langle x_1^{m_1}x_2^{m_2}\dots x_N^{m_N} \rangle 
&amp;=&amp; \prod_{n=1}^\infty \left(\sum_{p_n=0}^\infty 
\frac{(-i)^{np_n}}{(n!)^{p_n}p_n!} \left(\prod_{i=1}^N k_i^{n_i}\right)^{p_n} 
\langle x_1^{n_1}x_2^{n_2}\dots x_N^{n_N} \rangle_c^{p_n} \right) 
\end{eqnarray*} 

When we look at the requirement $\sum_i n_i = n$, we realize that there are 
$\frac{n!}{n_1! n_2! \cdots n_N!}$ ways -- a multinomial combinatoric -- to do 
this. So each term on the right should be weighted by this factor: 

\begin{eqnarray*} 
\langle x_1^{m_1}x_2^{m_2}\dots x_N^{m_N} \rangle &amp;=&amp; \sum_{\lbrace p 
\rbrace} m! \prod_{n=1}^\infty \left(\frac{1}{(n!)^{p_n}p_n!} 
\left(\frac{n!}{n_1! n_2! \cdots n_N!} \right) \langle x_1^{n_1}x_2^{n_2}\dots 
x_N^{n_N} \rangle_c^{p_n} \right) 
\end{eqnarray*} 

This is an intimidating formula, and may not be correct. 