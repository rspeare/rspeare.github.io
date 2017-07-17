---
layout: post
title: 1-D Wave Equation Green's Function
date: '2014-07-24T11:24:00.003-07:00'
author: Robert Speare
tags: 
modified_time: '2014-07-25T06:12:18.350-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-6744068003721439101
blogger_orig_url: http://rspeare.blogspot.com/2014/07/greens-functions-drills.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">As I am trying to gain 
some fluency with Green's functions, and there use in non-relativistic PDE's, 
I thought it'd be a good exercise to work out some expressions -- or "Magic 
Rules" -- for the Green's function of the wave equation: 

\begin{eqnarray} 
\left(\frac{\partial^2}{\partial t^2}-c_s^2 \frac{\partial^2}{\partial x_i 
\partial x_i}\right)\mathbf{\psi}(\vec{x},t)&amp;=&amp; 0 
\end{eqnarray} 

Let's assume that $c_s$ is our "speed of sound" in the medium, and that $\psi$ 
some scalar function of space and time. If we assume that $\psi \to 0$ as we 
go to $\vert x \vert \to \infty$, or, the boundaries of our space of interest, 
we are well equipped to perform a fourier transform on this PDE: 

\begin{eqnarray} 
\left(\frac{\partial^2}{\partial t^2}+c_s^2 
k^2\right)\tilde{\psi}(\vec{k},t)&amp;=&amp; 0 
\end{eqnarray} 

We can now laplace transform in the time variable, swapping $t$ for $\omega$, 
and write 

\begin{eqnarray} 
\left(\omega^2+c_s^2 k^2\right)\tilde{\psi}(\vec{k},\omega)&amp;=&amp; \omega 
\tilde{\psi}(\vec{k},0)+ \tilde{\psi}(\vec{k},0)^\prime 
\end{eqnarray} 

We can see now that our Differential equation has been rendered algebraic in 
this "doubly" transformed space. We invert the PDE and write 

\begin{eqnarray} 
\tilde{\psi}(\vec{k},\omega)&amp;=&amp; \frac{ \omega \tilde{\psi_0}(k) + 
\tilde{\psi_0^{\prime}}(k)}{\left(\omega^2+c_s^2 k^2\right)} 
\end{eqnarray} 

We can immediately see, once we invert the laplace transform, that our initial 
conditions are built into the homogeneous solution: 

\begin{eqnarray} 
\tilde{\psi}(\vec{k},t)&amp;=&amp; \oint_{\gamma-i \infty}^{\gamma+i 
\infty}\frac{ \omega \tilde{\psi_0}(k)e^{\omega t}}{\left(\omega^2+c_s^2 
k^2\right)}\frac{d\omega}{2\pi i}+\oint_{\gamma-i \infty}^{\gamma+i 
\infty}\frac{ \tilde{\psi_0^{\prime}}(k)e^{\omega t}}{\left(\omega^2+c_s^2 
k^2\right)}\frac{d\omega}{2\pi i} 
\end{eqnarray} 

Both contour integrals have identical poles: $\omega = \pm i c_s \vert \vec{k} 
\vert $, and so we use the residue theorem to write down the inverted PDE in 
k-space: 

\begin{eqnarray} 
\tilde{\psi}(\vec{k},t) &amp;=&amp; \tilde{\psi_0}(k) \cos \left(c_s k t 
\right)+ \frac{\tilde{\psi_0^{\prime}}(k)\sin \left(c_s k t \right)}{c_s k} 
\end{eqnarray} 

Which is incredibly simple but difficult to transform back into x-space. First 
of all, notice that we are multiplying our initial conditions -- or spectra -- 
with two separate kernels, sine-over-k and cosine. In the x-space, this means 
we will be "convolving" our initial conditions with these two separate kernels 
-- or the x-space inverse fourier transforms -- in order to create our 
homogeneous solution. 

Furthermore, remember that our time-transform variable $\omega$ had poles that 
were only dependent upon the modulus of $\vec{k}$, meaning that all of the k's 
you see above should be replaced by $abs(\vec{k})$. These kernels exhibit 
isotropy, which makes sense since the wave equation is a spatially isotropic 
and homogenous differential equation to begin with -- the laplacian operator 
has no preference in direction or orientation. 

But, such radial functions of $k$ will prove difficult to inverse fourier 
transform in higher and higher dimensions of $x$. 

If we start out with 1-D, we know that the cosine will turn into an evenly 
spaced pair of dirac delta distributions, and the sin over k term will turn 
into a top hat function. And so we are left with 

\begin{eqnarray} 
\psi(x,t)^{1D} &amp;=&amp; \frac{\psi_0(x-c_s t)+\psi_0(x+c_s 
t)}{2}+\frac{\Pi(c_s t)}{c_s}\ast \psi^{\prime}_0(x) \\ 
\psi(x,t)^{1D} &amp;=&amp; \frac{\psi_0(x-c_s t)+\psi_0(x+c_s 
t)}{2}+\int_{x-c_s t}^{x+c_s t} \frac{\psi^{\prime}_0(x^\prime)}{2 c_s} 
dx^\prime 
\end{eqnarray} 

This is a wave front uniformly expand with speed $c_s$, independent of whether 
the problem is sit up with Neumman or Dirichlet boundary conditions. And, it 
seems I have stumbled upon -- by the laplace transform -- d'Alembert's formula 
for the Cauchy problem. 

---------------------------------------------------------------------- 
Now if we move into 2-D, we find that the we need to regularize the inverse 
fourier transforms, which I will leave for a later post... 