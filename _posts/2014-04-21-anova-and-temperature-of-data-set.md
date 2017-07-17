---
layout: post
title: ANOVA and the "Temperature" of a data set
date: '2014-04-21T02:42:00.000-07:00'
author: Robert Speare
tags:
- Information Theory
- Quals
- Partition Function
- Posterior
- Statistics
- Bayes
modified_time: '2014-04-22T00:50:09.357-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-3883814646658951355
blogger_orig_url: http://rspeare.blogspot.com/2014/04/anova-and-temperature-of-data-set.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Typically, with analysis 
of variance, one chooses to weight all data points -- or deviations from our 
model -- equally in the chi-squared statistic, assuming 

\begin{eqnarray} 
\chi^2 &amp;=&amp; \sum_i^N \frac{(x_i-f(x_i))^2}{2\sigma^2_i}\\ 
\sigma_i &amp;=&amp; \sigma \ \ \forall, i 
\end{eqnarray} 

Which yields a very simple posterior distribution: 

\begin{eqnarray} 
P(\mu, \sigma^2 \vert D) &amp;=&amp; \frac{\left(2\pi 
\sigma^2\right)^{-N/2}e^{-\chi^2/2}P(\mu,\sigma^2)}{Z} 
\end{eqnarray} 

Where Z is our awful, marginalized normalizing factor from before. We can 
write our posterior distribution much like the partition function of an 
Bose-Einstein ensemble, and associate our chi-squared statistic -- or 
deviation from our model f(x) -- with an 'Energy': 
\begin{eqnarray} 
P(\mu, \sigma^2 \vert D) &amp;=&amp; \frac{e^{-\beta E(\mu,\sigma^2)}}{Z} \\ 
Z &amp;=&amp; \int \int e^{-\beta E(\mu,\sigma^2)} d\mu d\sigma^2 \\ 
\beta E(\mu,\sigma^2) &amp;=&amp; \sum_i^N \frac{(x_i-f(x_i))^2}{2\sigma^2} 
\end{eqnarray} 

In this case the variance of each and every data point y_i -- the denominator 
in our chi-squared expression above -- acts much like the "temperature" of our 
distribution. We can make things even clearer by putting in the chemical 
potential, or the energy associated with adding/replacing a member of our 
dataset: 

\begin{eqnarray} 
\mu_c &amp;=&amp; \mathrm{chemical}\ \ \mathrm{potential}\\ 
P(\mu, \sigma^2 \vert D) &amp;=&amp; \frac{e^{N\beta\mu_c-\beta E)}}{Z} \\ 
\beta \mu_c &amp;=&amp; \log\left(\frac{1}{\sqrt{2\pi \sigma^2}} \right) 
\end{eqnarray} 

Which manifests itself as our extra normalizing factor for adding an extra 
data point. Exactly like our chemical potential mu's function in the bose 
einstein distribution! (Pardon the repetition of mu). 