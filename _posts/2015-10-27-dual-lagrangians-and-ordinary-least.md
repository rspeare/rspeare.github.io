---
layout: post
title: Dual Lagrangians and ordinary Least Squares
date: '2015-10-27T13:20:00.000-07:00'
author: Robert Speare
tags:
- lagrange multipliers
- Machine Learning
- Statistics
- cumulants. statistics
modified_time: '2015-10-27T13:31:55.135-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-9175226784613244962
blogger_orig_url: http://rspeare.blogspot.com/2015/10/dual-lagrangians-and-ordinary-least.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">The ordinary least 
squares problem can be set up as just a norm minimization problem: 

\begin{eqnarray} 
\mathrm{minimize} \ \ \frac{\vert \vert Ax-t \vert \vert^2}{2}+l \frac{x^T 
x}{2} 
\end{eqnarray} 

Where $x$ is some vector that in lives in $D$-dimensional ``feature'' space, 
and the matrix $A$ is $N \times D$ -- essentially the design matrix $\Phi(X)$ 
common in the Machine learning literature. We can write down the ``primal 
objective'' of this problem by writing down the ``Lagrangian'': 

\begin{eqnarray} 
L(x)&amp;=&amp; \frac{(Ax-t)^T (Ax-t)}{2}+l \frac{x^T x}{2} \ \ \ 
\mathrm{or,}\\ 
L(z,x\nu) &amp;=&amp; \frac{z^T z}{2}+\nu^T \left(Ax-t-z \right)+l 
\frac{x^Tx}{2} 
\end{eqnarray} 

Where $\nu$ is a vector-valued lagrange multiplier, that \textbf{imposes} our 
constraint $z=Ax-t$. This reformulation of the problem is just one of the many 
simple tricks you can do using lagrange multipliers. The canonical form of 
such Lagrangian in optimization theory is the following: 
\begin{eqnarray} 
L(x,\lambda,\nu)&amp;=&amp; f_0(x)+ \lambda_i f_i(x)+\nu_j h_j(x) 
\end{eqnarray} 

where Einstein summation convention is used. Pardon the confusion of 
$\lambda$'s : normally this greek letter is used for regularization, but in 
the problem I am going to use $l$ as the regularization parameter and 
$\lambda$ as the Lagrange multiplier that imposes some inequality constraint. 
We require, for $x$ to be a feasible solution to the problem: 

\begin{eqnarray} 
h_i(x) &amp;=&amp; 0 \forall i \\ 
f_i(x) &amp;\le &amp; 0 \forall i 
\end{eqnarray} 

Notice that in this example we no inequality constraints, so $\lambda$ will be 
irrelevant. If we were to minimize this ordinary least squares problem 
directly -- analytically solving what's called the primal objective -- we get: 

\begin{eqnarray} 
\partial_x L(x) &amp;=&amp; A^T(Ax-t)+l x =0 \\ 
x_\mathrm{min} &amp;=&amp; (A^TA+l)^{-1} A^T t 
\end{eqnarray} 

We see that the solution involves the inversion of a $D \times D$ matrix -- 
quite difficult if the length of our feature vector is large. This is what's 
called the ordinary least squares solution. We have let $l$ be non-zero in 
order to create something called a ``ridge'', which smooths out our solution. 

Now, we can define the dual lagrangian as: 

\begin{eqnarray} 
g(\lambda, \nu)&amp;=&amp; \mathrm{min}_{x,z}\left(L(x,z,\lambda,\nu) \right) 
\\ 
\end{eqnarray} 

which we can find by taking the proper derivatives and plugging in: 

\begin{eqnarray} 
\partial_x L(x,z,\lambda,\nu) &amp;=&amp; \nu^T A + l x^T \\ 
\Rightarrow x&amp;=&amp; -\frac{A^T \nu}{l}\\ 
\partial_z L(x,z,\lambda,\nu) &amp;=&amp; z^T-\nu^T \\ 
\Rightarrow z=\nu 
\end{eqnarray} 

So we get 

\begin{eqnarray} 
g(\lambda, \nu) &amp;=&amp; \frac{\nu^T \nu}{2}+\nu^T \left(-AA^T \nu/l - t - 
\nu \right) + \frac{l \nu A A^T \nu}{2}\\ 
&amp;=&amp; -\nu^T \left(\frac{AA^T}{l}+1\right)\nu-\nu^Tt 
\end{eqnarray} 

Now, we define $\mathrm{max}(g)=d^*$ as the maximum of the dual, which, is in 
general less than the minimum of the primal, $\mathrm{min}(L)=p^*$. When 
$d^*=p^*$, we have what's called strong duality. The conditions for this to be 
the case are called the KKT conditions, and boil down to essentially all 
derivatives being equal to zero at the solution: 

\begin{eqnarray} 
\partial_{x,z,\lambda,\nu}L=0 
\end{eqnarray} 

and all lagrange multiplier terms being equal to zero evaluated at the 
solution. If we maximize our dual, we find: 

\begin{eqnarray} 
\partial_\nu g &amp;=&amp; - \left(\frac{AA^T}{l}+1 \right)\nu-t=0 \\ 
\Rightarrow \nu &amp;=&amp; -\left(AA^T/l+1 \right)^{-1} t 
\end{eqnarray} 

and, using our expression before, we find the dual $x$ is: 

\begin{eqnarray} 
x &amp;=&amp; -\frac{A^T \nu}{l} = A^T \left(AA^T+l \right)^{-1}t 
\end{eqnarray} 

These two solutions are equivalent if $d^*=p^*$, and in this case, they are! 
Note that the second solution involves the inversion of an $N \times N$ 
matrix, and may be a much better route if the number of features outweigh the 
number of data points, $N &lt;&lt; D$. This dual solution is precisely the 
kernel ridge regression solution, because $AA^T$ is our kernel ``Gram 
Matrix''. The model becomes: 

\begin{eqnarray} 
\mathrm{model} &amp;=&amp; Ax = AA^T \left(AA^T+l \right)^{-1}t\\ 
AA^T &amp;=&amp; K \\ 
\mathrm{model} &amp;=&amp; Ax = K \left(K+l \right)^{-1}t\\ 
\end{eqnarray} 