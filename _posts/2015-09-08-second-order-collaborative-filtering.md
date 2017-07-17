---
layout: post
title: 'Second Order Collaborative Filtering: Playing with latent feature dimension'
date: '2015-09-08T08:27:00.000-07:00'
author: Robert Speare
tags:
- Collaborative Filtering
- non negative matrix factorization
- sparse auto-encoding
- Machine Learning
- Bayes
- cumulants. statistics
modified_time: '2015-10-19T10:46:53.701-07:00'
thumbnail: http://2.bp.blogspot.com/-F8wJIz0Ay_s/Ve79h0oHcFI/AAAAAAAACP8/7FuWoJ1-890/s72-c/Screenshot%2B2015-09-07%2B19.17.47.png
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-1519405523512100853
blogger_orig_url: http://rspeare.blogspot.com/2015/09/second-order-collaborative-filtering.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">So, after playing around 
with things, I find -- unsurprisingly, since the winner of the Netflix contest 
used a very high-dimensional representation of feature vectors $\vec{x} \in 
\mathcal{R}^D$, $D \approx 1000$ -- that increasing the dimension of the 
feature vectors improves training fit substantially. Even with a fairly high 
regularization parameter of $\lambda = 1$ from the last post, I get the 
following results for $D=200$: 

<div class="separator" style="clear: both; text-align: center;">[<img 
border="0" height="189" 
src="http://2.bp.blogspot.com/-F8wJIz0Ay_s/Ve79h0oHcFI/AAAAAAAACP8/7FuWoJ1-890/s320/Screenshot%2B2015-09-07%2B19.17.47.png" 
width="320" 
/>](http://2.bp.blogspot.com/-F8wJIz0Ay_s/Ve79h0oHcFI/AAAAAAAACP8/7FuWoJ1-890/s1600/Screenshot%2B2015-09-07%2B19.17.47.png)As 
you can see, we get a much tighter regression fit on the given ratings matrix, 
$Y_{ij}$ at the cost of extra computation. Inverting the Hessian of the Cost 
function -- which turns out to be only $D \times D$, thank goodness, due to 
diagonality in other degrees of freedom -- takes a great deal of time for high 
dimension $D$, so we are left with a trade off between goodness of fit and 
computation time. 

This algorithm has been a second order "batch" gradient descent, taking in all 
the data at once. It will be interesting to see how things can be made 
incremental, or "online", so that data is taken in bit by bit, and our 
matrices $\mathbf{X}_{il}$, $\mathbf{\theta}_{jl}$ are updated bit by bit. 