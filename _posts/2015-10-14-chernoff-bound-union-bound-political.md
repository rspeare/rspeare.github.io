---
layout: post
title: Chernoff Bound, Union Bound, Political Polling and Base rate estimation
date: '2015-10-14T12:23:00.000-07:00'
author: Robert Speare
tags:
- Polling
- Estimators
- Chernoff
- cumulants
- Machine Learning
- Statistics
modified_time: '2015-10-14T12:31:33.584-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-5863831646773169945
blogger_orig_url: http://rspeare.blogspot.com/2015/10/chernoff-bound-union-bound-political.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"> 
Let's say we are trying to estimate the base rates of some classes $C=\lbrace 
1,2,3 \dots K \rbrace$. After polling $N$ people, each of which will elect one 
of theses classes, how confident are we in our results, $P(c)$? The first step 
to answering this question is to simplify the problem and treat it as a 
sequence of binomials. 

Let us at first restrict ourself to two classes. $c=1$ means ``no'' or 
``Democrat'' and $c=0$ means ``yes'', or ``Republican''. If weuse a bernouli 
random variable $X=0,1$ to represent a single ``vote'' we get 

\begin{eqnarray} 
P(X \vert p ) &amp;=&amp; p^{I_{x=1}}(1-p)^{I_{x \ne 1}}\\ 
q &amp;=&amp; 1-p 
\end{eqnarray} 

Where $I$ is the indicator function. The expectation of this distribution is: 

\begin{eqnarray} 
\langle X \rangle &amp;=&amp; p \\ 
\langle X^2 \rangle_c = \mathrm{Var}(X)&amp;=&amp; pq 
\end{eqnarray} 

Given these first two cumulants, we can write the Markov bound: 

\begin{eqnarray} 
P(X &gt; a) &amp; \le &amp; \frac{\langle X \rangle}{a}\\ 
 \le &amp; \frac{p}{a} 
\end{eqnarray} 

and the improved Chebyshev bound: 

\begin{eqnarray} 
P( \vert X-p \vert \ge mpq) &amp; \le &amp; \frac{pq}{mpq}=\frac{1}{m} 
\end{eqnarray} 

Similarly, for a binomial random variable, a sequence of votes: 

\begin{eqnarray} 
X_N &amp;=&amp; \sum_{i=1}^N X_i \\ 
X_N &amp; \sim &amp; \left(\begin{array}{c} 
N \\ 
X_N 
\end{array}\right) p^{X_N}(1-p)^{X_N} 
\end{eqnarray} 

we get expectation and variance 

\begin{eqnarray} 
\langle X_N \rangle &amp;=&amp; Np \\ 
\langle X_N^2 \rangle_c = \mathrm{Var}(X)&amp;=&amp; Npq 
\end{eqnarray} 

So our bound becomes 

\begin{eqnarray} 
P(\vert X_N-Np \vert \ge mNpq) \le \frac{1}{m} 
\end{eqnarray} 

But that seems repetitive. Let's define a new statistic, the estimator of the 
mean: 

\begin{eqnarray} 
\hat{\mu}_N &amp;=&amp; \frac{X_N}{N} = \frac{\sum_{i=1}^N}{N} \\ 
\langle \hat{\mu}_N \rangle &amp;=&amp; p \\ 
\langle \hat{\mu}_N^2 \rangle &amp;=&amp; \frac{pq}{N} 
\end{eqnarray} 

Now we have an inequality that scales with the number of votes, or the survey 
size, $N$: 

\begin{eqnarray} 
P(\vert \frac{X_N}{N}-p \vert \ge a ) \le \frac{pq}{Na^2} 
\end{eqnarray} 

More generally the estimator of any mean, can be written 

\begin{eqnarray} 
P(\vert \frac{X_N}{N}-\mu \vert \ge \epsilon) &amp;=&amp; \frac{\sigma^2}{N 
\epsilon^2} 
\end{eqnarray} 

So, we can now make a few helpful statements. Our confidence that the 
estimator of the mean is within plus or minus $\epsilon$ of the true value is 
precisely $1-P(\vert \frac{X_N}{N}-\mu \vert \ge \epsilon)$, for a ``survey'' 
of $N$ participants. So let's see how accuracy $\epsilon$ scales with survey 
size and confidence. Writing confidence as: 

\begin{eqnarray} 
\mathrm{confidence}=1-\delta &amp;=&amp; 1-P(\vert \frac{X_N}{N}-\mu \vert \ge 
\epsilon)\\ 
\delta &amp;\le &amp; \frac{\sigma^2}{N\epsilon^2}\\ 
\epsilon &amp;\le &amp; \frac{\sigma}{\sqrt{N \delta}} 
\end{eqnarray} 

So we that accuracy scales like one over square root survey size, and that if 
we want to be twice as confident with a given accuracy, we'd better poll twice 
as many people. Sometimes in the real world, this implies a cost -- at least 
in terms of time! -- and so we'd like to do even better, if at all possible. 

It turns out we can do much, much better by using something called the 
Chernoff Bound, which assumes not only pair-wise independence between our 
random votes $X_i$ -- as we assumed by writing 
$\mathrm{Var}(\frac{X_N}{N})=\frac{\sigma^2}{N}$ -- but independence across 
all the variables, for all possible combinations. 

How do we do this? Re-write the markov bound with some free parameter: 

\begin{eqnarray} 
P(x \ge a ) &amp;=&amp; P(e^{sx} \ge e^{as}) \le \frac{\langle e^{sx}\rangle 
}{e^{sa}} 
\end{eqnarray} 

We see that the numerator is simply the moment generating function, evaluated 
at $s$. If we want to swap the inequality, we just send $s \to -s$: 
\begin{eqnarray} 
P(x \le a ) &amp;=&amp; P(e^{-sx} \ge e^{-as}) \le \frac{\langle e^{-sx} 
\rangle}{e^{-sa}} 
\end{eqnarray} 

For our bernouli distribution on a single ``vote'', we have: 

\begin{eqnarray} 
M(s)=\langle e^{sX_1} \rangle &amp;=&amp; \sum_{X} e^{sX} P(X) \\ 
&amp;=&amp; e^sp+1-p \\ 
M(s)&amp;=&amp; p(e^s-1)+1 
\end{eqnarray} 

Now, if we write down the moment generating function of the sum, we find, if 
the $X_i$'s are all independent: 
\begin{eqnarray} 
\langle e^{s X_N} \rangle &amp;=&amp; e^{s \sum_{i} X_i} \\ 
&amp;=&amp; \langle \prod_{i=1}^N e^{s X_i} \rangle \\ 
M_N(s) &amp;=&amp; M(s)^N \\ 
&amp;=&amp; \left(1+p(e^{s_N}-1)\right)^N 
\end{eqnarray} 

Recall that we want to bound the probability of our random variables $X_N$ 
being outside some range, so we want to minimize the right handside of this 
equation: 

\begin{eqnarray} 
P(X_N \ge a) &amp;=&amp; M_N(s)e^{-sa} 
\end{eqnarray} 

Minimizing this equation is the same is minimizing the log, since both sides 
are positive definite: 

\begin{eqnarray} 
\log P(X_N \ge a) &amp;=&amp; N \log \left(1+p(e^{s_N}-1)\right)-sa 
\end{eqnarray} 

Taking the derivative with respect to $s$ and setting things equal to zero, we 
get: 

\begin{eqnarray} 
s&amp;=&amp;\log \left(\frac{a}{Np} \right) 
\end{eqnarray} 

Which, for arbitary mean, is the same thing as saying 

\begin{eqnarray} 
s&amp;=&amp;\log \left(\frac{a}{\mu} \right) 
\end{eqnarray} 

So now let's choose $a=\mu(1+\theta)$, so that $\theta$ is our fractional 
accuracy relative to the variable and $s=\log(1+\delta)$. Putting this into 
our equation gives: 

\begin{eqnarray} 
\log P(X \ge \mu(1+\theta)  &amp;\le &amp; \mu\left(\theta- (1+\theta)\log 
(1+\theta) \right) \\ 
P(X \ge \mu(1+\theta) &amp;\le &amp; 
\left(\frac{e^{\theta}}{(1+\theta)^{1+\theta}} \right)^\mu 
\end{eqnarray} 

But, we could have taylor expanded the logarithm above, to get: 

\begin{eqnarray*} 
\log P(X \ge \mu(1+\theta)  &amp;\le &amp; \mu\left(\theta- (1+\theta)\log 
(1+\theta) \right) 
\le \mu( - \theta^2/3 )\\ 
P(X \ge \mu(1+\theta) &amp;\le &amp;e^{-\theta^2 \mu/3} 
\end{eqnarray*} 

So this is the upper bound. What about the lower? We just send $s \to -s$ to 
get 

\begin{eqnarray} 
P(X \le \mu(1-\theta) &amp; \le &amp;  e^{-\theta^2 \mu/2} 
\end{eqnarray} 

So the lower bound, with the same taylor expansion, does slightly better! We 
can now make a double sided bound: 

\begin{eqnarray} 
P( \vert X-\mu \vert \ge \mu \theta ) &amp;\le &amp; 2e^{-\theta^2 \mu/3} 
\end{eqnarray} 

If we specify, once again $1-\delta =1-P( \vert X-\mu \vert \ge \mu \theta ) $ 
as our survey confidence, we can write 
 \begin{eqnarray*} 
 P( \vert X_N-pN \vert \ge Np \theta ) &amp;\le &amp; 2e^{-\theta^2 Np/3} 
 \end{eqnarray*} 

 Let $\theta=\frac{\epsilon}{p}$ 

 \begin{eqnarray} 
  P( \vert X_N-pN \vert \ge N\epsilon )= P( \vert \frac{X_N}{N}-p \vert \ge 
\epsilon )&amp;\le&amp; 2e^{-\frac{N\epsilon^2}{3p}} 
  \end{eqnarray} 

  Now for a few tricks, 

  \begin{eqnarray} 
  \delta &amp;=&amp; P( \vert \frac{X_N}{N}-p \vert \ge \epsilon ) \\ 
\delta &amp;\le  &amp;  2e^{-\frac{N\epsilon^2}{3p}}\le 
2e^{-\frac{N\epsilon^2}{3}}\\ 
e^{N\epsilon^2/3}&amp;\ge &amp; \frac{2}{\delta} \\ 
N &amp;\ge &amp;\frac{3}{\epsilon^2} \log (\frac{2}{\delta}) 
 \end{eqnarray} 

 This result is known as the sampling theorem. In order to constrain our 
underlying ``base rate'' to $p = X_N/N \pm \epsilon$ with confidence 
$1-\delta$, we need to poll AT LEAST $N$ people. This is an extremely useful 
result, and has much better scaling properties than the Chebyshev bound, which 
would suggest: 

 \begin{eqnarray} 
 N &amp; \ge &amp; \frac{1}{\delta}\frac{\sigma^2}{\epsilon^2} 
 \end{eqnarray} 

 We see that we pay just as heavily for accuracy $\epsilon$ but much more 
heavily for confidence $\delta$. We would like to make $\delta$ as small as 
possible, and so if we taylor expand both expressions, and call $R=1-\delta$ 
confidence, we find: 

 \begin{eqnarray} 
\mathrm{Chebyshev:}\ \ N &amp;\sim&amp; 3R \frac{1}{\epsilon^2 } \\\ 
\mathrm{Chernoff:}\ \ N &amp;\sim &amp; 3\log(2R) \frac{1}{\epsilon^2 } 
 \end{eqnarray} 

The latter  CH is superior -- logarithmic scaling in confidence rather than 
linear! 

Such considerations are important, because often we are interested in 
constraining the maximum error of many different random variables -- say, $K$ 
class base rates, $P(c)=p_c$ -- with the same accuracy $\epsilon$. This can be 
accomplished by the union bound: 

\begin{eqnarray} 
P( X_1\cup X_2 \cup X_3 \cdots X_N) &amp; \le &amp; \sum_{i=1}^N P(X_i) 
\end{eqnarray} 

So that, if we want to write the probability that any of our mean base rate 
estimates, for some ``poll'' with $K$ possibilities is incorrect by a factor 
greater than $\epsilon$, we can write: 

\begin{eqnarray*} 
P( \vert \hat{\mu}_{N_1}-p_1 \vert \ge \epsilon \cup \vert \hat{\mu}_{N_2}-p_2 
\vert \ge \epsilon \cup \dots \vert \hat{\mu}_{N_K}-p_K \vert \ge \epsilon ) 
&amp; \le &amp; \sum_{c=1}^K P(\vert \hat{\mu}_{N_c}-p_c \vert \ge \epsilon)\\ 
\delta &amp;\le &amp;  \sum_{c=1}^K \delta_c 
\end{eqnarray*} 

Assuming the same confidence for every independent class bound, we get: 

\begin{eqnarray} 
\delta &amp;\le &amp;  \sum_{c=1}^K \delta_c \le 2Ke^{-\theta^2 \mu/3} 
\end{eqnarray} 

which implies: 

\begin{eqnarray} 
N &amp; \ge &amp; \frac{3}{\epsilon^2}\log(\frac{2K}{\delta}) 
\end{eqnarray} 

So to bound the maximum of $K$ different statistics, or base rates with the 
same accuracy $\epsilon$, with some confidence $\delta$, we essentially send 
$\delta \to K \delta$ from a single binomial test; and, since the Chernoff 
scales logarithmically, this is not such a big deal! 