---
layout: post
title: Preserving Causality for Field Operators
date: '2014-10-20T07:06:00.001-07:00'
author: Robert Speare
tags: 
modified_time: '2014-10-20T07:09:40.701-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-4486017321796080846
blogger_orig_url: http://rspeare.blogspot.com/2014/10/preserving-causality-for-field-operators.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"><div class="p1">It is 
important to examine the quantity: 

\begin{eqnarray} 
\langle 0 \vert \phi(x)\phi(y)\vert 0 \rangle 
\end{eqnarray} 

Or two field operators at different points in space time, acting on the 
vacuum. In particular, for a causal theory, we would like all space-like 
separated operatores to commute, i.e.: 

\begin{eqnarray} 
[\mathcal{O}(x),\mathcal{O}(y)] &amp;=&amp; 0 \ \mathrm{if} \  \eta_{\mu 
\nu}x^\mu y^\nu &lt;0 
\end{eqnarray} 

Or two space-like separated observables cannot effect each other. Let us 
examine the commutator for our mode-expanded fields: 

\begin{eqnarray*} 
\phi(x) &amp;=&amp; \sum_k \frac{1}{\sqrt{2L^3 
\omega_k}}\left(a_ke^{-ikx}+a^*_k e^{ikx}\right)\\ 
\left[\phi (x), \phi (y)\right] &amp;=&amp; \sum_{k,p} \frac{1}{2L^3} 
\frac{1}{\sqrt{\omega_k \omega_p}}\left[\left(a_ke^{-ikx}+a^* 
e^{ikx}\right)\left(a_pe^{-ipy}+a^*_p e^{ipy}\right)\right]\\ 
&amp;=&amp; \sum_{k,p} \frac{1}{2L^3} \frac{1}{\sqrt{\omega_k 
\omega_p}}\left[a_k,a^*_p \right]e^{-ikx+ipy}+\left[a^*_k,a_p 
\right]e^{+ikx-ipy}\\ 
&amp;=&amp; \sum_{k,p} \frac{1}{2L^3} \frac{1}{\sqrt{\omega_k 
\omega_p}}\delta_{k,p}\left(e^{-ikx+ipy}-e^{+ikx-ipy}\right)\\ 
&amp;=&amp; \sum_{k,p} \frac{1}{2L^3} 
\frac{1}{\omega_k}\left(e^{-ik(x-y)}-e^{+ik(x-y)}\right) 
\end{eqnarray*} 

We can know re-write this difference in space time coordinates as: 

\begin{eqnarray} 
x-y &amp;=&amp; \langle \tau, \vec{\xi} \rangle 
\end{eqnarray} 

and expand out the four vector contractions: 

\begin{eqnarray} 
\left[\phi(x),\phi(y) \right]&amp;=&amp; \sum_{k,p} \frac{1}{2L^3} 
\frac{1}{\omega_k}\left(e^{-i\omega_k 
\tau}e^{ik\xi}-e^{+i\omega_k\tau}e^{-ik\xi}\right) 
\end{eqnarray} 

Turning our integral into a sum now, we write: 

\begin{eqnarray} 
\sum_k \frac{1}{V} \to \int \frac{d^3k}{(2\pi)^3}\\ 
\left[\phi(x),\phi(y) \right]&amp;=&amp; \int \frac{d^3k}{(2\pi)^3} \frac{1}{2 
\omega_k}\left(e^{-i\omega_k 
\tau}e^{ik\xi}-e^{+i\omega_k\tau}e^{-ik\xi}\right) 
\end{eqnarray} 

Integration over our angular coordinates is trivial, since we can set 
$\vec{\xi}$ along the $k_z$ axis and get rid of $\theta$ immediately. 

\begin{eqnarray} 
\left[\phi(x),\phi(y) \right]&amp;=&amp; \int_0^\infty \int_{1}^{-1} \frac{k^2 
dk du }{(2\pi)^2} \frac{1}{2 \omega_k}\left(e^{-i\omega_k \tau}e^{ik\xi 
u}-e^{+i\omega_k\tau}e^{-ik\xi u}\right) 
\end{eqnarray} 

Notice we have set $u=\cos(\psi)$, the angle from $k_z$, above. Integrating 
over $u$ gives us the typical bessel functions: 

\begin{eqnarray} 
\left[\phi(x),\phi(y) \right]&amp;=&amp; \int_0^\infty \frac{k^2 dk 
}{(2\pi)^2} \frac{1}{2 \omega_k}\left(\frac{e^{-i\omega_k \tau}e^{ik\xi 
u}}{ik\xi}-\frac{e^{+i\omega_k\tau}e^{-ik\xi u}}{-ik\xi} \right) 
\vert^{-1}_{1}\\ 
\left[\phi(x),\phi(y) \right]&amp;=&amp; \frac{-i}{\xi}\int_0^\infty \frac{k 
dk }{(2\pi)^2} \frac{1}{2 \omega_k}\left(e^{-i\omega_k \tau}e^{ik\xi 
u}+e^{+i\omega_k\tau}e^{-ik\xi u}\right) \vert^{-1}_{1} 
\end{eqnarray} 

Taking a long hard look at the above equation, one might be able to see that 
we're going to get zero if $\tau=0$ since, the evaluation at endpoints of $u$ 
will cancel. We can also expand out the endpoints of $u$ to get: 

\begin{eqnarray} 
\left[\phi(x),\phi(y) \right]&amp;=&amp; \frac{1}{\xi}\int_0^\infty 
\frac{dk}{2\pi^2} \frac{k}{\omega_k}\sin(k\xi)\sin(\sqrt{k^2+m^2}\tau) 
\end{eqnarray} 

Now we see immediately that the $\tau \to 0$ limit gives us a vanishing 
commutator, and the $\xi \to 0$ limit gives us something that is finite, like 

\begin{eqnarray} 
\left[\phi(x),\phi(y) \right]&amp;=&amp; \int_0^\infty \frac{dk}{2\pi^2} 
\frac{k^2}{\sqrt{k^2+m^2}}\sin(\sqrt{k^2+m^2}\tau) 
\end{eqnarray} 

This will give an asymptotic solution of the form $e^{imt}$ which can be shown 
by stationary phase arguments. And we find, therefore, that the commutator for 
space-like separation is non-vanishing. 

It is important to note that, during this entire discussion, we could have 
framed the commutator problem as the difference of two propagators, the 
probability for a particle to be created at $y$ and destroyed at $x$: 

\begin{eqnarray} 
\langle 0 \vert \phi(x) \phi(y)\vert 0 \rangle &amp;=&amp; D_{xy} 
\end{eqnarray} 

and therefore our commutator looks like: 

\begin{eqnarray} 
[\phi(x),\phi(y)] &amp;=&amp; D_{xy}-D_{yx}=0 \ \forall \ \eta_{\mu \nu}x^\mu 
y^\nu &lt;0 
\end{eqnarray} 

David Tong, in his online notes, says we can ``wrap words around this''. When 
the events of creation and annihilation are space-like separated, we can 
``re-order'' the events by a proper Lorentz boost.  This means that the two 
amplitudes for the processes $x\to y$ and $y \to x$ cancel. For a complex 
scalar field, this turns into a statement about the amplitude of a particle 
and an anti-particle travelling from $x \to y$, which once again cancel for 
space-like separation. 
<div> 