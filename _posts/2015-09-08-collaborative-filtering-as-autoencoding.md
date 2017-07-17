---
layout: post
title: Collaborative Filtering as AutoEncoding
date: '2015-09-08T19:47:00.000-07:00'
author: Robert Speare
tags:
- deep learning
- non negative matrix factorization
- sparse auto-encoding
- Machine Learning
modified_time: '2015-10-16T07:53:16.375-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-7255833035770827233
blogger_orig_url: http://rspeare.blogspot.com/2015/09/collaborative-filtering-as-autoencoding.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">After doing some reading 
it seems Collaborative Filtering, or the process of minimizing the distance 
$Y_{ij}-\mathbf{\Theta}_{jl}\mathbf{X}_{il}$ by alternately fitting for 
$\mathbf{\Theta}_{jl}$ and $\mathbf{X}_{il}$ is the same as sparse 
autoencoding, or using a restricted Boltzman machine. Will have more to say 
about this, in particular regarding Lasso -- L1 regularization -- regression 
and non-negative matrix factorization 