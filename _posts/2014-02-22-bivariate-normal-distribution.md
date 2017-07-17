---
layout: post
title: Bivariate Normal Distribution
date: '2014-02-22T02:59:00.002-08:00'
author: Robert Speare
tags:
- Estimators
- Quals
- Correlation Coefficient
- Statistics
- Bivariate Normal
modified_time: '2014-02-22T03:44:30.868-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-1197023685414123087
blogger_orig_url: http://rspeare.blogspot.com/2014/02/bivariate-normal-distribution.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Because I have had a 
great deal of trouble finding information on the Bivariate Normal distribution 
-- or at least, information that is easy for me to understand -- I'd like to 
take a moment to write down my understanding of the concept, which stems 
mainly from the Characteristic function. 

Working with results from last time, on the central limit theorem, we see that 
we can describe a Probability density function by it's fourier transform, the 
characteristic function 

\begin{eqnarray} 
P(\mathbf{x}) &amp;=&amp; \frac{1}{(2\pi)^{d/2}}\int d^dk e^{i\mathbf{k}\cdot 
\mathbf{x}-i\mathbf{k}\cdot \mathbf{c_1}-\mathbf{k}\cdot 
\mathbf{c_2}\cdot\mathbf{k}+\dots } 
\end{eqnarray} 

Where, for now, I will ignore higher order terms corresponding to 
non-gaussianity. If we zero about the mean -- absorbing our first cumulant, 
$\mathbf{c_1}$ into $\mathbf{x}$ -- we find that we have a simple fourier 
transform of a Gaussian, which is itself a Gaussian. 

\begin{eqnarray} 
P(\mathbf{x}) &amp;=&amp; \frac{1}{(2\pi)^{d/2}}\int d^dk e^{i\mathbf{k}\cdot 
\mathbf{x}-\mathbf{k}\cdot \mathbf{c_2}\cdot\mathbf{k}}\\ 
P(\mathbf{x}) &amp;=&amp; 
\frac{1}{(2\pi)}\frac{1}{|\mathbf{c_2}|}e^{\mathbf{x}\cdot 
\mathbf{c_2^{-1}}\cdot \mathbf{x}} 
\end{eqnarray} 

Where $\mathbf{c_2}$ is the covariance matrix -- rank (0,2) tensor -- in $k$ 
space. 

If we are working with two random variables, $x_1,x_2$, we see that our $k$ 
integration takes place over two dimensions, so we are left with 
\begin{eqnarray} 
P(x_1,x_2) &amp;=&amp; \frac{1}{2\pi}\int dk_1 dk_2 e^{i(k_1 x_1+k_2 
x_2)}e^{-\frac{1}{2}\left( c_{11}k_1^2 +2c_{12}k_1k_2 +c_{22}k_2^2 \right)} 
\end{eqnarray} 

Notice that our characteristic function has a simple form, which we can now 
play with in order to construct estimators for the correlation coefficient 
$\rho$ commonly defined as 

\begin{eqnarray} 
\rho &amp;=&amp; \frac{c_{12}}{\sigma_1 \sigma_2} 
\end{eqnarray} 

Let's take a look. First note that $c_{11}=\sigma_1^2$ and 
$c_{22}=\sigma_2^2$. These are the second cumulants of $x_1$ and $x_2$ 
respectively, their variance with respect to self. Re-writing our bivariate 
normal with these definitions, and assuming **zero mean**, (or $c_1=c_2=0$), 
we find 

\begin{eqnarray} 
\mathbf{c_2^{-1}}&amp;=&amp; \left(\begin{array}{cc} 
 \frac{1}{\sigma_1^2} &amp; \frac{\rho}{\sigma_1 \sigma_2} \\ 
 \frac{\rho}{\sigma_1 \sigma_2} &amp; \frac{1}{\sigma_2^2} \\ 
\end{array}\right)\\ 
\vert \mathbf{c_2} \vert &amp;=&amp; \sigma_1^2 \sigma_2^2 (1-\rho^2) 
\end{eqnarray} 

\begin{eqnarray} 
P(x_1,x_2) &amp;=&amp; \frac{1}{2\pi}\frac{1}{\sigma_1 \sigma_2 
\sqrt{1-\rho^2}}^{-\frac{1}{2}\left( \frac{x_1^2}{\sigma_1^2} +2\rho 
\frac{x_1x_2}{\sigma_1 \sigma_2} +\frac{x_2^2}{\sigma_2^2} \right)} 
\end{eqnarray} 

This last, nasty equation is the typical bivariate normal seen in the 
literahchurr. (literature in snoot-spell). But how the heck to get an 
estimator for the covariance?!?! We know that 

\begin{eqnarray} 
\sigma_1^2 &amp;=&amp; \langle x_1^2 \rangle-\langle x_1 \rangle^2 = c_{11} \\ 
&amp;=&amp; -\frac{\partial^2 P}{\partial 
k_1^2}\vert_{(k_1,k_2)=(0,0)}+\left(\frac{\partial P}{\partial 
k_1}\vert_{(k_1,k_2)=(0,0)}\right)^2 
\end{eqnarray} 

and 

\begin{eqnarray} 
\sigma_2^2 &amp;=&amp; \langle x_2^2 \rangle-\langle x_2 \rangle^2 = c_{22} \\ 
&amp;=&amp; -\frac{\partial^2 P}{\partial 
k_2^2}\vert_{(k_1,k_2)=(0,0)}+\left(\frac{\partial P}{\partial 
k_2}\vert_{(k_1,k_2)=(0,0)}\right)^2 
\end{eqnarray} 

The second term in both expansions -- the first derivative of P(k) squared -- 
is unnecessary, since we are assuming zero mean. 

Let us show this trick of differentiating the characteristic function in order 
to get cumulant estimators explicitly, and then apply it to the covariance 
$\rho$ 

\begin{eqnarray} 
P(k_1,k_2) &amp;=&amp; \frac{1}{2\pi} \int dx_1 dx_2 e^{-i(k_1 x_1 + k_2 
x_2}P(x_1,x_2) = e^{-\frac{1}{2}\left( c_{11}k_1^2 + 2 c_{12}k_1 k_2 + c_{22} 
k_2^2 \right)} 
\end{eqnarray} 

Differentiating with respect to $k_1$ twice 

\begin{eqnarray} 
\frac{\partial P}{\partial k_1} &amp;=&amp; \frac{1}{2\pi} \int dx_1 dx_2 
-ix_1 e^{-i(k_1 x_1 + k_2 x_2}P(x_1,x_2) = \left( c_{11}k_1+ c_{12}k_2 \right) 
e^{-\frac{1}{2}\left( c_{11}k_1^2 + 2 c_{12}k_1 k_2 + c_{22} k_2^2 \right)}\\ 
\frac{\partial^2 P}{\partial k_1^2}&amp;=&amp; \frac{1}{2\pi} \int dx_1 dx_2 
-x_1^2 e^{-i(k_1 x_1 + k_2 x_2}P(x_1,x_2) = \left( c_{11}\right) 
e^{-\frac{1}{2}\left( c_{11}k_1^2 + 2 c_{12}k_1 k_2 + c_{22} k_2^2 \right)} 
\end{eqnarray} 

and setting $k_1=k_2=0$, we find 

\begin{eqnarray} 
\frac{\partial^2 P}{\partial k_1^2}\vert_{(k_1,k_2)=(0,0)}&amp;=&amp; 
\frac{1}{2\pi} \int dx_1 dx_2 -x_1^2 P(x_1,x_2) = \left( c_{11}\right) \\ 
c_{11} &amp;=&amp; \langle x_1^2 \rangle 
\end{eqnarray} 

Now for the covariance, we can take the derivative with respect to $k_1$, then 
$k_2$, to get, 

\begin{eqnarray} 
\frac{\partial P}{\partial k_1} &amp;=&amp; \frac{1}{2\pi} \int dx_1 dx_2 
-ix_1 e^{-i(k_1 x_1 + k_2 x_2}P(x_1,x_2) = \left( c_{11}k_1+ c_{12}k_2 \right) 
e^{-\frac{1}{2}\left( c_{11}k_1^2 + 2 c_{12}k_1 k_2 + c_{22} k_2^2 \right)}\\ 
\frac{\partial^2 P}{\partial k_1 \partial k_2} &amp;=&amp; \frac{1}{2\pi} \int 
dx_1 dx_2 -x_1x_2 e^{-i(k_1 x_1 + k_2 x_2}P(x_1,x_2) = \left( c_{12} \right) 
e^{-\frac{1}{2}\left( c_{11}k_1^2 + 2 c_{12}k_1 k_2 + c_{22} k_2^2 \right)}\\ 
\frac{\partial^2 P}{\partial k_1 \partial k_2}\vert_{(k_1,k_2)=(0,0)} 
&amp;=&amp; \frac{1}{2\pi} \int dx_1 dx_2 -x_1x_2 P(x_1,x_2) = c_{12} \\ 
c_{12} &amp;=&amp; \langle x_1 x_2 \rangle \\ 
\rho &amp;=&amp; \frac{c_{12}}{\sigma_1 \sigma_2}\\ 
\rho &amp;=&amp; \frac{\langle x_1 x_2 \rangle}{\left(\langle x_1^2 \rangle 
\langle x_2^2 \rangle\right)^{1/2}}\\ 
\end{eqnarray} 

And voila! We have found the estimator -- without taking into account bias -- 
of the correlation coefficient! 