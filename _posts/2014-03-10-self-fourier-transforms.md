---
layout: post
title: Self-Fourier Transforms
date: '2014-03-10T15:00:00.002-07:00'
author: Robert Speare
tags:
- Sturm Liouville
- Fourier
- Self-Fourier
- Quantum Harmonic Oscillator
modified_time: '2014-03-10T15:06:34.114-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-3060941417230325811
blogger_orig_url: http://rspeare.blogspot.com/2014/03/self-fourier-transforms.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Just spent a long, long 
time working with the quantum harmonic oscillator, with the equation of motion 
-- Schrodinger's time-independent equation: 

\begin{eqnarray} 
-\frac{\hbar^2}{2m}\nabla^2 \psi + \frac{m \omega^2 x^2}{2}\psi &amp;=&amp; 
E\psi 
\end{eqnarray} 

Typical ways to solve this involve power series or algebraic factoring of the 
equation of motion, but I was trying to formulate the problem as either a 
Sturm-Liouville differential equation or as an invertible equation of motion 
with well-defined Green's function. 

From the Green's function perspective, we find that this equation under 
Fourier transform yields 

\begin{eqnarray} 
-\frac{\hbar^2}{2m}k^2 \overline{\psi} + \frac{m \omega^2}{2}\nabla_k^2 
\overline{\psi} &amp;=&amp; E\overline{\psi} 
\end{eqnarray} 

Which leads to problems in defining $G(k)$, due to the derivative on the left 
hand side, but has the exact same structure -- aside from coefficients -- as 
the EOM in x-space. The equations of motion is "self-fourier" and so we might 
expect the solution $\psi$ to be self-fourier as well. 

Well known self-fourier functions are a Gaussian and a dirac comb, but I came 
upon this interesting article that pointed out if one uses an even 
superposition of a function $g$ and it's transform $\overline{g}$, that 
superposition will be self-fourier. For example 

\begin{eqnarray} 
f &amp;=&amp; g(x) + g(-x) +  \overline{g(x)} + \overline{g(-x)} \\ 
\overline{f} &amp;=&amp;  \overline{g(k)} + \overline{g(-k)}+g(k) + g(-k) 
\end{eqnarray} 

Candidates would be 

\begin{eqnarray} 
f &amp;=&amp; 1 + \delta(x) \\ 
f &amp;=&amp; \Pi(x) + Sinc(x) \\ 
f &amp;=&amp; \Lambda (x) + Sinc(x)^2 \\ 
f &amp;=&amp; e^{|x|}+ \frac{1}{1+4\pi^2x^2} 
\end{eqnarray} 

Pretty cool, right? And the only sensible of these Self-fourier functions, in 
the context of our harmonic oscillator is the Gaussian. 

There is a way to transform our equation of motion into a simple 
Sturm-Liouville, but it still escapes me... 