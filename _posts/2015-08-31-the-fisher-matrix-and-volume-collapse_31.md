---
layout: post
title: The Fisher Matrix and Volume Collapse in Parameter Space
date: '2015-08-31T12:22:00.001-07:00'
author: Robert Speare
tags:
- conditional
- Statistical Mechanics
- Posterior
- Bayes
- Multinormal
- cumulants. statistics
modified_time: '2015-08-31T13:04:58.325-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-5318655270296006069
blogger_orig_url: http://rspeare.blogspot.com/2015/08/the-fisher-matrix-and-volume-collapse_31.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">The starting point for 
all inference is the likelihood function: 

\begin{eqnarray} 
\mathcal{L} \left(\mathbf{x} \vert \mathbf{\theta}\right) 
\end{eqnarray} 

where $\vec{\theta}$ is some set of parameters in our model and $X$ is the 
data matrix, the aggregate of all our experimental data. We can write the 
posterior of our experiment as: 

\begin{eqnarray} 
P(\vec{\theta} \vert X) &amp;=&amp; \frac{\mathcal{L}(X \vert 
\vec{\theta})P(\vec{\theta})}{P(X)} 
\end{eqnarray} 

Where the term in the denominator is called the evidence, and the 
$P(\vec{\theta})$ is our prior, filled with hyperparameters that give our 
initial beliefs on the model. David Mackay likes to talk about something 
called the ``Occam Factor'' which he gets by Taylor expanding the posterior in 
$\theta$ while keeping the Prior constant: 

\begin{eqnarray} 
P(\vec{\theta} \vert X) &amp;\approx &amp; \frac{\mathcal{L}(X \vert 
\hat{\theta})P(\hat{\theta})}{P(X)}e^{-(\vec{\theta}-\hat{\theta})_i 
F_{ij}(\vec{\theta}-\hat{\theta})_j} 
\end{eqnarray} 

Notice that the gradient of the prior at maximum likelihood, or Maximum a 
Posterior (MAP) is going to be zero, but the Hessian will not. We can take the 
Hessian of the negative log likelihood, whose expectation value is the Fisher 
information matrix: 

\begin{eqnarray} 
F_{ij} &amp;=&amp; \langle \frac{-\partial^2 \log 
\left(\mathcal{L}(\mathbf{x}\vert \mathbf{\theta})\right)}{\partial \theta_i 
\partial \theta_j}\rangle 
\end{eqnarray} 

One might ask, from an information theory point of view, how much ``help'' has 
our experiment, given the model and the data set X, really been? How much have 
we learned, relative to our prior? The answer to this is the information 
content in our Likelihood function, defined for any probability distribution 
to be: 

\begin{eqnarray} 
H\left[ p(x) \right] &amp;=&amp; -\int dx p(x) \log p(x) 
\end{eqnarray} 

For a multidimensional Gaussian, $x \in \mathcal{R}^d \sim 
\mathcal{N}(0,A_{ij})$ this is: 

\begin{eqnarray} 
H \left[p(x) \right] &amp;=&amp; \int d\vec{x} \frac{1}{(2\pi)^{d/2} \vert 
A_{ij} \vert^{1/2} }e^{\frac{-\vec{x}_i A^{-1}_{ij}\vec{x}_j}{2}} 
\left(\frac{d}{2}\log(2\pi) + \frac{1}{2}x_i x_j  i 
A^{-1}_{ij}+\frac{1}{2}\log \vert A_{ij} \vert \right) 
\end{eqnarray} 

The first and third terms are just constants, and the second is the covariance 
of our Gaussian distribution: $\langle x_i x_j \rangle = A_{ij}$, so we get 
the Trace of a $d \times d$ identity matrix: 


\begin{eqnarray} 
H \left[p(x) \right] &amp;=&amp; \int d\vec{x} \frac{1}{(2\pi)^{d/2} \vert 
A_{ij} \vert^{1/2} }e^{\frac{-\vec{x}_i A^{-1}_{ij}\vec{x}_j}{2}} 
\left(\frac{d}{2}\log(2\pi) + \frac{1}{2}A_{ij}  i A^{-1}_{ij}+\frac{1}{2}\log 
\vert A_{ij} \vert \right)\\ 
&amp;=&amp; \int d\vec{x} \frac{1}{(2\pi)^{d/2} \vert A_{ij} \vert^{1/2} 
}e^{\frac{-\vec{x}_i A^{-1}_{ij}\vec{x}_j}{2}} \left(\frac{d}{2}\log(2\pi) + 
\frac{1}{2}\mathrm{Tr}(I_d)+\frac{1}{2}\log \vert A_{ij} \vert \right)\\ 
&amp;=&amp; \frac{d}{2}\log(2\pi e) + \frac{1}{2}\log \vert A_{ij} \vert \ 
\end{eqnarray} 

This is the information content for any Gaussian with arbitrary mean $\mu_i$ 
and Covariance matrix $A_{ij}$. If we assume a Gaussian prior 
$P(\vec{\theta})=N(0,\sigma_{ij}$, then we can write the information content 
of our Likelihood function, and prior as: 

\begin{eqnarray} 
H\left[\mathcal{L} \right] &amp;=&amp; \frac{d}{2}\log(2\pi e) + \log \left( 
\vert F_{ij}^{-1} \vert \right) \\ 
H\left[P(\vec{\theta})\right] &amp;=&amp; \frac{d}{2}\log(2\pi e) + \log 
\left( \vert \Sigma_{ij} \vert \right) 
\end{eqnarray} 

This is quite interesting, because in statistical mechanics  entropy goes like 
the Logarithm of accessible volume in phase space. What we have here, this 
logarithm of a determinant, is precisely the same thing, because: 

\begin{eqnarray} 
\sqrt{\vert A_{ij} \vert} &amp; \sim &amp; \int d\vec{x} \ \ \mathrm{s.t.} \ 
x_i A^{-1}_{ij}x_j  \le 1 
\end{eqnarray} 

Or the approximate volume of an ``ellipsoid'' in phase space (not allowing the 
- log likelihood to go above unity). If we compare information content between 
the prior and the Likelihood we get: 

\begin{eqnarray} 
H \left[\mathcal{L} \right]-H\left[P(\vec{\theta})\right] &amp;=&amp; 
\frac{1}{2} \log  \frac{\vert F_{ij}^{-1}\vert}{\vert \Sigma_{ij} \vert } 
\end{eqnarray} 

Exponentiating the difference in Entropies, we get a ratio of the Volumes in 
parameter space: 

\begin{eqnarray} 
e^{H \left[\mathcal{L} \right]-H\left[P(\vec{\theta})\right]} &amp;=&amp; 
\frac{\sqrt{\vert F_{ij}^{-1}\vert}}{\sqrt{\vert \Sigma_{ij}\vert}} = 
\frac{\mathrm{Vol}(\mathcal{L})}{\mathrm{Vol}(P)} 
\end{eqnarray} 

This ratio of Volumes is the ``true'' Occam factor, in my opinion as it 
represents the ``collapse'' in parameter space of our beliefs. But we have not 
taken the full posterior into account, only our learning from the Likelihood 
function, separate from the Prior. It would perhaps be more consistent to deal 
with the prior as a whole, which has a negative log Hessian of the form: 

\begin{eqnarray} 
P(\vec{\theta} \vert X) &amp;=&amp; \frac{\mathcal{L}(X \vert 
\vec{\theta})P(\vec{\theta})}{P(X)}\\ 
P(\vec{\theta}) &amp;=&amp; \mathcal{N}(0, \Sigma_{ij})\\ 
\mathcal{L}(X \vert \vec{\theta}) &amp; \approx &amp; 
\mathcal{N}(\hat{\theta}, F_{ij}^{-1}) \\ 
\langle -\frac{\partial^2 \log P(\vec{\theta}\vert X)}{\partial \theta_i 
\partial \theta_j} \rangle &amp;=&amp; F_{ij}+\Sigma_{ij}^{-1} 
\end{eqnarray} 

So the information content of the full posterior goes like: 

\begin{eqnarray} 
H\left[ P(\vec{\theta} \vert X) \right] &amp;\sim &amp; \frac{1}{2}\log \left( 
\mathrm{det} \vert (F_{ij}+\Sigma_{ij}^{-1})^{-1} \vert \right)\\ 
&amp;=&amp; \frac{1}{2}\log \left( \frac{1}{\mathrm{det} \vert 
(F_{ij}+\Sigma_{ij}^{-1})\vert }\right) 
\end{eqnarray} 

and if we ask for the information difference, we get: 

\begin{eqnarray} 
H\left[ P(\vec{\theta} \vert X) \right]-H\left[ P(\vec{\theta}) \right] 
&amp;=&amp; \frac{1}{2}\log \left( \frac{1}{\mathrm{det} \vert 
(F_{ij}+\Sigma_{ij}^{-1})\vert  \mathrm{det} \vert\Sigma_{ij} \vert}\right) \\ 
H\left[ P(\vec{\theta} \vert X) \right]-H\left[ P(\vec{\theta}) \right] 
&amp;=&amp; \frac{-1}{2}\log \left( \mathrm{det} \vert 
(F_{ij}+\Sigma_{ij}^{-1})\vert \right) - \frac{1}{2}\log  \mathrm{det} 
\vert\Sigma_{ij} \vert 
\end{eqnarray} 

and since $\mathrm{det}\vert A+B \vert \ge \mathrm{det}\vert A 
\vert+\mathrm{det}\vert B \vert$, we can write the inequality: 

\begin{eqnarray} 
H\left[ P(\vec{\theta} \vert X) \right]-H\left[ P(\vec{\theta}) \right] 
&amp;\ge &amp; \frac{-1}{2}\log \left( \mathrm{det} \vert F_{ij}\vert+ 
\mathrm{det} \vert\Sigma_{ij}^{-1})\vert \right) - \frac{1}{2}\log  
\mathrm{det} \vert\Sigma_{ij} \vert \\ 
H\left[ P(\vec{\theta} \vert X) \right]-H\left[ P(\vec{\theta}) \right] 
&amp;\ge &amp; \frac{-1}{2}\log \left(1+ \mathrm{det} \vert F_{ij}\vert 
\mathrm{det} \vert\Sigma_{ij})\vert \right) \\ 
H\left[ P(\vec{\theta} \vert X) \right]-H\left[ P(\vec{\theta}) \right] 
&amp;\ge &amp; \frac{-1}{2}\log \left(1+ \mathrm{det} \vert 
F_{ij}\Sigma_{jl})\vert \right) \\ 
\mathrm{entropy} \ \mathrm{``destroyed''}&amp; \sim &amp; \frac{\mathrm{det} 
\vert\Sigma \vert }{ \mathrm{det}\vert F^{-1} \vert} 
\end{eqnarray} 

Where in the last line I've Taylor expanded the log. This negative quantity is 
approximately how much entropy we are ``killing'' by doing our experiment $X$. 
We are gauranteed to learn **something** by observing $X$ and putting it into 
our model, but the important consideration is the determinant of the Fisher 
matrix. If it is very large, our parameter space will ``collapse'' 
substantially, as we saw before. 