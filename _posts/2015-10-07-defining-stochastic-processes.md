---
layout: post
title: Defining Stochastic Processes
date: '2015-10-07T08:27:00.001-07:00'
author: Robert Speare
tags:
- random variables
- transforming a pdf
- stochastic process
- cumulants. statistics
modified_time: '2015-10-16T07:52:50.754-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-2379480352088425255
blogger_orig_url: http://rspeare.blogspot.com/2015/10/defining-stochastic-processes.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"> VanKampen says that 
given a single stochastic variable $X$, we can define an infinite number of 
other stochastic variables by transformation. For example, let $X$ be 
uniformly distributed over the interval $[-1,1]$. We can then define a normal 
variable by the following transformation: 

 \begin{eqnarray} 
z = f(X) &amp;=&amp; \sqrt{2}\sigma \mathrm{erf}^{-1}\left( X \right) + \mu \\ 
z &amp;\sim &amp;  \mathcal{N}(\mu, \sigma) 
 \end{eqnarray} 

 Where $z$ is now drawn from a normal distribution with mean $\mu$ and 
variance $\sigma^2$. We can also do this for a multivariate Gaussian 
distribution. Say we want to construct: 

 \begin{eqnarray} 
\mathbf{x} \sim \mathcal{N}(\vec{\mu}, \Sigma) &amp;=&amp; 
\frac{1}{(2\pi)^{D/2} \mathrm{det}\vert \sigma 
\vert}e^{(\mathbf{x}-\mathbf{\mu} )\cdot \Sigma^{-1}\cdot 
(\mathbf{x}-\mathbf{\mu}) /2 } 
 \end{eqnarray} 

 We can create this random vector by taking the following steps. First, 
decompose the covariance matrix $\Sigma$ as: 

 \begin{eqnarray} 
 \Sigma^{-1} &amp;=&amp; U \Lambda^{-1} U^T 
 \end{eqnarray} 

 Where $\Lambda$ is diagonal and $U$ is orthonormal. One sees that this is 
simply the eigendecomposition of our covariance matrix, which surely exists 
and has $\Lambda_{ii} \ge 0 \ \ \forall i$ since $\Sigma$ is semi-positive 
definite. Then, construct the following vector: 

 \begin{eqnarray} 
 \vec{\mathbf{y}}_i &amp;=&amp; \vec{f}_i(X) =\sqrt{2} \Lambda_{ii}  
\mathrm{erf}^{-1}\left(X_i \right) 
 \end{eqnarray} 

I give the uniformly distributed random variable $X$ a subscript $i$ to denote 
independent draws. Then take, linear combinations of the vector $\vec{y}$ and 
add the mean: 

 \begin{eqnarray} 
 \vec{x} &amp;=&amp; U \cdot \vec{y}+\vec{\mu} 
 \end{eqnarray} 

 So we have simply: 

 \begin{eqnarray} 
\vec{z}_i &amp;=&amp;  U_{ij} \cdot \sqrt{2} \Lambda_{jj} 
\mathrm{erf}^{-1}\left(X_j \right)+\vec{\mu}_i \\ 
&amp;=&amp; U_{ij} \cdot f(X,j) + \vec{\mu}_i \\ 
&amp;=&amp; g(X,i) 
 \end{eqnarray} 

 So we see that we created our vector out of a linear combination of functions 
-- given by $U$ -- which is just another indexed function, $g(X,i)$. 

 We can promote this discrete vector index to a continuous one, that of time 
$t$, and thus define a stochastic process, or a random function: 

 \begin{eqnarray} 
 Y_X(t) &amp;=&amp; f(X,t) 
 \end{eqnarray} 

 For every value of $t$ we have a random variable, and for every value $X=x$ 
we have a \textbf{realization} of the process, a function of time. Let's say 
we want a Gaussian random function with zero mean and covariance kernel $K$. 
The probability distribution for such a function is: 

 \begin{eqnarray} 
 P\left[\eta(t)\right] &amp;=&amp; \frac{1}{Z} e^{-\int dt_1 \int dt_2 
\eta(t_1) K^{-1}(t_1,t_2) \eta(t_2)/2} 
 \end{eqnarray} 

Don't worry about the function normalization constant $Z$ for now. So far we 
have made no assumption on our covariance across time, encapsulated by the 
kernel $K(t,t^\prime)$. Let's assume ``stationarity'', in the sense that 
correlation only depends upon time difference $K(t,t^\prime)=K(t-t^\prime)$. 
Let's also make the kernel diagonal in that $\eta(t)$ is only correlated with 
itself at time $t$: 

\begin{eqnarray} 
K &amp;=&amp; \delta^D(t-t^\prime) \\ 
 P\left[\eta(t)\right] &amp;=&amp; \frac{1}{Z} e^{-\int dt \eta(t)^2/2} 
\end{eqnarray} 

The covariance of this random function $\eta(t)$ is now: 

\begin{eqnarray} 
\langle \eta(t) \eta(t^\prime) \rangle &amp;=&amp; \delta^D(t-t^\prime) 
\end{eqnarray} 

This is essentially the functional ``unit'' normal. Can we create such a 
random function, $\eta(t)$ a stochastic process, using only $X$? The answer is 
yes, and we will need Mercer's theorem to do it. Let's say we want to create: 

\begin{eqnarray} 
\eta(t) \sim \mathcal{N}\left( \mu(t), K(t,t^\prime) \right) 
\end{eqnarray} 

Then we need to decompose our kernel into eigenfunctions using Mercer's 
theorem: 

\begin{eqnarray} 
K(t,t^\prime) &amp;=&amp; \sum_{n=1}^\infty \lambda_n 
\phi_n(t)\phi_n(t^\prime) 
\end{eqnarray} 

where 

\begin{eqnarray} 
\lambda_n \phi_n(t) &amp;=&amp; \int dt^\prime K(t,t^\prime)\phi_n(t^\prime) 
\\ 
\int \phi_n(t) \phi_m(t) dt &amp;=&amp; \delta^K_{mn} 
\end{eqnarray} 

The $\phi_m(t)$ are a possibly infinite set of orthornormal eigenfunctions of 
the kernel $K$ and $\lambda_m$ their eigenvalues. We now do a very similar 
trick to before, yet we promote vectors to functions. Let 

\begin{eqnarray} 
y_m=f(X,m) &amp;=&amp; \sqrt{2 \lambda_m}\mathrm{erf}^{-1}\left( X \right) \\ 
\eta(t) &amp;=&amp; \sum_{m=1}^\infty \phi_m(t) y_m + \mu(t) \\ 
\eta(t) &amp;=&amp; \sum_{m=1}^\infty \phi_m(t) \sqrt{2 \lambda_m} 
\mathrm{erf}^{-1}\left( X \right)  + \mu(t) 
\end{eqnarray} 

This decomposition of a kernel into eigenfunctions actually has an intimate 
connection with quantum field theory. Since the normalization $Z$ for 
$P[\eta(t)]$ is in fact the determinant of the kernel $K$, which is the 
product of the eigenvalues: 

\begin{eqnarray} 
Z &amp;=&amp; \sqrt{\prod_{m=1}^\infty 2\pi \lambda_m } 
\end{eqnarray} 

Such is the trick Sidney Coleman used to do quite a few path integral 
calculations -- or at least as I understand from a friend! 