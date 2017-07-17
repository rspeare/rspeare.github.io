---
layout: post
title: Sturm Liouville Problems and the Action
date: '2014-02-18T07:24:00.000-08:00'
author: Robert Speare
tags:
- Quals
- Action
- Variational
- Path Integral
modified_time: '2014-02-18T08:12:08.603-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-4163203782770495004
blogger_orig_url: http://rspeare.blogspot.com/2014/02/rayleigh-ritz-method.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Note to self, the 
following three problem are equivalent (Thanks to the notes of Dr. Robert 
Hunt, Cambridge University 
[http://www.damtp.cam.ac.uk/user/reh10/lectures/](http://www.damtp.cam.ac.uk/user/reh10/lectures/)) 

------- 

1) Find the eigenvalues and eigenfunction of the following Sturm-Liouville 
problem 
\begin{eqnarray} 
-\frac{d}{dx}\left[p(x)y^\prime \right]+q(x)y &amp;=&amp; \lambda w(x) y 
\end{eqnarray} 

for $a&lt;x&lt;b$ where neither $p$ nor $w$ vanish. 

2) Find the functions for which the following functional is stationary 

\begin{eqnarray} 
F[y] &amp;=&amp; \int_a^b (p(y^\prime)^2+qy^2)dx 
\end{eqnarray} 

subject to the constraint 

\begin{eqnarray} 
G[y] &amp;=&amp; \int_a^b wy^2 dx =1 
\end{eqnarray} 

If the constraint is satisfied, then the eigenvalues of the Sturm-Liouville 
problem are given by the values of $F[y]$. The eigenvalue of the system will 
have the smallest eigenvalue. 

3) Find the functions $y(x)$ for which the functional 

\begin{eqnarray} 
\Lambda[y] &amp;=&amp; \frac{F[y]}{G[y]} 
\end{eqnarray} 

is stationary; the eigenvalues of the first problem are then values of 
$\Lambda[y]$ -- without normalization of $G[y]$. 

It can be seen in the functional $F[y]$ and $G[y]$ that if $w,p$ and $q$ are 
all positive functions of $x$, then the eigenvalues will be greater than zero. 
Or, the Sturm-Liouville operator is positive definite. 

----------------- 

Using these facts, I was playing around with the one-dimensional Schrodinger 
equation, and reformed it as a Sturm Liouville problem, 

\begin{eqnarray} 
\frac{-\hbar^2}{2m}\psi^{\prime \prime} + V(x)\psi &amp;=&amp; i\hbar 
\frac{\partial \psi}{\partial t}\\ 
\end{eqnarray} 

If one assumes separability, and that $\frac{\partial \psi}{\partial t}=E_n 
\psi$, then 

\begin{eqnarray} 
\frac{-\hbar^2}{2m}\psi^{\prime \prime} + V(x)\psi &amp;=&amp; \lambda \psi 
\end{eqnarray} 

so that we can write $w=1$, $q(x)=V(x)$, $p(x)=\frac{\hbar^2}{2m}$, and now 
write the functional to be minimized -- assuming $\psi$ is complex: 

\begin{eqnarray} 
F[\psi] &amp;=&amp; \int \left( \frac{\hbar^2}{2m}\frac{\partial 
\psi}{\partial x}\frac{\partial \psi^\star}{\partial x} + V(x) \psi^\star \psi 
\right)dx \\ 
F[\psi] &amp;=&amp; \lambda \\ 
\int \left( -T+V \right)dx&amp;=&amp; \lambda \\ 
\int \left( \mathcal{L} \right)dx&amp;=&amp; -\lambda 
\end{eqnarray} 

This is just the action! I don't know if I made some awful assumptions here, 
but if we take $F[\psi]=-S[\psi]=-\lambda$, we can now write the time 
dependence of our `separable' equation as 

\begin{eqnarray} 
\psi &amp;=&amp; C_1 e^{\frac{iS[\psi]}{\hbar}t} 
\end{eqnarray} 

Redundant, but interesting. Note also that the Sturm-Liouville construction 
takes into account normalization -- which I didn't mention before -- since 

\begin{eqnarray} 
G[\psi] &amp;=&amp; \int \psi \psi^\star dx = 1 \\ 
\Rightarrow F[\psi] &amp;=&amp; \lambda 
\end{eqnarray} 

------- 

In problem construction (3), one can make guesses at the solution function -- 
or eigenfunction -- of the problem $y$, and find successive values of 
$\lambda$. For p,q,w all greater than zero, the lowest value of $\lambda$ 
wins, and so one reduces the Sturm-Liouville to a minimization problem. This 
is called the Rayleigh-Ritz method. 