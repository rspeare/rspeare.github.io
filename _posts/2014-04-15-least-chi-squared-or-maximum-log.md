---
layout: post
title: Least Chi-Squared -- or Maximum Log-Likelihood -- Estimation of Parameters
date: '2014-04-15T13:58:00.001-07:00'
author: Robert Speare
tags:
- Estimators
- Quals
- Statistics
- Bayes
modified_time: '2014-04-21T02:41:00.974-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-3361883703666438105
blogger_orig_url: http://rspeare.blogspot.com/2014/04/least-chi-squared-or-maximum-log.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Least Chi-Squared -- or 
Maximum Log-Likelihood -- Estimation of Parameters 

Let's say your given some data, a list of x and y values, which seem to be 
related by a model. One example is a perfect linear relation ship with some 
scatter, where 

\begin{eqnarray} 
y_i \approx m*x_i+b 
\end{eqnarray} 

Where $m$ is a best fit slope and $b$ a vertical offset. Since this is not a 
perfect relationship, we must introduce an error term into our model: 

\begin{eqnarray} 
y_i &amp;=&amp; m*x_i+b + e_i\\ 
y_i &amp;=&amp; f(x_i) + e_i \\ 
f(x) &amp;=&amp; mx+b 
\end{eqnarray} 

$f(x_i)$ in this instance, represents our model, or, our "perceived" 
relationship between $x$ and $y$ values. Another example is when the $y_i$ 
values are just centered around some single value -- i.e. a random variable. 
Then we have: 

\begin{eqnarray} 
y_i &amp;=&amp; f(x_i) + e_i \\ 
f(x) &amp;=&amp; \mu 
\end{eqnarray} 

For a random variable $Y$ centered about zero, we might say $f(x)=0$. This is 
STILL a model! 

But the point being, if we want to make a "best-guess" at the parameters 
within our model -- such as $m$ and $b$ above, or $\mu$ -- we are going to 
have to come up with some way of describing the error terms, $e_i$. 

A reasonable assumption is that those error terms are drawn from some 
Probability density; let's say a Gaussian. 

\begin{eqnarray} 
e_i &amp;\sim &amp; \frac{1}{\sqrt{2\pi \sigma^2}}e^{-\frac{e_i^2}{2\sigma^2}} 
\end{eqnarray} 

We can isolate the error term in the following way: we subtract our "output" 
value $y_i$ from the model $f(x_i)$, this results in, for a random variable 
centered about a true value $\mu$, $f(x)=\mu$: 

\begin{eqnarray} 
e_i &amp;=&amp; y_i - f(x_i) \\ 
P(y_i \vert \mu, \sigma^2) &amp;=&amp; \frac{1}{\sqrt{2\pi 
\sigma^2}}e^{-\frac{\left(y_i - f(x_i)\right)^2}{2\sigma^2}} 
\end{eqnarray} 

Now, this is the probability of a single data point-pair, $x_i,y_i$, assuming 
our model $f(x)$, and an error term that is described by this Gaussian 
distribution. If we were to count up all $N$ data point pairs, and calculate 
the probability of observing the whole set $D:{x_i}$, we would take the 
product of the individual probabilities: 

\begin{eqnarray} 
P(D| \mu, \sigma^2) &amp;=&amp; \Pi_i P(y_i \vert \mu, \sigma^2)\\ 
&amp;=&amp; (2\pi \sigma^2)^{-\frac{N}{2}} e^{-\sum_i \frac{\left(y_i - 
f(x_i)\right)^2}{2\sigma^2}} 
\end{eqnarray} 

Notice that this conditional probability has the same structure as our 
$P(D\vert H_i) $ term from Bayes Theorem, before. Our "hypothesis" in this 
case, is the mean and variance; or, the parameters of our model. We can 
construct posterior probability densities on those parameters in the usual 
way: 

\begin{eqnarray} 
P(H_i \vert D) &amp;=&amp; \frac{P(D \vert H_i)P(H_i)}{P(D)}\\ 
&amp;=&amp; \frac{P(D \vert H_i)P(H_i)}{\sum_i P(D \vert H_i)P(H_i)}\\ 
P(\mu, \sigma^2 \vert D) &amp;=&amp; \frac{P(D \vert \mu, \sigma^2)P(\mu, 
\sigma^2)}{\int \int P(D \vert \mu, \sigma^2)P(\mu, \sigma^2)d\mu d\sigma^2} 
\end{eqnarray} 

The denominator in these terms is simply a normalizing factor. If one wants to 
construct the posterior on a single parameter, say $\mu$, we merely perform 
what's called marginalization: 

\begin{eqnarray} 
P(\mu \vert D) &amp;=&amp; \int P(\mu, \sigma^2 \vert D) d\sigma^2 
\end{eqnarray} 

This equation reads "the probability of some mean $\mu$, given the data $D$, 
an array of x and y values". 

Ok, so why do we care? Well, in Bayes Theorem above, we implicitly used 
something called a Likelihood function, which is the Likelihood of seeing the 
data, given some model and its parameters: 
\begin{eqnarray} 
\mathcal{L}(D \vert \mu, \sigma^2)=P(D \vert \mu, \sigma^2) &amp;=&amp; (2\pi 
\sigma^2)^{-\frac{N}{2}} e^{-\sum_i \frac{\left(y_i - 
f(x_i)\right)^2}{2\sigma^2}} 
\end{eqnarray} 

Now the term in our exponential above can be simplified. Defining the $\chi^2$ 
statistic for our data: 

\begin{eqnarray} 
\chi^2 &amp;=&amp; \sum_i \frac{\left(y_i - f(x_i)\right)^2}{\sigma^2}\\ 
\mathcal{L}(D \vert \mu, \sigma^2)&amp;=&amp; (2\pi \sigma^2)^{-\frac{N}{2}} 
e^{-\frac{\chi^2}{2}} 
\end{eqnarray} 

Pretty cool right? So, maximizing Likelihood is minimizing $\chi^2$. We can 
take the log of this Likelihood function to write things in a more 
illuminating fashion: 

\begin{eqnarray} 
\log\left[\mathcal{L}(D \vert \mu, \sigma^2)\right]&amp;=&amp; 
-\frac{N}{2}\log (2\pi \sigma^2)-\frac{\chi^2}{2} 
\end{eqnarray} 

Taking the derivative with respect to $\mu$ and setting equal to zero yields 
are critical value of $\mu$ -- let's call it $\hat{\mu}$ -- that yields 
maximum Likelihood: 

\begin{eqnarray} 
\frac{\partial}{\partial \mu}\log\left[\mathcal{L}(D \vert \mu, 
\sigma^2)\right] &amp;=&amp;-\frac{\partial}{\partial \mu}\chi^2/2\\ 
0&amp;=&amp;\frac{\sum_i x_i - N\hat{\mu}}{\sigma^2}\\ 
\hat{\mu} &amp;=&amp; \sum_i \frac{x_i}{N} 
\end{eqnarray} 

our standard "average". This is our estimator of the mean. 

Now for an estimator of the variance -- or, in our older terms, the value of 
$\sigma$ for which Likelihood is maximized: 

\begin{eqnarray} 
\frac{\partial}{\partial \sigma}\log\left[\mathcal{L}(D \vert \mu, 
\sigma^2)\right] &amp;=&amp; 0\\ 
\frac{N}{\hat{\sigma}}&amp;=&amp;\frac{\sum_i (x_i-\mu)^2}{\hat{\sigma}^3}\\ 
\hat{\sigma^2} &amp;=&amp;\frac{\sum_i (x_i-\mu)^2}{N} 
\end{eqnarray} 

Interesting, our standard sum of squares. Notice however, that we've used our 
"true" mean $\mu$ in the above equation, not our estimator $\hat{\mu}$. In 
order to account for this, one can write 

\begin{eqnarray} 
\hat{\sigma^2} &amp;=&amp;\frac{\sum_i (x_i-\mu)^2}{N}\\ 
N\hat{\sigma^2} &amp;=&amp;\sum_i (x_i-\mu)^2\\ 
&amp;=&amp;\sum_i (x_i-\hat{\mu})^2+N(\hat{\mu}-\mu)^2\\ 
&amp;=&amp; Ns^2+N(\sum_i \frac{x_i}{N}-\mu)^2\\ 
N\hat{\sigma^2} &amp;=&amp; Ns^2+N(\sum_i \frac{(x_i-\mu)^2}{N^2}\\ 
N\hat{\sigma^2} &amp;=&amp; Ns^2+\hat{\sigma^2}\\ 
\frac{(N-1)}{N}\hat{\sigma^2} &amp;=&amp; s^2 
\end{eqnarray} 

Where we now have a new estimator for the variance, which requires no "true 
information": 
\begin{eqnarray} 
s^2&amp;=&amp; \frac{\sum_i (x_i-\hat{\mu})^2}{N} 
\end{eqnarray} 

If we want to best emulate the "true information estimator", we had best 
divide by $N-1$ instead of $N$. Another way to show this is that $s^2$ is a 
biased estimator: it's expectation value, or average over an infinite number 
of data sets, is not $\sigma^2$ but in fact: 

\begin{eqnarray} 
\langle s^2 \rangle &amp;=&amp; \frac{N}{N-1}\sigma^2 
\end{eqnarray} 

To review, let us write our Posterior distribution one more time: 

\begin{eqnarray} 
P(H_i \vert D) &amp;=&amp; \frac{P(D \vert H_i)P(H_i)}{\sum_i P(D \vert 
H_i)P(H_i)}\\ 
P(\mu, \sigma^2 \vert D) &amp;=&amp; \frac{\mathcal{L}(D \vert \mu, 
\sigma^2)P(\mu, \sigma^2)}{\int \int P(D \vert \mu, \sigma^2)P(\mu, 
\sigma^2)d\mu d\sigma^2}\\ 
P(\mu, \sigma^2 \vert D) &amp;=&amp; \frac{(2\pi \sigma^2)^{-\frac{N}{2}} 
e^{-\frac{\chi^2}{2}}P(\mu, \sigma^2)}{\int \int P(D \vert \mu, 
\sigma^2)P(\mu, \sigma^2)d\mu d\sigma^2} 
\end{eqnarray} 

The factor $P(\mu,\sigma^2)$ on the right hand side is called a prior, and 
determines our a priori information about the parameters $\mu$ and $\sigma^2$. 
What's nice about Bayes' construction is that the posterior from one data set 
can be used as the prior for another -- $D$ just goes into more initial 
information. (Perhaps we should've written the prior 

\begin{eqnarray} 
P(\mu,\sigma^2 \vert \mathrm{old\ dataset}) 
\end{eqnarray} 