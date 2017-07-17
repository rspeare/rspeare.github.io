---
layout: post
title: Entity Resolution through Markov Random Fields and Logistic Regression
date: '2016-01-29T07:55:00.002-08:00'
author: Robert Speare
tags:
- Statistical Mechanics
- logistic regression
- Machine Learning
- Statistics
- cumulants. statistics
modified_time: '2016-01-29T08:06:32.922-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-6527580060034386067
blogger_orig_url: http://rspeare.blogspot.com/2016/01/entity-resolution-hidden-markov-random.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">So, along with label 
propagation, I've also been thinking about entity resolution, which is 
basically the same thing if you frame the problem correctly. 

Let's say you have a set of all labeled data: 

\begin{eqnarray} 
\lbrace \mathbf{x}_i, \mathbf{y}_i \rbrace_{i=1}^N 
\end{eqnarray} 

Where $y_i$ can be a class -- zero or one -- as we were talking about earlier, 
or a unique ID. What we would like to do is compare pair-wise our datapoints 
and see if the $y_i,y_j$'s are equal. This means that every pair is a 
probability instance, we 'd like to assign them a ``two-peas-in-a-pod'' 
probability. One way of doing this is with our similarity matrix, mentioned 
before: 

\begin{eqnarray} 
P(y_i = y_j \vert x_i,x_j) &amp;=&amp; \mathbf{W}_{ij} = e^{-\alpha_n 
g_n(x_i,x_j)} 
\end{eqnarray} 

Where in the exponent we have a linear combination of metrics. They can be 
Euclidean, Minkowski, cosine, what have you -- each with a weight $\alpha_n$. 
(This is particularly useful with string comparison, as some metrics are more 
informative of others). We can also use simple logistic regression: 

\begin{eqnarray} 
P(y_i = y_j \vert x_i,x_j) &amp;=&amp; \sigma\left(-\mathbf{W}_{ij}\right) = 
\frac{1}{1+e^{\alpha_n g_n(x_i,x_j)}} 
\end{eqnarray} 

(it turns out that this probability is flipped the wrong way if we kept the 
negative sign in the exponent, which can be seen by a simple plot). If we want 
to learn the optimal $\alpha_n$'s we can use gradient descent on some 
specified objective function. The graph based formulation is motivated by 
``Hidden Markov Random Field'' which penalizes different labels between close 
points -- as specified by $g$. 

\begin{eqnarray} 
E &amp;=&amp; \sum_{i,j\neq i} W_{ij} (y_i-y_j)^2 = \sum_{i,j \neq i}  
e^{-\alpha_n g_n(x_i,x_j)}(y_i-y_j)^2\\ 
&amp;=&amp; \sum_{i,j \neq i} P(y_i = y_j ) (y_i-y_j)^2\\ 
E&amp;=&amp; \mathcal{E}\left((y_i-y_j)^2 \right) 
\end{eqnarray} 

we see that this energy $E$ is just the expectation value of the pairwise 
label distance, a certain type of empirical Risk! ($E$ can also be treated as 
the log loss or negative log probability of the configuration $\lbrace y 
\rbrace$). 

Similarly, for logistic regression we just have our log loss. Both objective 
functions are differentiable with respect to the metric weights $\alpha_n$, so 
if we want to LEARN what comparators between $x_i,x_j$ are important, we 
simply use gradient descent on our labeled examples! To extend labels/matches 
to unlabeled points, we use the pairwise probabilities specified above. 

If one implemented this label matching, it would be wise to not compare every 
data instance -- which would be an $N^2$ blow up -- but only some restricted 
subset of "likely" pairs. Whether we are comparing for unique ID's in entity 
resolution or shared classes in label propagation, this algorithm/framework is 
be the same! 