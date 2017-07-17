---
layout: post
title: 'Estimating the Variance of the Survival Function: Full History vs. Snapshots'
date: '2016-07-16T04:20:00.001-07:00'
author: Robert Speare
tags: 
modified_time: '2016-07-29T06:40:05.600-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-3892931956429512104
blogger_orig_url: http://rspeare.blogspot.com/2016/07/estimating-variance-of-survival.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">In survival analysis, the 
key quantity of interest is something called the survival function, $S(t)$, 
which is the probability that I'm going to live, **at least** as long as I've 
lived already: 

\begin{eqnarray} 
S(t) &amp;=&amp; P(T \ge t) 
\end{eqnarray} 

along with something called the hazard function, which is the probability that 
I **die** today, at time $t$, given that I've lived up until now: 

\begin{eqnarray} 
\lambda(t) &amp;=&amp; P(T=t \vert T \ge t) = P(t)/S(t) 
\end{eqnarray} 

This hazard is a conditional probability, and comes about because survival 
analysis and survival-like problems are implicitly \textit{sequential}. 

When estimating $S(t)$ from data, one often uses the Kaplan Meier Estimator, 
which is a cumulative product of the number of people who ``died'' at time 
$t$, $d_t$, and the number of people who were ``alive'' at time $t$, $n_t$: 

\begin{eqnarray} 
\hat{S}(t) &amp;=&amp; \prod_{t^\prime &lt; t} \left(1- 
\frac{d_{t^\prime}}{n_{t^\prime}}\right) 
\end{eqnarray} 

This is actually just a cumulative product of time-step survival 
probabilities, or one minus the hazard: 
\begin{eqnarray} 
\hat{S}(t) &amp;=&amp; \prod_{t^\prime &lt; t} \left(1- \lambda_{t^\prime} 
\right)\\ 
&amp;=&amp;  \prod_{t^\prime &lt; t} p_{t^\prime} 
\end{eqnarray} 

If we were to ask ourselves, ``what's the variance of this estimator?'', we'd 
have to use some fancy tricks. The first of which is noticing that we don't 
have good ways of combining variances in a \textbf{product}, but we do have 
good ways of combining variance for \textbf{sums}. So let's take the log 
transform of our estimator: 

\begin{eqnarray} 
\log\left(\hat{S}(t)\right) &amp;=&amp; \sum_{t^\prime &lt; t} \log \left(1- 
\lambda_{t^\prime} \right)\\ 
&amp;=&amp;  \sum_{t^\prime &lt; t} \log(p_{t^\prime}) 
\end{eqnarray} 

And note that, the variance of the log can be computed by a simple taylor 
expandsion of a random variable about its mean: 

\begin{eqnarray} 
X &amp; \sim &amp; ? \\ 
\langle X \rangle &amp;=&amp; \mu \\ 
\mathbf{Var}(X) &amp;=&amp; \sigma^2 \\ 
\log(X) &amp;\approx &amp; \mu + \frac{X-\mu}{\mu}+O((X-\mu)^2)+\dots\\ 
\mathbf{Var}\left(\log(X)\right)  &amp;=&amp; 0 + 
\frac{\mathbf{Var}(X)}{\mu^2}\\ 
&amp;=&amp; \frac{\sigma^2}{\mu^2} 
\end{eqnarray} 

So we have: 

\begin{eqnarray} 
\log\left(\hat{S}(t)\right) &amp;=&amp; \sum_{t^\prime &lt; t} \log \left(1- 
\lambda_{t^\prime} \right)\\ 
&amp;=&amp;  \sum_{t^\prime &lt; t} \log(p_{t^\prime}) = 
\frac{1}{\hat{S}(t)^2} \mathbf{Var}(\hat{S}(t)) 
\end{eqnarray} 

Using this transform on our formula above, we have 

\begin{eqnarray} 
\mathbf{Var}\left(\hat{S}(t) \right) &amp;=&amp; \hat{S}(t)^2  
\mathrm{Var}\left(\sum_{t^\prime &lt; t} \log(p_{t^\prime})\right) 
\end{eqnarray} 
Luckily, if we assume independence, the variance of the sum is the sum of the 
variances, so we can treat each $p_t$ as an independent binomial draw, with 
variance $p_t(1-p_t)/n_t$, where $n_t$ is the ``sample size'' of our survival 
curve at time $t$. 

Working through some nasty algebra, and another use of the variance of the log 
identity we get: 

\begin{eqnarray} 
\mathbf{Var}\left(\hat{S}(t) \right) &amp;=&amp; \hat{S}(t)^2  \sum_{t^\prime 
&lt; t} \mathrm{Var}\left( \log(p_{t^\prime})\right) \\ 
&amp;=&amp; \hat{S}(t)^2  \sum_{t^\prime &lt; t} 
\frac{1}{p_{t^\prime}^2}\mathrm{Var}\left( p_{t^\prime}\right)\\ 
&amp;=&amp; \hat{S}(t)^2 \sum_{t^\prime &lt; t} 
\frac{p_{t^\prime}}{n_{t^\prime}(1-p_{t^\prime})} 
\end{eqnarray} 

We see that variance of the estimator goes like the cumulative sum of one over 
the sample size at each time $t$: 

\begin{eqnarray} 
\mathbf{Var}\left(\hat{S}(t)\right) &amp;\sim &amp; \sum_{t^\prime &lt; t}  
\frac{1}{n_{t^\prime}} 
\end{eqnarray} 

Now, when dealing with very large data, say billions of survival events, it 
can be difficult to get these death counts as a function of time, due to a few 
implementation details, and the resistance of cumulative sums to 
parallelization. So, what people often do, is the estimate the survival curve 
at multiple snapshots, $M$, and then take the average of the snapshot 
estimates: 
\begin{eqnarray} 
\hat{S}_M(t) &amp;=&amp; \sum_{m=1}^M \frac{\hat{S}_m(t)}{M} \\ 
&amp;=&amp; \sum_{m=1}^M \frac{\prod_{t^\prime &lt; t} 
\left(1-\lambda_{mt^\prime} \right)}{M} 
\end{eqnarray} 

This estimator will have the same mean as our ``full history'' estimator, but 
slightly different variance properties. As we know, the variance of a mean 
goes like one over the sample size: 

\begin{eqnarray} 
\mathbf{Var}\left(S_M(t) \right) &amp;=&amp; 
\frac{1}{M}\mathbf{Var}\left(S_m(t) \right) 
\end{eqnarray} 

But what's the variance of each snapshot estimate? Simply our old formula, 
with the population count $n_{mt}$ instead of $n_t$. Or, in english, the 
number of people who were ``alive'' at time $t$ in snapshot $m$, rather than 
the total number of people who were alive at time $t$. Strictly, $n_{mt} &lt; 
n_t$. If we assume our snapshots are evenly populated with ``alive'' people at 
each time $t$, we will have $n_{mt}M \approx n_t$. 

And so, comparing the variance of our estimators, we see: 

\begin{eqnarray} 
\mathbf{Var}\left(S(t) \right) &amp;=&amp; \hat{S}(t)^2 \sum_{t^\prime &lt; t} 
\frac{p_{t^\prime}}{n_{t^\prime}(1-p_{t^\prime})} \\ 
\mathbf{Var}\left(S_M(t) \right) &amp;=&amp; \frac{1}{M}\hat{S}_M(t)^2 
\sum_{t^\prime &lt; t} \frac{p_{mt^\prime}}{n_{mt^\prime}(1-p_{mt^\prime})} 
\end{eqnarray} 

Taking the ratio of the variances, we get, since the means are equal 
$(\hat{S}(t)^2=\hat{S}_M(t)^2)$: 

\begin{eqnarray} 
\frac{\mathbf{Var}\left(S_M(t) \right)}{\mathbf{Var}\left(S(t) \right)} 
&amp;=&amp;  \frac{\sum_{t^\prime &lt; t} 
\frac{p_{mt^\prime}}{n_{mt^\prime}(1-p_{mt^\prime})}}{\sum_{t^\prime &lt; t} 
\frac{p_{t^\prime}}{n_{t^\prime}(1-p_{t^\prime})}} 
\end{eqnarray} 

Assuming equal sample size across snapshots, we can make the replacement, 
$n_{mt} = n_t/M$: 

\begin{eqnarray} 
\frac{\mathbf{Var}\left(S_M(t) \right)}{\mathbf{Var}\left(S(t) \right)} 
&amp;\approx &amp; \frac{\sum_{t^\prime &lt; t} 
\frac{p_{mt^\prime}}{n_{t^\prime}(1-p_{mt^\prime})}}{\sum_{t^\prime &lt; t} 
\frac{p_{t^\prime}}{n_{t^\prime}(1-p_{t^\prime})}} 
\end{eqnarray} 

And, assuming the $p_{mt} \approx p_t \forall t$, we get the very simple 
ratio: 

\begin{eqnarray} 
\frac{\mathbf{Var}\left(S_M(t) \right)}{\mathbf{Var}\left(S(t) \right)} 
&amp;\approx &amp; 1 
\end{eqnarray} 

How well does this mean we're doing? Well, it means that the variances of both 
methods are comparable. Which is surprising! If we want to probe deeper, and 
understand whether or not there is a difference between the two sampling 
strategies, we would have to closely inspect the cumulative sum: 

\begin{eqnarray} 
\sum_{t^\prime &lt; t} \frac{p_{mt^\prime}}{n_{mt^\prime}(1-p_{mt^\prime})} 
\end{eqnarray} 