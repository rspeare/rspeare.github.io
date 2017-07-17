---
layout: post
title: Multi-Dimensional Central Limit Theorem
date: '2014-02-17T23:58:00.001-08:00'
author: Robert Speare
tags:
- Quals
- Central Limit Theorem
- Statistics
modified_time: '2014-02-18T03:42:39.722-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-7375034276757932655
blogger_orig_url: http://rspeare.blogspot.com/2014/02/multi-dimensional-central-limit-theorem.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Let us begin with the 
definition of a normalized probability distribution: 

\begin{eqnarray} 
\int_{-\infty}^{\infty} P(x) dx &amp;=&amp; 1 
\end{eqnarray} 

and a moment, 

\begin{eqnarray} 
\int_{-\infty}^{\infty} x^n P(x) dx &amp;=&amp; m_n 
\end{eqnarray} 

Notice that $m_1$ is the `mean' or average, or, `center of mass' of the 
Probability distribution. The second moment, $m_2$ is intimately related to 
the variance, or width of our distribution $P(x)$. 

We can define the moment generating function as 

\begin{eqnarray} 
\int e^{kx} P(x) dx &amp;=&amp; M(k) 
\end{eqnarray} 

Where now, taylor expanding our exponential integrand, we see that the $n^{\rm 
th}$ derivative of $M(k)$ with respect to $k$ evaluated at $k=0$, gives the 
respective moments: 

\begin{eqnarray} 
M(k) &amp;=&amp; \int e^{kx} P(x) dx\\ 
&amp;=&amp; \int \Sigma_n \frac{(kx)^n}{n!} P(x) dx \\ 
\frac{\partial^n M}{\partial k^n}\vert_{k=0} &amp;=&amp; \int x^n P(x) dx \\ 
\frac{\partial^n M}{\partial k^n}\vert_{k=0} &amp;=&amp; m_n 
\end{eqnarray} 

We can also define the moment generating function as the laplace transform of 
$P(x)$, which leaves us with an added sign convention in the definition of our 
moments, 

\begin{eqnarray} 
M^\prime (k) = \int e^{-kx}P(x) dx \\ 
(-1)^n \frac{\partial^n M^\prime}{\partial k^n}\vert_{k=0} &amp;=&amp; m_n 
\end{eqnarray} 
<pre style="-qt-block-indent: 0; margin-bottom: 0px; margin-left: 0px; 
margin-right: 0px; margin-top: 0px; text-indent: 
0px;"></pre><pre><!--EndFragment--></pre> 
Now we are in a position to define the fourier transorm of our probability 
distribution, called the characteristic function, 

\begin{eqnarray} 
M^\prime(ik) = \phi(k) &amp;=&amp; \int e^{-ikx}P(x) dx 
\end{eqnarray} 

We can simply think of $\phi(k)$ as the fourier transform of $P(x)$, and note 
that $\phi(0) =1$ always -- as required by our normalization condition above. 

Writing the inverse fourier transform, we can now write $P(x)$ in terms of 
$k-$space components, 

\begin{eqnarray} 
P(x) &amp;=&amp; \frac{1}{2\pi}\int e^{ikx} \phi(k) dk \\ 
 &amp;=&amp; \frac{1}{\pi}\int e^{ikx} e^{\log\left(\phi(k)\right)}dk 
\end{eqnarray} 

Where I have used the $\frac{1}{2 \pi}$ for inverse fourier normalization 
conventions (not the same as the QM convention!). 

I would now like to define cumulants which, are the corresponding derivatives 
of the $\psi(k)=\log\left(\phi(k)\right)$ function, seen the exponential 
argument of the above equation. First, notice that under the fourier 
transform, multiplication in x-space is differentiation in k-space, i.e. 

\begin{eqnarray} 
\mathcal{F}\left[ xP(x) \right] &amp;=&amp; (-i)\frac{\partial \phi}{\partial 
k} 
\end{eqnarray} 

and so we find that the various moments can be defined by the partial 
derivatives of the characteristic function (not much different than what we 
did before with the moment generating function $M^\prime$, under simply a 
change of variable): 

\begin{eqnarray} 
m_n &amp;=&amp; (-i)^n \frac{\partial^n \phi}{\partial k^n}\vert_{k=0} 
\end{eqnarray} 

Using our $\psi(k)$ function from before, we can now define the cumulants 

\begin{eqnarray} 
c_n &amp;=&amp; (i)^n \frac{\partial^n \psi}{\partial k^n}\vert_{k=0} 
\end{eqnarray} 

which, can be constructed out of our initial moments, 

\begin{eqnarray} 
c_1 &amp;=&amp; m_1 \\ 
c_2 &amp;=&amp; m_2-m_1^2\\ 
c_3 &amp;=&amp; m_2-3m_2m_1+2m_1^2\\ 
c_4 &amp;=&amp; m_4-4m_3m_1-3m_2^2+12m_2m_1^2-6m_1^2 
\end{eqnarray} 

Notice that the first cumulant is our standard mean, or average, and that the 
second cumulant is our definition of variance, or the expectation value of 
difference from the mean. (i.e. $c_1=\bar{x}$ and $c_2 
=\sigma^2=E[(x-\bar{x})^2]$). These cumulants are very good descriptors of a 
statistical distribution because they add under convolution. Let's take a 
closer look. 

Under the fourier transform, convolution in x-space is multiplication in 
k-space -- see convolution theorem -- and so cumulants and cumulant-generating 
functions add under convolution. In probability theory, when one adds two 
statistically independent variables $x$ and $y$ in order to create a new 
variable $z=x+y$, then the probability distribution that describes $z$ is the 
convolution of the two former probability distributions: $P(z) = \left(P_x 
\star P_y\right)(z)$. Let's see what such an addition would do in fourier 
space, 

\begin{eqnarray} 
P(z) &amp;=&amp; \left(P_x \star P_y\right)(z) \\ 
&amp;=&amp; \mathcal{F}^{-1}\left[ \phi_x(k)\phi_y(k) \right]\\ 
&amp;=&amp; \frac{1}{2\pi}\int e^{i k x} \phi_x(k)\phi_y(k) dk \\ 
&amp;=&amp; \frac{1}{2\pi}\int e^{i k x} e^{\log\left(\phi_x(k)\right)}e^{\log 
\left(\phi_y(k)\right)}dk \\ 
&amp;=&amp; \frac{1}{2\pi}\int e^{i k x} e^{\psi_x(k)+\psi_y(k)}dk \\ 
\end{eqnarray} 

Expanding both cumulant-generating functions as a taylor series, and 
collecting like powers of $k$, we find 

\begin{eqnarray} 
P(z) &amp;=&amp; \frac{1}{2\pi}\int e^{i k x} 
e^{-ic_{1x}k-c_{2x}k^2/2+ic_{3x}\frac{k^3}{3!}+\dots}e^{-ic_{1y}k-c_{2y}k^2/2+ic_{3y}\frac{k^3}{3!}+\dots}dk 
\\ 
&amp;=&amp; \frac{1}{2\pi}\int e^{i k x} 
e^{-i(c_{1x}+c_{1y})k-(c_{2x}+c_{2y})k^2/2+i(c_{3x}+c_{3y})\frac{k^3}{3!}+\dots}dk 
\\ 
\end{eqnarray} 

Notice that $c_{1z}= c_{1x}+c_{1y}$ and $c_{2z}= c_{2x}+c_{2y}$, or the mean 
is the sum of the two former means, and the variance is the sum of the two 
former variances. Very cool! 

Under what are called identically independent processes, such as random walks, 
we have a new variable $z=\sigma x_i$, which is a superposition of independent 
variables that are described by the exact same probability density function. 
In this case, our expectation value -- or first moment -- for the variable $z$ 
becomes $Nm_{1z}=N\bar{x}$, where $N$ is the number of `steps' or `trials' 
taken. Similarly we find that the variance of the sum of random variables is 
$\sigma^2_z = N \sigma^2_x$. Or the variance grows as $\sqrt{N}$. 

The central limit theorem depends intimately upon this addition of cumulants 
under convolution, and uses the inverse properties of expansion and dilation 
under the fourier transform to truncate the taylor expansion of our effective 
cumulant generating functions. Let's take a look at an `iid' process, or 
$P(z)$, where $z=\Sigma x_i$. 

\begin{eqnarray} 
P(z) &amp;=&amp; \frac{1}{2\pi} \int e^{ikz}\Pi_{i=1}^N \phi_i(k) dk \\ 
P(z) &amp;=&amp; \frac{1}{2\pi} \int e^{ikz}e^{\Sigma_i \psi_i(k)} dk \\ 
P(z) &amp;=&amp; \frac{1}{2\pi} \int e^{ikz}e^{\Sigma_i \left( 
-ic_{1i}\right)-ik}e^{\Sigma_i \left( -c_{2i}\right)\frac{-k^2}{2}}+\cdots dk 
\end{eqnarray} 

As we convolve more and more probability density functions, our variances will 
add, and we will end up with an extremely wide density function. In fourier 
space, this corresponds to an extremely narrow characteristic function, and 
allows us to assume negligible value of $\phi(k)$ at high $k$-values. Thus, we 
can write 

\begin{eqnarray} 
\psi(k) &amp;=&amp; -ic_1 k - 
c_2\frac{k^2}{2}+ic_3\frac{k^3}{3!}-c_4\frac{k^4}{4!}+\dots 
\end{eqnarray} 

as 

\begin{eqnarray} 
\psi(k) &amp;\approx &amp; -ic_1 k - c_2\frac{k^2}{2} 
\end{eqnarray} 

Taking this into account -- and noting that the $c_1$ and $c_2$ are in fact 
sums of former means and variances under convolution -- we can now write 
$P(z)$ as, 

\begin{eqnarray} 
P(z) &amp;=&amp; \frac{1}{2 \pi} \int e^{ikz}e^{-ic_1 k}e^{-c_2 
\frac{k^2}{2}}dk \\ 
P(z) &amp;=&amp; \frac{1}{2 \pi} \int e^{ikz}e^{-ic_1 k}e^{-c_2 
\frac{k^2}{2}}dk 
\end{eqnarray} 

Setting $z^\prime = z-c_1$, or, centering about the mean we can exclude the 
first exponential and write 

\begin{eqnarray} 
P(z^\prime) &amp;=&amp; \frac{1}{2 \pi} \int e^{ikz^\prime}e^{-c_2 
\frac{k^2}{2}}dk 
\end{eqnarray} 
<div> 

This is the fourier transform of a gaussian, which is itself a gaussian, 

\begin{eqnarray} 
P(z^\prime) &amp;=&amp; \frac{1}{\sqrt{2 \pi c_2}}e^{\frac{-z^2}{2c_2}}\\ 
P(z) &amp;=&amp; \frac{1}{\sqrt{2 \pi 
\sigma^2}}e^{\frac{-(z-c_1)^2}{2\sigma^2}}\\ 
P(z) &amp;=&amp; \frac{1}{\sqrt{2 \pi 
\sigma^2}}e^{\frac{-(z-\bar{z})^2}{2\sigma^2}} 
\end{eqnarray} 

Whew! Notice that our mean and variance in this final equation are simply the 
sums of former means and variances of the independent variables, $x_i$ that 
created $z$. ($z = \Sigma_i x_{i}$  ;  $c_1 = \Sigma_i c_{1i}$  ;  $c_2 = 
\Sigma_i c_{2i}$). The central limit theorem does not depend on each of these 
variables -- perhaps $N$ of them -- being identical, or, described by the same 
probability density function, they need only be independent. 

Now, extrapolation to multiple dimension is not to bad, we now deal with 
random vectors as compared to random scalars. Let's represent these vectors 
with boldface, and label their components with a superscript. We can now write 

\begin{eqnarray} 
\mathbf{z} &amp;=&amp; \Sigma_j \mathbf{x^j} 
\end{eqnarray} 

Where the superscript denotes the $j^{\rm th}$ independent random vector. 
Similarly, our $k$ space is now multidimensional, and so we write the forward 
fourier transform of our probability density as 

\begin{eqnarray} 
\phi(\mathbf{k}) &amp;=&amp; \int e^{i\mathbf{k}\cdot 
\mathbf{x}}P(\mathbf{x})d^d\mathbf{x} \\ 
\phi(\mathbf{k}) &amp;=&amp; \int 
e^{i\mathbf{k_i}\mathbf{x_i}}P(\mathbf{x})d^d\mathbf{x} 
\end{eqnarray} 

The cumulants and the moments are now rank $n$ tensors, seen by the following 

\begin{eqnarray} 
\frac{\partial^n M}{\partial \mathbf{k}_i \partial \mathbf{k}_j \cdots 
\partial \mathbf{k}_\gamma}\vert_{\mathbf{k}=0} &amp;=&amp; (-i)^n 
\mathbf{m}_{ij\cdots \gamma} \\ 
\frac{\partial^n \psi}{\partial \mathbf{k}_i \partial \mathbf{k}_j \cdots 
\partial \mathbf{k}_\gamma}\vert_{\mathbf{k}=0} &amp;=&amp; (-i)^n 
\mathbf{c}_{ij\cdots \gamma} 
\end{eqnarray} 

We now use the same approximation scheme as before, convolving an absurd 
number of multi-dimensional probability density functions, $P(\mathbf{x}_i)$ 
in order to yield a convolution in fourier space -- and thus an addition of 
cumulant generating functions 

\begin{eqnarray} 
P(\mathbf{z}) &amp;=&amp; \frac{1}{(2\pi)^d}\int e^{i\mathbf{k}\cdot 
\mathbf{z}}e^{\Sigma \psi_i(\mathbf{k})}d^d\mathbf{k}\\ 
P(\mathbf{z}) &amp;=&amp; \frac{1}{(2\pi)^d}\int e^{i\mathbf{k}\cdot 
\mathbf{z}}e^{-i \mathbf{c}_i \mathbf{k}_i)}e^{-i\mathbf{k}_i \mathbf{c}_{ij} 
\mathbf{k}_j)}e^{-i \mathbf{c}_{ijk} \mathbf{k}_i \mathbf{k}_j 
\mathbf{k}_k)}\cdots d^d\mathbf{k}\\ 
\end{eqnarray} 

Truncating our taylor expansion and centering about the multidimensional mean 
$\mathbf{z}_i^\prime = \mathbf{z}_i - \mathbf{c}_i $, 

\begin{eqnarray} 
P(\mathbf{z}^\prime) &amp;=&amp; \frac{1}{(2\pi)^d}\int e^{i\mathbf{k}\cdot 
\mathbf{z}^\prime}e^{-i\mathbf{k}_i \mathbf{c}_{ij} 
\mathbf{k}_j)}d^d\mathbf{k}\\ 
\end{eqnarray} 

We can rescale coordinates by writing 

\begin{eqnarray} 
\mathbf{w} &amp;=&amp; \sqrt{\mathbf{c}_{ij}}\mathbf{k}_j 
\end{eqnarray} 

where, the square of a matrix can be written terms of its diagonalization by 
two unitary matrices $\mathbf{S}_{ij}$, and the diagonal matrix of eigenvalues 
$\mathbf{\Lambda}_{ij} = \delta_{ij}\lambda_i$, 

\begin{eqnarray} 
\mathbf{c}_{ij} &amp;=&amp; \mathbf{S}^{-1} \mathbf{\Lambda}\mathbf{S} \\ 
\mathbf{c}_{ij} &amp;=&amp; \mathbf{S}_{il} \lambda_l \delta_{lm} 
\mathbf{S}_{lj} \\ 
\sqrt{\mathbf{c}_{ij}} &amp;=&amp; \mathbf{S}_{il} \sqrt{\lambda_l} 
\delta_{lm} \mathbf{S}_{lj} \\ 
\mathbf{w} &amp;=&amp; \sqrt{\mathbf{c}_{ij}}\mathbf{k}_j 
\end{eqnarray} 

The determinant of this matrix will be the product of the eigenvalues 
$\lambda_j$, which is also the dilating factor by which one expands a single 
$\mathbf{k}$ vector; so  we can now write our infinitesimal volume element in 
$d$-dimensional $\mathbf{k}$ space using this determinant, 

\begin{eqnarray} 
d^d \mathbf{w} &amp;=&amp; \left( \vert \mathbf{c}_{ij} \vert \right)^{d/2} 
d^d\mathbf{k} 
\end{eqnarray} 

Now rewriting our integral, we have a multi-dimensional transform of a 
Gaussian, which is another Gaussian 

\begin{eqnarray} 
P(\mathbf{z}^\prime) &amp;=&amp; \frac{1}{(2\pi)^d} \int e^{i 
\frac{\mathbf{w}_j}{\sqrt{\mathbf{c_{ij}}}} 
\mathbf{z}_i^\prime}e^{-\frac{\mathbf{w}_i  
\mathbf{w}_i}{2}}\frac{d^d\mathbf{w}}{\vert \mathbf{c}_{ij} \vert^{d/2}}\\ 
P(\mathbf{z}^\prime)  &amp;=&amp; \frac{1}{(2\pi \vert \mathbf{c}_{ij} 
\vert)^{d/2}} 
\mathrm{exp}\left(-\frac{1}{2}\frac{\mathbf{z^\prime}_l}{\mathbf{c}_{il}}\frac{\mathbf{z^\prime}_\gamma}{\mathbf{c}_{i 
\gamma}}\right) 
\end{eqnarray} 

Whew! The argument in the exponential -- namely, those nasty matrix 
multiplications into the second cumulant matrices -- can be simplified, 
yielding a single covariance matrix on the bottom. 

\begin{eqnarray} 
P(\mathbf{z}^\prime)  &amp;=&amp; \frac{1}{(2\pi \vert \mathbf{c}_{ij} 
\vert)^{d/2}} 
\mathrm{exp}\left(-\frac{1}{2}\frac{\mathbf{z^\prime}_l}{\mathbf{c}_{il}}\frac{\mathbf{z^\prime}_\gamma}{\mathbf{c}_{i 
\gamma}}\right) 
\end{eqnarray} 