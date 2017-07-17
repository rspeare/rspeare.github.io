---
layout: post
title: A note on Bid Price Optimization
date: '2017-05-21T15:23:00.001-07:00'
author: Robert Speare
tags: 
modified_time: '2017-05-21T15:24:13.985-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-594309840599106478
blogger_orig_url: http://rspeare.blogspot.com/2017/05/a-note-on-bid-price-optimization_30.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">After reading through 
quite a bit of literature -- or at least a weekend's worth -- on optimized 
pricing,  it seems as though the same ideas are being circulated, again and 
again and again. I know there are good resources out there in terms of pricing 
in high-volume environments, such as online advertising, but for the most 
part, in retail and macro "bidding", such as winning large contracts every few 
years or applying for an RFP, the thought process has remained the same: 
what's the probability of "winning" -- i.e. getting the bid -- at price point 
$x$, and what's the price at which we optimize the expected return. This can 
basically be described as: 

\begin{eqnarray} 
P(y \vert \vec{x} ) &amp;=&amp; \frac{1}{1+e^{-\beta \cdot \vec{x}}}\\ 
\mathrm{E}\left(x \right) &amp;=&amp; x P(y \vert x ) 
\end{eqnarray} 

Where, I"ve already modeled the "winning" probability as a logistic regression 
-- standard practice based on former papers. But, it's interesting to note 
that supply and demand curves have a very close connection here, and most 
often this function $p(y \vert x)$ needs to have some specific properties, 
such as: 


<ul style="text-align: left;">1. Be monotically decreasing in $x$ -- for non 
status-associated or "Giffen" goods. 
1. Approach zero as $x \to \infty$. 
1. Approach the total supply, call it $D$, as $x \to 0$. 


A nice way to formulate this is of course with a right-sided CDF. Integrating 
$p(y \vert x)$, what some people call a "willingness to pay'' function $w(x)$ 
we have: 

\begin{eqnarray} 
d(x) &amp;=&amp; D \int_x^\infty dx \ \ w(x) \\ 
d(x) &amp;=&amp; D p(y \vert  X \ge x) 
\end{eqnarray} 

So the ``demand'' at price point $x$ will now have some nice properties, such 
as being monotonically decreasing and most likely ``smooth'' due to 
integration. It's important to point out that when someone associates an 
``elasticity'' with a supply and demand curve, such as: 

\begin{eqnarray} 
d(x) &amp; \approx &amp; \alpha + \beta x 
\end{eqnarray} 

With $\beta &lt; 0$, what you're actually doing is imposing a constant 
``willingness'' to pay function, which is interesting because my ``risk'' of 
saying no to any deal -- much like any consumer -- is certainly not constant 
over all price points. 

Typical strategies for pricing a single customer i've read have : 

<ul style="text-align: left;">1. Fit a logistic function / regression to the 
right-sided CDF, $p(y \vert X \ge x)$. This results in a logistic, or more or 
less bell-shaped willingness-to-pay function $w(x)$, where there is a ``sweet 
spot'' for price with some variance. 
1. Fit a linear regression to the demand function, $d(x)$. Constant $w(x)$. 


Both methods work really well, since you can stratify by customer / bid-type, 
throw in extra variables for controls, etc., but why not expand the functional 
form? If the ``risk'' of drop out at all price points is non-uniform, why not 
use something that has ordered risk built into model, such as a weibull 
regression, or even an empirical kaplan meier estimator on price point $x$. 
(Particularly when you are worried about bumping price points on contracts to 
failure.) 