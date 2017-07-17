---
layout: post
title: The Scalar field Propagator and its Asymptotic Expansion
date: '2014-10-20T13:22:00.001-07:00'
author: Robert Speare
tags:
- Asymptotics
- Integral Expansion
- Field Theory
modified_time: '2015-10-16T07:55:57.949-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-6302638713926198902
blogger_orig_url: http://rspeare.blogspot.com/2014/10/the-scalar-field-propagator-and-its.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"> 
If we only took ``half'' of the commutator, above, we would get an expression 
that looks like: 

\begin{eqnarray} 
\langle 0 \vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; \int_0^\infty 
\frac{dk}{(2\pi)^2}\frac{k}{2\omega_k}\frac{i}{\xi}e^{-i\omega_k 
\tau}\left(e^{ik\xi}-e^{-ik\xi}\right) 
\end{eqnarray} 

Now this integral is even $k$, since we can rewrite the two exponential terms 
as: 

\begin{eqnarray} 
&amp;=&amp; \int_0^\infty 
\frac{dk}{(2\pi)^2}\frac{1}{2\omega_k}\frac{i}{\xi}e^{-i\omega_k 
\tau}\left(ke^{ik\xi}-ke^{-ik\xi}\right) 
\end{eqnarray} 

We therefore extend integration to $-\infty \to \infty$, and write: 

\begin{eqnarray} 
\langle 0 \vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; \frac{i}{\xi}  
\int_{-\infty}^\infty \frac{dk}{(2\pi)^2}\frac{k}{2\omega_k}e^{-i\omega_k 
\tau+ik\xi} 
\end{eqnarray} 

And now we have this strange integral to deal with. The first thing to do is 
choose a case: either $\xi=0$ or $\tau=0$, since we can always find a proper 
lorentz boost to accomplish this. If we look at the space-like separated case, 
we have 


\begin{eqnarray} 
\langle 0 \vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; \frac{i}{\xi}  
\int_{-\infty}^\infty \frac{dk}{(2\pi)^2}\frac{k}{2 \sqrt{k^2+m^2}}e^{ik\xi} 
\end{eqnarray} 

which has a pesky square root function, and therefore a branch cut, at either 
$im$ or $-im$. We choose our branch cut to be in the negative imaginary 
regime, and make a transformation $k^\prime=-ik$, such that: 

\begin{eqnarray} 
\langle 0 \vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; \frac{i}{\xi}  
\int_{i\infty}^{-i\infty} \frac{dk}{(2\pi)^2}\frac{-k}{2 
\sqrt{m^2-k^2}}e^{-k\xi}\\ 
 &amp;=&amp; \frac{i}{\xi}  \int_{-i\infty}^{i\infty} 
\frac{dk}{(2\pi)^2}\frac{k}{2 \sqrt{m^2-k^2}}e^{-k\xi} 
\end{eqnarray} 

Now we notice that if we make a ``keyhole contour'' that goes along the 
imaginary axis in this rotated space, goes out along $k\to \infty$ and then 
wraps around the branch cut, then we can say that such a closed contour 
integral will yield zero, since it contains no singularities. 

\begin{eqnarray} 
\oint_{C_r + C_i + C_b} 
\end{eqnarray} 

Where the $C$'s stand for rounded arcs, the imaginary and branch axis 
contours, respectively. We can claim immediately that the arcs will yield zero 
as we go out to infinity, since the real part of $k$ damps our integrand 
exponentially. The next step is to notice that our branch cut function can be 
written as: 
\begin{eqnarray} 
\sqrt{m^2-k^2}&amp;=&amp; e^{\frac{1}{2}\log(m^2-k^2)+\frac{i}{2}\phi }\\ 
&amp;=&amp; \sqrt{m^2-k^2}e^{i\phi/2} 
\end{eqnarray} 

Where the angle $\phi$, in this rotated space, takes on the values 
$0&lt;\phi&lt;2\pi$. This means that above the branch cut, on the top side of 
the real axis, we will get a positive sign in our branched function. But below 
the real axis we will get a negative sign, due to the phase $e^{i 
\frac{2\pi}{2}}$ (with some delta in there so that we're not exactly on the 
branch cut!). So we can equate the imaginary axis integration and the branch 
cut integration: 

\begin{eqnarray} 
\frac{i}{\xi}  \int_{-i\infty}^{i\infty} \frac{dk}{(2\pi)^2}\frac{k}{2 
\sqrt{m^2-k^2}}e^{-k\xi} 
 &amp;=&amp; - \int_m^\infty 
\frac{dk}{(2\pi)^2}\frac{k}{\sqrt{m^2-k^2}}e^{-k\xi} 
\end{eqnarray} 

So we may write 

\begin{eqnarray} 
\langle 0\vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; - \int_m^\infty 
\frac{dk}{(2\pi)^2}\frac{k}{\sqrt{m^2-k^2}}e^{-k\xi} 
\end{eqnarray} 

Up to some possibly dropped negative sign. The important thing is that now, we 
may take the $\xi \to \infty$ limit, and note that the asymptotic contribution 
to this integral comes from the minimum value of $k$, and so we get 

\begin{eqnarray} 
\lim_{\vert x-y \vert \to \infty}\langle 0\vert \phi(x)\phi(y) \vert 0\rangle 
&amp;\sim &amp; e^{-m\vert \vec{x}-\vec{y}\vert} 
\end{eqnarray} 

Similarly, for the time-like separation case, we can do the same yakkety-yak, 
rotating our complex integration space and then wrapping around the a fitting 
branch cut, in order to write: 
\begin{eqnarray} 
\langle 0\vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; - \int_m^\infty 
\frac{dk}{(2\pi)^2}\frac{k}{\sqrt{m^2-k^2}}e^{i\sqrt{m^2-k^2}\tau} 
\end{eqnarray} 

Except in this case we have not really helped ourselves, as this integral 
needs some sort of regularization, or infinitesimal offset of the parameter 
$m$ in order to converge, since, $k=0$ corresponds to the point of stationary 
phase in the asymptotic $\tau \to \infty$ limit. 

We could have just taylor expand our function $\sqrt{m^2-k^2}$ about $0$, 
without all the branch and rotation nonsense, to write: 

\begin{eqnarray} 
\langle 0 \vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; 
\int_{-\infty}^\infty \frac{dk}{(2\pi)^2}\frac{k^2}{2 
\sqrt{k^2+m^2}}e^{-i\sqrt{k^2+m^2} \tau}\\ 
&amp;\approx &amp; e^{-im\tau} \times \dots 
\end{eqnarray} 

The rest of the expression can be written as a series of expectation values of 
a 1-D gaussian integral, with variance $\sigma^2 = \frac{m}{\tau}$. 

So we find that the naive scalar propagator does not vanish for space-like 
separation, but it's commutator does. We also find that for time-like 
separation we get an oscillatory result, which not coincidentally, for the 
commutator, will result in something like 

\begin{eqnarray} 
\langle 0 \vert \phi(x)\phi(y) \vert 0\rangle &amp;=&amp; 
e^{-im\tau}-e^{im\tau} 
\end{eqnarray} 
an interference  between the two measurements. 