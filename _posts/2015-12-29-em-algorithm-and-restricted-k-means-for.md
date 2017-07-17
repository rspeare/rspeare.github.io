---
layout: post
title: EM Algorithm and restricted K-means for the M-Traveling Salesman Problem
date: '2015-12-29T22:06:00.003-08:00'
author: Robert Speare
tags:
- cluster
- kaggle
- Machine Learning
- Statistics
- cumulants. statistics
modified_time: '2015-12-29T22:34:09.587-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8143022356587055083
blogger_orig_url: http://rspeare.blogspot.com/2015/12/em-algorithm-and-restricted-k-means-for.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">One very popular and very 
useful algorithm that its taken me a while to get around to is something 
called the Expectation-Maximization algorithm, or EM. A lot of people treat 
this thing as a black box, but because I wanted to implement my own 
handwritten constraints in a K-means and Gaussian mixture model, I had to sit 
down and read through things. 

Turns out the EM algorithm is all about introducing auxiliary variables to 
your problem -- auxiliary data to be exact. Physicists solve things all the 
time by ``enriching'' and the integrating out, which is exactly what EM does. 
Let's say we have a sequence of observations $\vec{x}_i$ for $i=1...N$, and we 
would like to estimate their density. Problem is, they seem to form some awful 
distribution, something that would be impossible to model with a Gaussian 
distribution or a Poisson or any ``sane'' thing. We could resort to 
non-parametrics, such as Kernel Density estimation but another idea may be to 
say ``Hey, I bet the first data point came from a Gaussian distribution, but 
one that was centered over THERE. Let's call it Gaussian  A. And I bet the 
second was drawn from the same Gaussian A. But the third, which is really far 
away, was drawn from an entirely different Gaussian distribution, which we can 
call B \dots" etc. 

What we're doing here is introducing ``membership'', which of course has a 
close relation to clustering and space segmentation, but more on that later. 
We now have our auxiliary variables in the problem. 

\begin{eqnarray} 
\vec{x}_i, \vec{z}_i 
\end{eqnarray} 

For each $i$, $\vec{x}$ is the observable, living in lets say $D$ dimensions, 
since each data point has D features, while $\vec{z}$ is the membership. For 
the Gaussian mixture case $\vec{z}$ lives in K dimensions, where K is the 
number of Gaussians -- or clusters -- we allow to build the space. Now it's 
pretty simple to write down the log Likelihood, but we have to think about 
what parameters we are conditioning on. We've got the mean and variance of 
EACH Gaussian, let's call them $\mathbf{\mu}_k, \mathbf{\Sigma}_k$ and we've 
also got the probability of membership $\vec{z}_i$, for every $i$, essentially 
its PDF. Let's call this $\vec{\phi}$, which note, has K components and is in 
general a multinomial for the whole data set, multinoulli for a single draw. 
(The attentive reader will note that I'm taking notation directly from Andrew 
Ng and Kevin Murphy, who both have great notes on this). 

\begin{eqnarray} 
\mathcal{L}(X \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) &amp;=&amp; \log 
\left(P(X \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k)\right) 
\end{eqnarray} 

Let's take this a step at a time. If we assume that every data point 
$\vec{x}_i$ is independent, then we can write 
\begin{eqnarray} 
\mathcal{L}(X \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) &amp;=&amp; \sum_i 
\log \left(P(\vec{x}_i \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k)\right) 
\end{eqnarray} 

Now, if we want to include our auxiliary variables, we have to include them 
explicitly inside the log but marginalize over them: 

\begin{eqnarray} 
\mathcal{L}(X \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) &amp;=&amp; \sum_i 
\log \left( \sum_{z_i} P(\vec{x}_i, z_i \vert \phi, 
\mathbf{\mu}_k,\mathbf{\Sigma}_k)\right) 
\end{eqnarray} 

And now, we can use a very interesting trick. My first intuition at this point 
was to expand the joint inside the log like so 

\begin{eqnarray} 
\mathcal{L}(X \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) &amp;=&amp; \sum_i 
\log \left( \sum_{z_i} P(\vec{x}_i \vert 
\mathbf{\mu}_k,\mathbf{\Sigma}_k)P(z_i \vert \phi) \right) 
\end{eqnarray} 

and keep working but apparently there's a more useful way to do things. If we 
divide and multiply by some UNKNOWN PDF in $z_i$, $Q(z_i)$ we can use Jensen's 
equality to write: 

\begin{eqnarray} 
\mathcal{L}(X \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) &amp;=&amp; \sum_i 
\log \left( \sum_{z_i} Q(z_i) \frac{P(\vec{x}_i, z_i \vert \phi, 
\mathbf{\mu}_k,\mathbf{\Sigma}_k)}{Q(z_i)}\right)\\ 
&amp; \ge &amp; \sum_i \sum_{z_i} Q(z_i)  \log \left( \frac{P(\vec{x}_i, z_i 
\vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k)}{Q(z_i)}\right) 
\end{eqnarray} 

We can do this because log is a concave function, and for any concave function 
we have: 

\begin{eqnarray} 
E\left[f(x) \right] &amp; \le &amp; f(E\left[x \right]) 
\end{eqnarray} 

Our expectation is over $z_i$ and so now we see that our log loss is strictly 
greater than this somewhat easier expression on the RHS. But, it kind of looks 
familiar... its the negative KL divergence between the two distributions in 
$z_i$! If we want maximize our lower bound and make it as small as possible, 
we need to minimize the KL, divergence, essentially setting: 

\begin{eqnarray} 
P(\vec{x}_i, z_i \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) &amp;= &amp; 
\mathrm{const} Q(z_i) \ \ \forall \ z_i 
\end{eqnarray} 

So if we sum both sides in $z_i$ we get the marginalized distribution on the 
left and a constant on the right: 

\begin{eqnarray} 
\sum_{z_i}P(\vec{x}_i, z_i \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) 
&amp;= &amp; \sum_{z_i} \mathrm{const} Q(z_i) \\ 
P(\vec{x}_i \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) &amp;=&amp; 
\mathrm{const} 
\end{eqnarray} 

i.e. the best candidate for $Q(z_i)$ is the conditional membership, based on 
the datapoint $x_i$ itself! 

\begin{eqnarray} 
Q(z_i) &amp;=&amp; \frac{P(\vec{x}_i, z_i \vert \phi, 
\mathbf{\mu}_k,\mathbf{\Sigma}_k)}{P(\vec{x}_i \vert \phi, 
\mathbf{\mu}_k,\mathbf{\Sigma}_k)}\\ 
&amp;=&amp; P( z_i \vert \vec{x}_i, \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) 
\end{eqnarray} 

So now, with this $Q$ in hand in we have a tight lower bound on the log 
likelihood, which we can then maximize in $\mathbf{\mu}_k, \mathbf{\Sigma}_k$: 

\begin{eqnarray} 
\mathcal{L}(X \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k)&amp;\ge &amp; 
\sum_i \sum_{z_i} P(z_i \vert \vec{x}_i, \phi, \mu_k ,\Sigma_k )  \log \left( 
P(\vec{x}_i \vert \phi, \mathbf{\mu}_k,\mathbf{\Sigma}_k) \right) 
\end{eqnarray} 

The EM algorithm simply consists of the following two steps: 

(1) Given $\mu_k,\Sigma_k$ and the data $X$, calculate $P(z_i \vert \vec{x}_i, 
\phi, \mu_k ,\Sigma_k )  $. (E-step) 
(2) Given the above, maximize w/r/t $\mu_k,\Sigma_k$. (M-Step) 
(*) repeat 


So, we are essentially calculating data point memberships -- E step -- and 
then optimizing the log likelihood, as we always would -- E step. The 
difference here is that we don't set hard memberships in our model. We let 
there be fractional or ``soft'' memberships in this likelihood expression. 

In algorithms like K-means, which actually works on the same EM principle with 
some drastic assumptions, we have **hard** memberships, and **identical, 
diagonal **covariance matrices across all Gaussians -- or clusters -- K. These 
assumptions make things super fast and scalable but of the data has any 
spatial skewness or inhomogeneity, we could be in trouble. [Differing size of 
clusters is a problem two, but I haven't come to understand this yet] 

The beautiful thing about EM, and I don't have time to get into it now, is 
that it's gauranteed to monotonically increase the log likelihood iteration by 
iteration, and this is simply due to the convexity properties we talked about 
earlier. Local maxima can be reached, but as long things are smartly seeded we 
can expect to find a good fit. 

---------------------------------------------------------------------- 

The reason I was using all this stuff, was to segment deliveries in a 
Traveling salesman problem. It's actually called the M travelling salesman 
problem where multiple men try to visit many different locations with the 
least amount of effort -- however that is defined. There are some restrictions 
on how much the men can carry, perhaps how far they can go, and so this 
constitutes the restriction in my K-means/GMM models. 

[**<span style="color: blue;">Oh, and by the way, those men might be Santa 
making multiple trips to deliver gifts at 
Christmas**](https://www.kaggle.com/c/santas-stolen-sleigh) 