---
layout: post
title: Label Propagation in SSL through a Markov Random Walk
date: '2016-01-29T06:33:00.004-08:00'
author: Robert Speare
tags:
- Machine Learning
- Statistics
- cumulants. statistics
modified_time: '2016-01-29T07:55:33.053-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-6410156644227408482
blogger_orig_url: http://rspeare.blogspot.com/2016/01/label-propagation-in-ssl-through-markov.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Szummer and Jaakola 
(2002) used the exact same frame work written in the last post 
[label-propagation-and-semi-supervised.html](http://rspeare.blogspot.com/2016/01/label-propagation-and-semi-supervised.html) 
to propagate labels outwards from a training set via some distance measure. 
But, they used a Markov random walk, with transition matrix: 

\begin{eqnarray} 
p_{ij} &amp;=&amp; \frac{W_{ij}}{\sum_{ik} W_{ik}} \\ 
&amp;=&amp; \mathbf{D}^{-1}\mathbf{W} 
\end{eqnarray} 

Notice, this is exactly the same as our transition matrix from before. The 
best way to view $p_{ij}$ is a conditional probability that a particle lives 
at position $i$, given that it was at position $j$ the moment before: 

\begin{eqnarray} 
p_{ij} &amp;=&amp; P(x_{t+1}=\mathbf{x}_i \vert x_{t}=\mathbf{x}_j) 
\end{eqnarray} 

Now, this is only a single step. By markov property we can extend to any 
number of steps in time $t$: 

\begin{eqnarray} 
p^{(2)}_{ij} &amp;=&amp; P(x_{t+2}=\mathbf{x}_i \vert x_{t}=\mathbf{x}_j)\\ 
&amp;=&amp; \sum_{x_{t+1}} P(x_{t+2}=\mathbf{x}_i \vert 
x_{t+1}=\mathbf{x}_j)P(x_{t+1}=\mathbf{x}_i \vert x_{t}=\mathbf{x}_j) 
\end{eqnarray} 

or, in matrix form: 

\begin{eqnarray} 
p_{ij}^{(2)} &amp;=&amp; \sum_k p_{ik} p_{kj} = \mathbf{p}^2 \\ 
p_{ij}^{(t)} &amp;=&amp; \mathbf{p}^t 
\end{eqnarray} 

this type of framework allows for traversal of particles through our 
``graph'', consisting of the labeled and unlabeled datapoints. It is precisely 
the same as the Helmholtz algorithm given before, but instead of soft labels 
$y(x)$ being propagated we have representative ``hard'' particles. 