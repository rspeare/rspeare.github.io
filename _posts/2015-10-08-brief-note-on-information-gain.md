---
layout: post
title: 'Brief Note on Information Gain Definition '
date: '2015-10-08T10:20:00.000-07:00'
author: Robert Speare
tags:
- Maximum Entropy
- Correlation Coefficient
- entropy
- Statistics
modified_time: '2015-10-16T07:51:47.639-07:00'
thumbnail: http://2.bp.blogspot.com/-tIxn9qOI4Kg/VhantUnUgLI/AAAAAAAACQs/q2fNffiB1zI/s72-c/Screenshot%2B2015-10-08%2B13.28.03.png
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-2524713883195830925
blogger_orig_url: http://rspeare.blogspot.com/2015/10/brief-note-on-information-gain.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">After being confused for 
quite some time, I've realized that information gain and mutual information 
gain are essentially the same thing, yet the first one is not symmetric. 
Mutual information as an intuitive measure of correlation can be displayed by 
noting that for a bivariate normal distribution, the mutual information 
between the two variables is: 

\begin{eqnarray} 
I(x,y) &amp;=&amp; IG(x \vert y) \\ 
&amp;=&amp; H(x)-H(x \vert y) \\ 
&amp;\sim &amp;  -\frac{1}{2}\log(1-\rho^2) 
\end{eqnarray} 

<div class="separator" style="clear: both; text-align: center;">[<img 
border="0" height="201" 
src="http://2.bp.blogspot.com/-tIxn9qOI4Kg/VhantUnUgLI/AAAAAAAACQs/q2fNffiB1zI/s320/Screenshot%2B2015-10-08%2B13.28.03.png" 
width="320" 
/>](http://2.bp.blogspot.com/-tIxn9qOI4Kg/VhantUnUgLI/AAAAAAAACQs/q2fNffiB1zI/s1600/Screenshot%2B2015-10-08%2B13.28.03.png) 

Where $\rho$ is the Pearson correlation, varying between zero and one. So, 
when choosing to split on variables in a decision tree, or designing an 
experiment that probes some underlying model space, we obviously want to 
choose pairs $x,y$ that have $\rho \to 1$, in order to yield as much 
information as possible. 