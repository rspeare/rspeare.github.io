---
layout: post
title: The Student t- distribution
date: '2014-05-22T02:33:00.001-07:00'
author: Robert Speare
tags:
- Bayes
- cumulants. statistics
modified_time: '2015-10-16T07:57:01.947-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-5807577544113581085
blogger_orig_url: http://rspeare.blogspot.com/2014/05/the-student-t-distribution.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Let's say we are given 
some data, a series of scalar values x_i with subscript 1 to n. The student 
t-statistic is defined as 

\begin{eqnarray} 
t=\frac{\bar{x}-\mu}{\sqrt{s^2/n}} 
\end{eqnarray} 

Now we can write $s^2$ as our unbiased estimator for the variance, 

\begin{eqnarray} 
s^2 &amp;=&amp; \sum_i^N \frac{(x_i-\bar{x})^2}{N-1} 
\end{eqnarray} 

Let's play with the t statistic representation a little more, 

\begin{eqnarray} 
t=\frac{(\frac{\bar{x}-\mu}{\sigma})\sqrt{n}}{\sqrt{\frac{s^2}{\sigma^2}}} 
\end{eqnarray} 

We can now see that the numerator is a random variable with Expectation value 
0, and if we think about things a little bit, assuming that each and every 
data point is drawn from a Gaussian distribution: 

\begin{eqnarray} 
x_i \sim N(\mu,\sigma) 
\end{eqnarray} 
Then the addition of all of our x_i's -- in order to create the mean -- will 
be a convolution of all of our Gaussians, and thus an addition of our second 
cumulants, the variance: 

\begin{eqnarray} 
n\bar(x)=\sum_i^n x_i \sim N(\mu,\sigma) \star N(\mu,\sigma) \star 
N(\mu,\sigma) \cdots &amp;=&amp; N(n\mu,\sqrt{n}\sigma) 
\end{eqnarray} 

This is of course the same idea as the width of a random walker, we see that 
with n steps, the variance of our end Probability density goes like the square 
of n. Now subtracting the mean is just centering our PDF: 

\begin{eqnarray} 
\bar{x}-\mu=\sum_i^n \frac{x_i-\mu}{n} &amp;\sim&amp; N(0,\sqrt{n}\sigma) 
\end{eqnarray} 
And so we find, if we scale by our theoretical variance, the random variable 
in the numerator is determined by a particularly tractable normal 
distribution, with variance n 

\begin{eqnarray} 
X=\frac{(\bar{x}-\mu)\sqrt{n}}{\sigma}&amp;\sim&amp; N(0,n) 
\end{eqnarray} 

Now for the denominator. Without the square root sign we have: 

\begin{eqnarray} 
\frac{s^2}{\sigma^2}&amp;=&amp; \sum_i^n \frac{(x_i-\mu)^2}{(n-1)\sigma^2} 
\end{eqnarray} 

And we can see immediately this will be the sum of the square of our former 
variables, 

\begin{eqnarray} 
x_i-\mu &amp;\sim&amp; N(0,\sigma) \\ 
\frac{x_i-\mu}{\sigma} &amp;\sim&amp; N(0,1)\\ 
\frac{(x_i-\mu)^2}{\sigma^2} &amp;\sim&amp; 
\frac{N(0,1)(x^2)}{x}=g_{1/2,1/2}(x^2)\\ 
\frac{(x_i-\bar{x})^2}{(n-1)\sigma^2} &amp;\sim&amp; 
\frac{N(0,1)(x^2)}{x}=g_{1/2,1/2}(x^2) 
\end{eqnarray} 

Where the final PDF written is the standard Gamma density 
\begin{eqnarray} 
N(0,1) &amp;=&amp; \frac{1}{\sqrt{2\pi}}e^{-x^2/2}\\ 
g_{\alpha,\nu}(x)&amp;=&amp; \frac{1}{\Gamma(\nu)}\alpha^\nu 
x^{\nu-1}e^{-\alpha x}\\ 
g_{1/2,1/2}(x^2) &amp;=&amp; 
\frac{1}{\sqrt{2\pi}}(x^2)^{-1/2}e^{-\frac{x^2}{2}} 
\end{eqnarray} 

Which is the required PDF for the square of our Gaussian random variable, with 
unit variance. Now in order to convert to the square root of denominator 
variable, let's call it y, we need to multiply by a certain factor: 

\begin{eqnarray} 
\frac{(x_i-\bar{x})^2}{(n-1)\sigma^2}=\frac{s^2}{\sigma^2} &amp;\sim &amp; 
g_{1/2,n/2}(x^2) \\ 
Y=\sqrt{\frac{s^2}{\sigma^2}} &amp;\sim &amp; 2Y g_{1/2,n/2}(Y^2) 
\end{eqnarray} 

And so we see that 

\begin{eqnarray} 
T=\frac{X}{Y} 
\end{eqnarray} 
where x,y each have their own probability density functions. The best way to 
combine these pdf's is to to write constrain X and then integrate over all 
possible values of Y. For example the cumulative distribution function for t 
should be: 

\begin{eqnarray} 
X &amp;\sim &amp; f\\ 
Y &amp;\sim &amp; g\\ 
T &amp;\sim &amp; P(t)\\ 
\Phi(t)=P(T \leq t)&amp;=&amp; \int_0^t \int_0^\infty g(y)F(t^\prime Y) 
dt^\prime dy 
P(t) &amp;=&amp; \int_0^\infty y f(ty)g(y) dy 
\end{eqnarray} 

Plugging in our probability densities from before, we have: 

\begin{eqnarray} 
f(ty) &amp;=&amp; \frac{1}{\sqrt{2\pi} 
n}\mathrm{Exp}\left[-\frac{(t^2y^2)}{2n^2}\right]\\ 
g(y) &amp;=&amp; 
\frac{y^{n-1}}{\Gamma(\frac{n}{2})}\frac{1}{\sqrt{2^{n-2}}}\mathrm{Exp}\left(-\frac{y^2}{2}\right)\\ 
P(t) &amp;=&amp; \int_0^\infty t \frac{1}{\sqrt{2\pi} 
n}\mathrm{Exp}\left[-\frac{(t^2y^2)}{2n^2}\right]\frac{y^{n}}{\Gamma(\frac{n}{2})}\frac{1}{\sqrt{2^{n-2}}}\mathrm{Exp}\left(-\frac{y^2}{2}\right) 
dy\\ 

&amp;=&amp;\frac{1}{\sqrt{2^{n}}}\frac{1}{\Gamma(\frac{1}{2}n)\Gamma(\frac{n}{2})} 
\int_0^\infty y^{n} 
\mathrm{Exp}\left[-\frac{(t^2y^2)}{2n^2}-\frac{y^2}{2}\right]dy\\ 

&amp;=&amp;\frac{1}{\sqrt{2^{n}}}\frac{1}{\Gamma(\frac{1}{2}n)\Gamma(\frac{n}{2})} 
\int_0^\infty y^{n} 
\mathrm{Exp}\left[-\frac{y^2}{2}(1+\frac{t^2}{n^2})\right]dy\\ 
\end{eqnarray} 

Now making the tedious variable change 

\begin{eqnarray} 
s= \frac{y^2}{2}(1+\frac{t^2}{n^2}) 
\end{eqnarray} 

we find 
\begin{eqnarray} 

y^{n}dy=\frac{2^{\frac{n}{2}}s^{\frac{n+1}{2}-1}}{\left(1+\frac{t^2}{n^2}\right)^{\frac{n+1}{2}}}ds 
\end{eqnarray} 

and so P(t) reduces to a Gamma integral: 
\begin{eqnarray} 

P(t)&amp;=&amp;\frac{1}{\sqrt{2^{n}}n}\frac{1}{\Gamma(\frac{1}{2})\Gamma(\frac{n}{2})} 
\int_0^\infty y^{n} 
\mathrm{Exp}\left[-\frac{y^2}{2}(1+\frac{t^2}{n^2})\right]dy\\ 

&amp;=&amp;\frac{1}{n}\frac{\Gamma(\frac{n+1}{2})}{\Gamma(\frac{1}{2})\Gamma(\frac{n}{2})}\frac{1}{\left(1+\frac{t^2}{n^2}\right)^{\frac{n+1}{2}}}\\ 

&amp;=&amp;\frac{1}{n}\frac{1}{B(\frac{1}{2},\frac{n}{2})}\frac{1}{\left(1+\frac{t^2}{n^2}\right)^{\frac{n+1}{2}}}\\ 
\end{eqnarray} 

I'm a bit off from the wikipedia article on the student-t here, but a good 
exercise in combining PDFs. 