---
layout: post
title: 'Label Propagation and Semi-Supervised Learning: Gaussian Random Field Method'
date: '2016-01-29T06:13:00.002-08:00'
author: Robert Speare
tags:
- Stationary Distribution
- Statistical Mechanics
- Machine Learning
- Statistics
- cumulants. statistics
modified_time: '2016-01-29T06:38:46.423-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8565115355159318751
blogger_orig_url: http://rspeare.blogspot.com/2016/01/label-propagation-and-semi-supervised.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">So, recently I've been 
reading up on label propagation in semi-supervised learning, which is when you 
have a great deal of data, but most of it is unlabeled. To put some notation 
on things, lets say way have a set $L$: 

\begin{eqnarray} 
L &amp;:&amp; \lbrace \mathbf{x}, y \rbrace_{n=1}^{L} 
\end{eqnarray} 

which is a set of pairs of input vectors $x$ and output labels $y$, be they 
scalar or categorical. And then we have a huge unlabeled set: 

\begin{eqnarray} 
U &amp;:&amp; \lbrace \mathbf{x}, \_\_  \rbrace_{n=1}^{U} 
\end{eqnarray} 

which we would like to infer on. Normally, this use case is motivated when the 
unlabeled set is much, much larger, $\vert L \vert &lt;&lt; \vert U \vert$. If 
we are talking about classification, one way to view this problem is through 
clustering. If we assume that close vectors $\mathbf{x}$, under some metric, 
have close labels $y$, we that might motivate a loss function of the form: 

\begin{eqnarray} 
E(\lbrace y \rbrace) &amp;=&amp; \sum_{i,j \ne i} W_{ij} (y_i - y_j)^2 
\end{eqnarray} 

Where, we're summing over all pairs of data points $i,j$, and weighting their 
difference in label with the matrix $W_{ij}$. For sanity's sake, $W_{ij}$ 
should be large when $x_i,x_j$ are close. So $W_{ij}$ goes like one over 
distance between $i,j$. For example: 

\begin{eqnarray} 
E(\lbrace y \rbrace) &amp;=&amp; \sum_{i,j \ne i} W_{ij} (y_i - y_j)^2\\ 
W_{ij} &amp;=&amp; e^{-\vert x_i - x_j \vert^2/2\sigma^2} 
\end{eqnarray} 

This weighting matrix is simply a function of the euclidean metric, and 
actually reminds one of an RBF kernel or covariance function... Is there a 
connection here? 

Absolutely. \\ 

If we frame our clustering/labeling problem as trying to minimize this loss 
function, or energy $E$, it means we can actually frame the likelihood of the 
labels with a boltzman distribution: 

\begin{eqnarray} 
P(\lbrace y \rbrace) &amp;=&amp; \frac{1}{Z}e^{-\sum_{i,j \ne i} W_{ij} (y_i - 
y_j)^2} 
\end{eqnarray} 

(Where $Z$ is the partition function, summing over all configurations of 
labels). This is extremely interesting, because if you do a little matrix 
algebra on our energy, we you find that one can re-write the loss as: 

\begin{eqnarray} 
E = \sum_{i,j\ne i} W_{ij} (y_i - y_j)^2 &amp;=&amp; \sum_{i,j\ne i} y_i 
(D_{ij}-W_{ij}) y_j \\ 
&amp;=&amp; \frac{1}{2} y_i L_{ij} y_j \\ 
D_{ii} &amp;=&amp; \sum_{j^\prime} W_{ij} \\ 
L_{ij} &amp;=&amp; \mathbf{D}-\mathbf{W} 
\end{eqnarray} 

The matrix $L_{ij}$, above is actually a close cousin of the laplacian 
operator $\nabla^2$, but we have embedded things in a high-dimensional space 
because of exponentiation. Notice that our likelihood on the configuration of 
labels now looks exactly like a Gaussian random field: 

\begin{eqnarray} 
P(\lbrace y \rbrace) &amp;=&amp; \frac{1}{Z}e^{-y_i L_{ij} y_j/2} 
\end{eqnarray} 

such that $\langle y_i \rangle =0$ and $\langle y_i y_j \rangle_c = 
L^{-1}_{ij}$. This discrete pdf on labels is precisely the same as if we had 
made everything continuous from the get-go: 

\begin{eqnarray} 
E[y(x)] &amp;=&amp; \frac{1}{2}\int dx dx^\prime y(x) y(x^\prime) 
K(x,x^\prime) \\ 
K(x,x^\prime) &amp;=&amp; e^{-\vert x-x^\prime \vert^2/2\sigma^2} \\ 
P(y(x)) &amp;=&amp; \frac{1}{Z}e^{-\frac{1}{2}\int dx dx^\prime y(x) 
y(x^\prime) K(x,x^\prime)} 
\end{eqnarray} 

which is a Gaussian random field on the labels, $y(x)$, imposing an RBF 
correlation function between points $x$. When integrate the lagrangian in by 
parts we would get the continuous equivalent of $L_{ij}$, which is essentially 
$\nabla^2$ in some new space. 

So why do we care about all of this? Well, it turns out that the algorithms 
people use to propagate labels work exactly like the Helmholtz equation. For 
instance, one of the easiest things you can do given labeled examples $L$, is 
to propagate or ``flow'' the $y$'s to unlabeled points by the following 
procedure: 

\begin{eqnarray} 
y_{t+1} &amp;=&amp; \mathbf{D}^{-1} \mathbf{W} y_t 
\end{eqnarray} 

which, is the same as the helmholtz equation: 

\begin{eqnarray} 
\left(\frac{\partial}{\partial t}+\nabla^2 \right) y_t &amp;=&amp; 0 \\ 
y_{t+1}-y_t &amp;=&amp; -\nabla^2 y_t \\ 
y_{t+1} &amp;=&amp; \left(1-\nabla^2 \right) y_t 
\end{eqnarray} 

and now note, if we replace $\nabla^2$ with $1-D^{-1/2}\mathbf{W} D^{-1/2}$, 
we get 

\begin{eqnarray} 
y_{t+1} &amp;=&amp; \mathbf{D}^{-1}\mathbf{W}  y_t 
\end{eqnarray} 

This is PRECISELY the update scheme -- in discrete form -- of Helmholtz 
dynamics, or heat diffusion. Notice that when $\frac{\partial}{\partial t}y_t 
=0$, we're going to have a Harmonic field, which is fancy word for saying the 
laplacian of the labels is zero. (this implies some other nice things, like 
all labels are the average of labels around them, the maximum of the labels y 
will always exist on the boundary, etc.) Zhu, Ghahramani and Lafferty explain 
this algorithm best when they say the labels are undergoing diffusion, with 
dirichlet -- fixed label constraints -- on the labeled points $\mathbf{x}_l$. 

Although, we are doing things not in euclidean space but somewhere else, do to 
our choice of metric. Because for instance, we could have chosen $W_{ij}$ to 
be whatever we liked, as long as it goes inverse with distance. Let 
$g(x_i,x_j)$ be some metric, then we have more generally: 

\begin{eqnarray} 
W_{ij} &amp;=&amp; f\left[g(x_i,x_j) \right] 
\end{eqnarray} 

and so $g$ defines the space in which we're taking derivatives. Things don't 
have to be euclidean! 