---
layout: post
title: Co-linearity (Part 2)
date: '2017-02-07T07:33:00.001-08:00'
author: Robert Speare
tags: 
modified_time: '2017-02-07T18:39:42.639-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-5564485600906432
blogger_orig_url: http://rspeare.blogspot.com/2017/02/co-linearity-part-2.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Last post was concerned 
with co-linearity in regression problems, and how one chooses to deal with it. 
The Normal equation was mentioned before: 

\begin{eqnarray} 
\mathbf{\beta}_d &amp;=&amp; \left(X_{nd}X_{nl} \right)^{-1} X_{ml} Y_m 
\end{eqnarray} 

and, we can also introduce the ``hat'' matrix: 

\begin{eqnarray} 
\hat{Y}_n &amp;=&amp; X_{nd} \mathbf{\beta}_d \\ 
&amp;=&amp; X_{nd} \left(X_{n^\prime d}X_{n^\prime l} \right)^{-1} X_{ml} Y_m 
\\ 
\mathbf{H}_{nm} &amp;=&amp; X_{nd} \left(X_{n^\prime d}X_{n^\prime l} 
\right)^{-1} X_{ml} \\ 
\hat{Y}_n &amp;=&amp; \mathbf{H}_{nm}Y_m 
\end{eqnarray} 

which, as you can see, puts the ``hat'' on our initial response observations, 
$y_m$. This smoothing matrix depends on an inversion, and as mentioned before 
most solvers will fail if the data matrix has too many features and not enough 
data points. But the way around this is through Bayesian methods. We'll start 
by noting that the likelihood from last post was the Likelihood of the data, 
given the model: 

\begin{eqnarray} 
P(X,Y \vert \mathbf{\beta}) 
\end{eqnarray} 

But, what if we'd like to write -- for some, more intuitively and accurately 
-- the likelihood of the model, given the data? This can be written as: 

\begin{eqnarray} 
P(\beta \vert X,Y) &amp;=&amp; \frac{P(X,Y \vert \mathbf{\beta}) 
P(\mathbf{\beta})}{P(X,Y)} 
\end{eqnarray} 

The second term on the numerator is something called a prior, and encodes our 
a priori beliefs on the values of $\mathbf{\beta}$ in our model. If we specify 
a Normal Prior, with some variance $s$, we get: 

\begin{eqnarray} 
P(\mathbf{\beta}) &amp;=&amp; \frac{1}{\sqrt{2\pi s^2}} e^{-\beta^2/2s^2} 
\end{eqnarray} 

The term $P(\mathbf{\beta} \vert X,Y)$ is called the posterior, and represents 
our ``new'' beliefs on the model after accounting for the data that we have 
seen. Now, taking the log of the Posterior instead of the log of the 
likelihood -- and ignoring the term in the denominator since it contains no 
dependence on $\beta$, we get: 

\begin{eqnarray} 
\mathcal{L}(\mathbf{\beta} \vert X,Y) &amp; = &amp; -\frac{N}{2} \log(2\pi 
\sigma^2) - \frac{(\beta_d X_{nd}-Y_n)^2}{ 2\sigma^2 } - \frac{1}{2} \log(2 
\pi s^2) - \frac{\beta_d \beta_d}{2s^2} + \mathcal{O}(X,Y) 
\end{eqnarray} 

Taking the gradient with respect to $\beta$ now, we get an extra term in our 
equations: 

\begin{eqnarray} 
\frac{\partial \mathcal{L}(\mathbf{\beta} \vert X,Y)}{\partial \beta_d} 
&amp;=&amp; \frac{(\beta_l X_{nl}-Y_n)}{ \sigma^2 } X_{nd} + 
\frac{\beta_d}{s^2} \\ 
\frac{X_{nd} Y_n}{\sigma^2} &amp;=&amp; \beta_l \left( 
\frac{X_{nl}X_{nd}}{\sigma^2} + \frac{\delta^K_{ld}}{s^2} \right) \\ 
X_{nd} Y_n&amp;=&amp; \beta_l \left( X_{nl}X_{nd} + \delta^K_{ld} 
\frac{\sigma^2}{s^2} \right) \\ 
\beta_l &amp;=&amp; \left( X_{nl}X_{nd} +  (\sigma/s)^2 \right)^{-1} X_{nd} 
Y_n 
\end{eqnarray} 

We see that we've just got an extra term in the inverted matrix -- namely the 
ratio of sample variance to prior variance -- which adds to the diagonal of 
the feature $l,d$ covariance estimate. What this does, practically speaking, 
is make the inverted matrix much more likely to be non-singular, and therefore 
resilient to have more features that datapoints, $D &gt; N$. 

As $s$ get's smaller, what we essentially do is put isotropic, downward 
pressure on the $\beta$ coefficients, pushing them down towards zero. This 
$L2$ norm or regularization on our model has lots of nice properties, and 
depending upon the strength of our prior, we can use it to protect against 
very ``ill-defined problems'', where $D &gt;&gt; N$. 

The standard name for the method is called ridge regression, and people 
continue to be unaware of its benefits, such as protecting against 
co-linearity, and getting a sense of what regression coefficients do over 
varying strengths of regularization -- called a regularization ``path''. 