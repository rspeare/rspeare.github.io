---
layout: post
title: Propagator for the free particle
date: '2014-03-12T00:29:00.001-07:00'
author: Robert Speare
tags: 
modified_time: '2014-03-12T05:07:47.397-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-3207057879902707972
blogger_orig_url: http://rspeare.blogspot.com/2014/03/propagator-for-free-particle.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">As an exercise, I'd like 
to write up something that I agonized over for 48 hours -- the propagator for 
a free particle in Quantum mechanics. 

We begin with the following function, which I will call $U$. 

\begin{eqnarray} 
U &amp;=&amp; \langle x_f, t_f \vert x_i, t_i \rangle \\ 
&amp;=&amp; \int dx_1 dx_2 \dots dx_{n-1}dx_n  \langle x_1, t_1 \vert 
e^{\frac{-i\hat{H}\tau}{\hbar}}\vert x_2, t_2 \rangle  \langle x_2, t_2 \vert 
e^{\frac{-i\hat{H}\tau}{\hbar}}\vert x_3, t_3 \rangle \cdots  \langle x_{n-1}, 
t_{n-1} \vert e^{\frac{-i\hat{H}\tau}{\hbar}}\vert x_n, t_n \rangle 
\end{eqnarray} 

$U$ has a peculiar property, because if we take the inner product of our final 
state with any wavefunction $\vert \psi \rangle$, we find 

\begin{eqnarray} 
\langle x_f,t_f \vert \psi \rangle &amp;=&amp;  \int \langle x_f, t_f \vert 
x_i, t_i \rangle \langle x_i, t_i \vert \psi \rangle dx_i \\ 
&amp;=&amp;  \int U \langle x_i, t_i \vert \psi \rangle dx_i \\ 
\psi_f &amp;=&amp; \int U \psi_i dx_i 
\end{eqnarray} 

Our function $U$ acts like a Green's function on our initial state, $\psi_i$. 
In the integral above, we have partitioned the transition between states into 
$n$ steps, propagating forward in time with the operator $e^{\frac{-i 
\hat{H}\tau}{\hbar}}$ 

If we examine a single transition between the $x_{j+1}$ state and the $x_j$, 
we find that we can represent our wave functions in terms of their fourier 
transforms, or in terms of the momentum eigenbasis: 

\begin{eqnarray} 
\vert x \rangle &amp;=&amp; \int \vert p \rangle \langle p \vert x \rangle \\ 
&amp;=&amp; \int \frac{1}{\sqrt{2\pi \hbar}}e^{ipx/\hbar} \phi(p) dp \\ 
\Rightarrow &amp;&amp; \frac{1}{\sqrt{2\pi \hbar}}e^{ipx/\hbar} =  \langle p 
\vert x \rangle \\ 
&amp;&amp; \frac{1}{\sqrt{-2\pi \hbar}}e^{ipx/\hbar} =  \langle x \vert p 
\rangle 
\end{eqnarray} 

So rewriting our integral in terms of these bases, 

\begin{eqnarray} 
\langle x_{j+1} \vert e^{\frac{-i}{\hbar}\hat{H}\tau} \vert x_j \rangle 
&amp;=&amp; \int  \langle x_{j+1} \vert q \rangle \langle q \vert 
e^{\frac{i}{\hbar}\hat{H}\tau}  \vert p \rangle \langle p \vert x_j \rangle dp 
dq \\ 
&amp;=&amp; \int  \frac{e^{\frac{-iqx_{j+1}}{\hbar}}}{\sqrt{2\pi \hbar}} 
\langle q \vert e^{\frac{-i}{\hbar}\hat{H}\tau}  \vert p \rangle \langle p 
\vert x_j \rangle dp dq \\ 
&amp;=&amp; \int  \frac{e^{\frac{-iqx_{j+1}}{\hbar}}}{\sqrt{2\pi \hbar}} 
\langle q \vert e^{\frac{-i}{\hbar}\hat{H}\tau} \vert p \rangle 
\frac{e^{\frac{ipx_{j}}{\hbar}}}{\sqrt{2\pi \hbar}} dp dq \\ 
&amp;=&amp; \int  \frac{e^{\frac{-iqx_{j+1}}{\hbar}}}{\sqrt{2\pi \hbar}} 
\langle q \vert \left( 1 - \frac{i}{\hbar}\frac{p^2}{2m}\tau-iV(x)/ \hbar 
+\dots \right) \vert p \rangle \frac{e^{\frac{ipx_{j}}{\hbar}}}{\sqrt{2\pi 
\hbar}} dp dq \\ 
&amp;=&amp; \int  \frac{e^{\frac{-iqx_{j+1}}{\hbar}}}{\sqrt{2\pi \hbar}} 
\left( 1 - \frac{i}{\hbar}\frac{p^2}{2m}\tau-iV(x)/ \hbar\tau + \dots \right)  
\frac{e^{\frac{ipx_{j}}{\hbar}}}{\sqrt{2\pi \hbar}}\delta(p-q) dp dq \\ 
&amp;=&amp; \int  \frac{e^{\frac{-ip(x_{j+1}-x_j)}{\hbar}}}{2\pi \hbar} \left( 
e^{\frac{-i}{\hbar}\frac{p^2}{2m}\tau-iV(x)/ \hbar}\tau \right)  dp \\ 
&amp;=&amp; \int  \frac{e^{\frac{-ip(x_{j+1}-x_j)}{\hbar}}}{2\pi \hbar}  
e^{\frac{-i}{\hbar}\frac{p^2}{2m}\tau}dp e^{-iV(x)\tau/ \hbar} 
\end{eqnarray} 
We recognize the integral over $p$ to be a Gaussian integral, or the fourier 
transform of a Gaussian.  The result is 

\begin{eqnarray} 
\langle x_{j+1} \vert e^{\frac{-i}{\hbar}\hat{H}\tau} \vert x_j \rangle 
&amp;=&amp; \sqrt{\frac{-im}{2 \pi \hbar \tau}} 
e^{\frac{i}{\hbar}\left(\frac{m}{2 \tau}(x_{j+1}-x_j)^2-V(x)\tau \right)} 
\end{eqnarray} 

Multiplying all of our transition amplitudes and integrating over the various 
possible $x_j$ variables, we find the Path integral formulation of Quantum 
Mechanics! 

\begin{eqnarray} 
U &amp;=&amp; \left(\frac{-im}{2 \pi \hbar \tau}\right)^{N/2} \int \cdots \int 
\left( \prod_{j=1}^N dx_j \right) e^{\frac{i}{\hbar}\sum_{j=1}^N 
\left(\frac{m}{2 \tau}(x_{j+1}-x_j)^2-V(x)\tau \right)} 
\end{eqnarray} 

If we take the limit as $N \to \infty$, then we get our action in the 
exponential argument, unlike the discrete quantity we currently have, 
\begin{eqnarray} 
\lim_{N\to \infty} U &amp;=&amp; \lim_{N\to \infty} \left(\frac{-im}{2 \pi 
\hbar \tau}\right)^{N/2} \int \cdots \int \left( \prod_{j=1}^N dx_j \right) 
e^{\frac{i}{\hbar} \int L(x,\dot{x},t) dt} 
\end{eqnarray} 

(I think what I have called $U$ is in fact the propagator. I also seem to be 
off by a negative sign in our normalization factor -- the factor $-im$ should 
be $im$.) 

For a free particle, $V(x)=0$ and so we have for our inner product: 

\begin{eqnarray} 
U &amp;=&amp; \left(\frac{-im}{2 \pi \hbar \tau}\right)^{N/2} \int \cdots \int 
\left( \prod_{j=1}^N dx_j \right) e^{\frac{i}{\hbar}\sum_{j=1}^N 
\left(\frac{m}{2 \tau}(x_{j+1}-x_j)^2\right)} 
\end{eqnarray} 

Examining the first few terms of this nasty integral, we see that we have 

\begin{eqnarray} 
\int dx_1 e^{\frac{mi}{2\hbar \tau}\left(x_0^2 - 2x_0x_1+ x_1^2 -2x_1x_2 + 
2x_2^2 -2x_2x_3+ \dots x_n^2\right)} 
\end{eqnarray} 

Integrating over each successive $x_{n-1}$ yields 

\begin{eqnarray} 
\sqrt{\frac{2\pi \hbar \tau}{-im(n-1)}}^{n-1}e^{\frac{-im}{2\hbar 
(n-1)\tau}\left(x_{n}-x_0\right)^2} 
\end{eqnarray} 

Notice that the factor next to our Gaussian like function is the perfect 
inverse of our normalization factor for the path integral earlier! (along with 
a factor of $n-1$, which will create our total time interval, $T=n\tau$ as 
you'll see in a minute.) So our final expression for $U$ becomes 

\begin{eqnarray} 
U =  \langle x_f, t_f \vert x_i, t_i \rangle &amp;=&amp; \sqrt{\frac{2\pi 
\hbar }{-imT}}\mathrm{exp}\left[\frac{-im}{2\hbar T}\left(x_f-x_0\right)^2 
\right] 
\end{eqnarray} 

So this expression gives the probability of transitioning from one state 
$\vert x_0, t_0 \rangle$ to another $\langle x_f, t_f \vert$. This expression 
is Gaussian, although I don't know what the complex phase means in the 
exponential argument. It is certainly normalized, since we are multiplying by 
$\sqrt{2\pi/\sigma^2}$ ... 