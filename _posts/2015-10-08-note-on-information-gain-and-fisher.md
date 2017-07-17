---
layout: post
title: Note On "Information Gain" and the Fisher Information
date: '2015-10-08T09:31:00.001-07:00'
author: Robert Speare
tags:
- fisher information
- entropy
- Bayes
- cumulants. statistics
modified_time: '2015-10-16T07:52:15.098-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-2737238452155642191
blogger_orig_url: http://rspeare.blogspot.com/2015/10/note-on-information-gain-and-fisher.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">From last post, 
[http://rspeare.blogspot.com/2015/08/the-fisher-matrix-and-volume-collapse_31.html](http://rspeare.blogspot.com/2015/08/the-fisher-matrix-and-volume-collapse_31.html), 
I was talking about "volume" collapse in parameter space due to some data, 
$\vec{x}$. I'd like to relate this to information gain, which can be defined 
pretty simply as: 

\begin{eqnarray} 
H[p(\vec{\theta})] - H[p(\vec{\theta} \vert \vec{x})] &amp;=&amp; 
IG(\vec{\theta} \vert \vec{x}) 
\end{eqnarray} 

Now, using Bayes' rule we can change what we've written in the second term 
above: 

\begin{eqnarray} 
H[p(\vec{\theta})] - H[\mathcal{L}(\vec{x} \vert \vec{\theta}) 
p(\vec{\theta})] &amp;=&amp; IG(\vec{\theta} \vert \vec{x}) 
\end{eqnarray} 

And using the addition property of entropy, we can write: 

\begin{eqnarray} 
IG(\vec{\theta} \vert \vec{x}) &amp;=&amp; - H[\mathcal{L}(\vec{x} \vert 
\vec{\theta})] 
\end{eqnarray} 

But, with the fisher information matrix, 

\begin{eqnarray} 
\mathbf{F}_{ij} &amp;=&amp;\langle \frac{-\partial^2 \log 
\mathcal{L}(\mathbf{x} \vert \mathbf{\theta})}{\partial \theta_i \partial 
\theta_j} \rangle 
\end{eqnarray} 

 we can estimate the covariance of the likelihood function, and therefore it's 
entropy -- if we use the laplace approximation and denote the likelihood a 
gaussian in parameter space: 

\begin{eqnarray} 
H[\mathcal{L}] &amp;=&amp; \frac{d}{2}\log(2\pi e) + \log \left( \vert 
\mathbf{F}_{ij} \vert^{-1} \right) 
\end{eqnarray} 

This means that our information gain on $\vec{\theta}$ given an experiment 
$\vec{x}$ is proportional to the logarithm of the determinant of the Fisher 
matrix. 

\begin{eqnarray} 
IG(\vec{\theta} \vert \vec{x} ) &amp;\sim &amp;\log \left( \vert 
\mathbf{F}_{ij}\vert \right) 
\end{eqnarray} 

And so, we now see intuitively why this is \textbf{called} the fisher 
information. Our ``volume'' collapse on the variables of interest 
$\vec{\theta}$ given our experiment, is: 

\begin{eqnarray} 
e^{IG(\mathrm{\theta} \vert \mathrm{x})} &amp; \sim &amp; \mathrm{det}\vert 
\mathbf{F}_{ij} \vert 
\end{eqnarray} 