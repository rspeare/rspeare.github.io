---
layout: post
title: Co-linearity (Part 3)
date: '2017-02-10T04:41:00.001-08:00'
author: Robert Speare
tags: 
modified_time: '2017-02-10T04:49:47.399-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-2749892147223033037
blogger_orig_url: http://rspeare.blogspot.com/2017/02/co-linearity-part-3.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">As you can imagine, with 
increasing strength of the prior $s$, mentioned above, comes reduction in the 
magnitude of the regression coefficients $\beta$. Instead of using an $L2$ 
norm in the prior, one can also use an L1 norm, and then the log Likelihood 
becomes: 

\begin{eqnarray} 
- \mathcal{L}(\beta \vert X,Y) &amp;=&amp; \frac{(X_{ni} \beta_i - 
Y_n)^2}{2\sigma^2} +  \left(\sum_i \vert \beta_i \vert \right) 
\end{eqnarray} 

Which can be solved as a Quadratic programming problem as long as one puts an 
inequality constraint on the sum of the absolute coefficients of $\beta$: 
$T(\beta) = \sum_i \vert \beta_i \vert &lt; t$. This type of normalization of 
the regression coefficients is called the LASSO, and by the nature of its 
$\beta$ penalization, chooses solutions that are sparse in regressors -- i.e. 
kills off coefficients and features that seem not to matter. With a decreasing 
value of $t$ comes, fewer and few features, as you can imagine, and just like 
our parameter $s$ above, we have explicit control over the ``filtering'' 
pressure of our regression coefficients $\beta$. 

L2 and L1 regularization of regression coefficients lead to slightly different 
solutions. L2 tends to spread coefficient magnitude across clusters of 
variables that are all correlated with the target, while L1 aggressively 
prunes coefficient magnitude to the ``winners'' of the feature set. Making a 
plot of $\beta_i(t), \beta_i(s)$ for both L1 and L2 regularization, reveals 
this. 

The lasso can be very useful when trying to isolate ``what matters'' in a 
regression problem, and just like ridge regression, helps control linear 
dependence and colinearity within the data matrix, but one can also use simple 
clustering techniques to choose the ``best'' set of features. For example, 
take the normalized correlation matrix: 

\begin{eqnarray} 
\tilde{X}_{ni} &amp;=&amp; \frac{X_{ni}-\mu_i}{\sigma_i} \\ 
\rho_{ij} &amp;=&amp; \mathrm{corr}(x_i,x_j) = \frac{1}{N} 
\tilde{X}_{ni}\tilde{X}_{nj} 
\end{eqnarray} 

The upper diagonal portion of $\rho_{ij}$ represents a graph, where the nodes 
are the features $i$ and the edges are the matrix entries -- each between 0 
and 1. We can ``cluster'' our set of features very easily, by simply 
thresholding $\rho_{ij} &gt; \epsilon$ and then picking out connected 
components from the matrix. The connected components -- depending upon how 
many of them there are, each represent ``feature groups'', from which one can 
choose the most highly correlated feature with the target: 

\begin{eqnarray} 
\lbrace C_n \rbrace &amp;=&amp; \mathrm{conn}(\rho_{ij} &gt; \epsilon) \\ 
x_\mathrm{c} &amp;=&amp; \mathrm{max}_{i \in c} \left(\mathrm{corr}(x_i, 
y)\right)  \ \ \forall c \in \lbrace C_n \rbrace 
\end{eqnarray} 

Obviously, this filtered set of features -- and their multiplicity -- will be 
a function of $\epsilon$. As $\epsilon \to 1$ we will have all features come 
out, $x_c = x_i$, and as $\epsilon \to 0$ we will have the single, most 
highly-correlated feature: $x_c = \max_i \mathrm{corr}(x_i,y)$. 

The whole point of doing this, of course, is to find a set of features $x_c$ 
that are statistically de-coupled from one - another, and it really reduces to 
a supervised down-sampling of the initial data. 

Because regularization paths are so popular, especially from a diagnostic 
point of view, it's worth mentioning that one of my favorite algorithms for 
sequentially adding in features to a regression problem is LARS -- or least 
Angle Regression. The basic idea comes from boosting, but I'll get to it in 
the next post. 