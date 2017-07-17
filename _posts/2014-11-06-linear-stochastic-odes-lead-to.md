---
layout: post
title: Linear Stochastic ODE's lead to Gaussianity at Asymptotic times, even if Noise
  function has non-zero higher order Cumulants
date: '2014-11-06T18:35:00.001-08:00'
author: Robert Speare
tags: 
modified_time: '2014-11-06T18:45:16.311-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8470974268006774081
blogger_orig_url: http://rspeare.blogspot.com/2014/11/linear-stochastic-odes-lead-to.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">So a few friends of mine 
are working on Stochastic ODE's and their connection to path integrals. After 
dorking out about this for a few moments, I'm able to make some ``baby'' 
statements about the problem. If you consider a sequence of random numbers: 

\begin{eqnarray} 
\left \lbrace \mathbf{X}_i \right \rbrace_{i=1}^n 
\end{eqnarray} 

which is determined by the following difference equation: 

\begin{eqnarray} 
d\mathbf{X}_i = \mathbf{X}_{i+1} - \mathbf{X}_i &amp;=&amp; a_i+\mathbf{W}_i 
\end{eqnarray} 

subject to the initial condition $\mathbf{X}_0=0$ 

You can express the solution as a sum of two sums -- one deterministic and one 
random. 

\begin{eqnarray} 
X_n &amp;=&amp; \sum_{i=0}^n a_i + \sum_{i=1}^n \mathbf{W_i} 
\end{eqnarray} 

Where I have boldfaced all random variables. For instance $a_i$ is a real 
sequence of numbers, perhaps they are the same for all $i$. $\mathbf{W}$ is a 
noise variable, or some random forcing function. We see that the solution 
after N steps will be 

\begin{eqnarray} 
\mathbf{X}_n &amp;=&amp; n a+ \sum_{i=1}^n \mathbf{W}_i 
\end{eqnarray} 

Now, if we see that $\mathbf{W}_i$ is drawn from some probability distribution 
at every single step $i$, we know that, at asymptotic times $N \to \infty$, 
subject to certain conditions on the probability density of $W_i$, our 
distribution on $\mathbf{X}$ will converge to a Gaussian. This is very cool, 
and not necessarily dependent on $\mathbf{W}$ being an identically 
independently distributed variable. We simply say  that if 
\begin{eqnarray} 
\mathbf{W_i} &amp; \sim &amp; N(0,\sigma^2) \ \ \forall i 
\end{eqnarray} 

then, 
\begin{eqnarray} 
\mathbf{X_N} &amp;\sim &amp; na(t)+ N(0, n \sigma^2) 
\end{eqnarray} 

Where $N(0,\sigma^2)$ stands for a normal distribution with zero mean and 
variance $\sigma^2$. Note that, this is simply a conclusion from the addition 
of cumulants under convolution -- which is what you do when add random 
variables. 

\begin{eqnarray} 
Z&amp;=&amp;X+Y \\ 
X &amp; \sim &amp; N(c_1, c_2)\\ 
Y &amp; \sim &amp; N(c_1^\prime, c_2^\prime )\\ 
Z &amp; \sim &amp; N(c_1+c_1^\prime, c_2+ c_2^\prime ) 
\end{eqnarray} 

So our cumulants add, and the central limit theorem hinges upon this, because 
since our characteristic function -- or the fourier transform of our 
probability distribution -- is bounded above by one (1), when we convolve tow 
distributions in real space we multiply in frequency space, making the 
characteristic function of our result variable $Z$ -- which is very much like 
an average, thinner and thinner and thinner... Meaning that you can truncate 
the characteristic function's cumulant generating function $\psi$ at order 
$k^2$, leading to a Gaussian. 

This means that any sum of random variables, even they are not identically and 
independently distributed -- although they must be independent in order to 
convolve -- and even if those variables have non-zero higher order cumulants, 
like skewness $c_3$ or kurtosis $c_4$, will give you a Gaussian in the $n \to 
\infty$ limit. This is an analog of the law of large numbers. 

So why do we care in this Stochastic ODE case? It means that under linear 
dynamics, at asymptotic times, we converge to a Gaussian distribution on 
$\mathbf{X}$, even our noise function itself has very strange properties, like 
higher order cumulants. This is very strange indeed, and comes from the fact 
that system is **linear**, i.e. we are **adding** random variables together. 

Under non-linear evolution, it can be shown using Perturbation theory that 
non-zero third and higher order moments are created, but showing this in the 
stochastic framework is a bit difficult... 

It is easy to show however, that an equation like: 

\begin{eqnarray} 
L_0 \delta &amp;=&amp; \delta^2 
\end{eqnarray} 

where $L_0$ is some linear differential operator, can be expanded in power 
series of small parameter $\lambda$ 
\begin{eqnarray} 
L_0 \delta &amp;=&amp; \lambda \delta^2\\ 
\delta &amp;=&amp; \sum_{i=1}^\infty \lambda^i \delta_i 
\end{eqnarray} 

So we have, to each order: 

\begin{eqnarray} 
\lambda^0 : L_0 \delta_0 &amp;=&amp; 0 
\end{eqnarray} 

which is our linear solution. Then we have to leading order: 
\begin{eqnarray} 
\lambda^1: L_0 \delta_1 &amp;=&amp; \delta_0^2 
\end{eqnarray} 

Now we find, that if we take the connected third moment, or the third 
cumulant, we get a nonzero value: 

\begin{eqnarray} 
\langle \delta^3 \rangle &amp;=&amp; \langle \delta_0 ^3 \rangle +\lambda 
\langle \delta_0^2 \delta_1 \rangle + \dots 
\end{eqnarray} 

If $\delta_0$ is Gaussian distributed, as we found that we would be for some 
driving function at asymptotic times -- or if we simply assume Gaussian 
initial conditions -- then we know that $\langle \delta_0^3 \rangle =0$. The 
leading order term however, will not be zero, because it goes like $ \sim 
\delta_0^4 $, which under Wick's theorem/Gaussian statistics can be built out 
of second cumulants. So see that non-linearity gives non-zero skewness and 
kurtosis, and other higher order things, at late times. 

The key to connecting this with Stochastic ODE's lies in the fact that we are 
not adding random variables anymore but multiplying them, and this is a very 
peculiar type of convolution, which in general does **not do a simple 
addition** of cumulants. I will have to look more into this. 

Note: The lognormal distribution is the convergent distribution for a product 
of random variables, since the log of the product is the sum of the logs. So 
perhaps it could be shown that some non-linear Stochastic ODE's go to a 
lognormal (which I believe is already a common concept on Wall street, for 
estimating the dynamics stock prices). 
<div> 