---
layout: post
title: The Power Spectrum under Linear Turbulence
date: '2014-06-30T09:05:00.001-07:00'
author: Robert Speare
tags:
- Fluid Dynamics
- probability
- Propagators
- Green's Functions
- Statistics
modified_time: '2014-07-09T07:15:14.116-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8396700433140140183
blogger_orig_url: http://rspeare.blogspot.com/2014/06/propagators-greens-functions-and.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">In an attempt to square 
up my understanding of nonlinear fluid dynamics and the connection between 
Green's functions and two-point correlation functions, I have been playing 
with the following, very general equation 

\begin{eqnarray} 
L^0 u_\alpha(\vec{x},t) &amp;=&amp; f_\alpha (\vec{x},t)+ M_{\alpha \beta 
\gamma}(\vec{x},t) \int \beta (\vec{x},t) \gamma(\vec{q}-\vec{x},t) d^3q 
\end{eqnarray} 

Where, in the above, $L^0$ is a linear differential operator. The diffusion 
equation would be a good example: 

\begin{eqnarray} 
L^0 \sim \frac{\partial}{\partial t} - \nu \vec{\nabla}^2 
\end{eqnarray} 

By linear, I mean that $L^0$ is not a function of our function of interest 
$u_\alpha(\vec{x},t)$, which we are trying to solve/predict. I have given $u$ 
a subscript $\alpha$ to keep track of four components: the three cartesian 
velocities and the density. This fully describes fluid motion. 

Let's call the  quantity $f_\alpha$ the "noise" or "stirring" term, that 
excites the systems over space and time. The final term in the above equation 
is our non-linear "mixing" function, but more on that later. 

We can solve the linear system 

\begin{eqnarray} 
L^0 u_\alpha(\vec{x},t) &amp;=&amp; f_\alpha (\vec{x},t) 
\end{eqnarray} 

by just writing our function of interest $u_\alpha (\vec{x},t)$ in terms of 
what's called a linear Green's function. The Green's function has the 
following properties: 

\begin{eqnarray} 
L^0 G^0(\vec{x},t \vert \vec{x}^\prime, t^\prime) &amp;=&amp; 
\delta(\vec{x}-\vec{x}^\prime)\delta(\vec{t}-\vec{t}^\prime) \\ 
&amp;=&amp; 0 \ \ \ \mathrm{if} \ \ t&lt;t^\prime 
\end{eqnarray} 

and can be built out of something called the propagator, which has some 
slightly different characteristics: 

\begin{eqnarray} 
L^0K^0(\vec{x},t \vert \vec{x}^\prime, t^\prime) &amp;=&amp; 0 \ \ \ 
\mathrm{if} \ \ t&gt;t^\prime \\ 
K^0(\vec{x},t \vert \vec{x}^\prime, t^) &amp;=&amp;  
\delta(\vec{x}-\vec{x}^\prime) \ \ \ \mathrm{for\ \ equal \ \ times} 
\end{eqnarray} 

If take a look at our linear system in fourier space, we will see that the 
differential operator -- transforming $\vec{x}$, not t -- becomes an algebraic 
function of $\vec{k}$ and $\partial_t$: 

\begin{eqnarray} 
\tilde{L}^0(\vec{k},\partial_t) u_\alpha(\vec{k},t) &amp;=&amp; f_\alpha 
(\vec{k},t) 
\end{eqnarray} 

We would like to construct our linear *solution *to this system using the 
Green's functions. Now we know, from above that $L^0$ applied to our Green's 
function yields 

\begin{eqnarray} 
\tilde{L}^0 G^0(\vec{k},t \vert \vec{k}^\prime, t^\prime) &amp;=&amp; 1 \cdot 
\delta(t-t^\prime) 
\end{eqnarray} 

Where I have taken the fourier transform of the spatial dirac delta function 
from before, which is unity. In a translationally -- or momentum conserving -- 
system, we expect all fourier transforms of functions to carry with them an 
extra dirac term: 

\begin{eqnarray} 
\tilde{L}^0 G^0(\vec{k},t \vert \vec{k}^\prime, t^\prime) \delta(k+k^\prime) 
&amp;=&amp; 1 \cdot \delta(t-t^\prime) 
\end{eqnarray} 

And so we find 

\begin{eqnarray} 
\tilde{L}^0 G^0(\vec{k},t \vert -\vec{k}, t^\prime) &amp;=&amp; 1 \cdot 
\delta(t-t^\prime) 
\end{eqnarray} 

Convolving the Green's function with our source function in k space, now, will 
yield our linear solution 

\begin{eqnarray} 
\tilde{L}^0 \left( G^0(\vec{k},t \vert -\vec{k}, t^\prime)\star 
f_\alpha(\vec{k}) \right) &amp;=&amp;  f_\alpha(\vec{k},t) \\ 
u_\alpha^0(\vec{k},t) &amp;=&amp; \int G^0(\vec{k},t \vert -\vec{k}, 
t^\prime)f_\alpha(\vec{k},t^\prime) dt^\prime 
\end{eqnarray} 

This immediately shows that the fourier decomposition of our linear system 
does not "mix modes" over time. We have no integral over $d^3k$ written above, 
and so we can claim, under linear forces, that the power spectrum of our 
system should retain the same shape. 

Let's look into this more explicitly. If take the ensemble average of two of 
our vector functions of interest in k-space: 

\begin{eqnarray*} 
\langle u_\alpha^0(\vec{k_1},t_1) u_\alpha^0(\vec{k_2},t_2)  \rangle 
&amp;=&amp; \int \int G^0(\vec{k_1},t_1 \vert -\vec{k_1}, t_1^\prime)f 
G^0(\vec{k_2},t_2 \vert -\vec{k_2}, t_2^\prime) \langle 
f_\alpha(\vec{k_1},t_1^\prime) f_\alpha(\vec{k_2},t_2^\prime)  \rangle 
dt_1^\prime dt_2^\prime 
\end{eqnarray*} 

Now, if we assume the following isotropic, Gaussian form for our noise funtion 
(recalling that we've already assume a translationally invariant system) 

\begin{eqnarray} 
\langle f_\alpha(\vec{k_1},t_1^\prime) f_\alpha(\vec{k_2},t_2^\prime)  \rangle 
&amp;=&amp; \left(\delta_{\alpha \beta} - \frac{k_\alpha k_\beta}{k^2}\right) 
W(\vert k \vert) \delta(t_1^\prime - t_2^\prime) \delta(k_1 - k_2) 
\end{eqnarray} 

Then our expectation value for the second moment, or the pair correlation 
tensor, above, simplifies immensely: 

\begin{eqnarray*} 
\langle u_\alpha^0(\vec{k_1},t_1) u_\alpha^0(\vec{k_2},t_2)  \rangle 
&amp;=&amp; D_{\alpha \beta} \int  W(\vert \mathbf{k} \vert) 
G^0\left(\mathbf{k},t_1 \vert -\mathbf{k},t^\prime 
\right)G^0\left(\mathbf{k},t_2 \vert -\mathbf{k},t^\prime \right) \ dt^\prime 
\end{eqnarray*} 

Now I find this very interesting, because of we correlate two modes at equal 
time $t_1 = t_2$ and set $\alpha=0$, we've got the power spectrum: 

\begin{eqnarray*} 
P(k,t)\delta(k+k^\prime) &amp;=&amp; \langle u_0^0(\vec{k},t) 
u_0^0(\vec{k^\prime},t)  \rangle \\ 
&amp;=&amp; \langle u_0^0(\vec{k},t) u_0^0(\vec{-k},t)  \rangle \\ 
&amp;=&amp; \int_{t_0}^t  W(\vert \mathbf{k} \vert) \vert 
\hat{G}^0(\mathbf{k},t ,t^\prime) \vert^2 dt^\prime 
\end{eqnarray*} 

If we take the limit as $t \to t_0$, then we find that integral goes to zero 
"width" and we are left with just the value of our integrand, which, given the 
properties of the propagator, should be $W(k)$. Thus our Power spectrum under 
no time-evolution yields 

\begin{eqnarray} 
P(k,t_0) &amp;=&amp; W(k) 
\end{eqnarray} 

As one would expect. If $W(k)$ is time independent, then we would expect this 
function to represent the "seeds" for fluid perturbations -- or in cosmology, 
for gravitational growth! 

Now the following could be perhaps spurious, but perhaps the propagator is the 
transfer function I am so used to seeing in Cosmology: 

\begin{eqnarray*} 
P(k) &amp;=&amp; T(k)^2 P(k,t_0)\\ 
&amp;=&amp;  P(k,t_0) \int_{t_0}^t  \vert \hat{G}^0(\mathbf{k},t ,t^\prime) 
\vert^2 dt^\prime \\ 
T(k)^2 &amp;=&amp;  \int_{t_0}^t  \vert \hat{G}^0(\mathbf{k},t ,t^\prime) 
\vert^2 dt^\prime 
\end{eqnarray*} 

The key here is that the time dependence in the above integral has been 
"shucked" out, by separating time -- or redshift -- into the linear growth 
factor $a(t)$. 