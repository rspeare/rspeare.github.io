---
layout: post
title: Stirling's Approximation
date: '2014-04-15T03:11:00.003-07:00'
author: Robert Speare
tags:
- Quals
- Method of Steepest Descent
- Statistics
modified_time: '2014-04-15T05:29:07.973-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-6810431866767056599
blogger_orig_url: http://rspeare.blogspot.com/2014/04/stirlings-approximation.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">To take a quick detour, 
let us examine the following definition of the factorial: 

\begin{eqnarray} 
N! &amp;=&amp; \int_0^\infty x^N e^{-x}dx 
\end{eqnarray} 

One way to prove this is to write 

\begin{eqnarray} 
I(a) \int_0^\infty e^{-ax}dx &amp;=&amp; \frac{1}{a} 
\end{eqnarray} 

and take the derivative underneath the integral sign, to write: 

\begin{eqnarray} 
I^\prime(a) &amp;=&amp; \frac{\partial}{\partial a} \int_0^\infty e^{-ax}dx \\ 
&amp;=&amp; \int_0^\infty -ax e^{-ax}dx \\ 
&amp;=&amp; \frac{-1}{a^2} 
\end{eqnarray} 

and more generally, 

\begin{eqnarray} 
\frac{\partial^n I(a)}{\partial a^n} &amp;=&amp; (-1)^n \int_0^\infty a^n x^n 
e^{-ax}dx = \frac{(-1)^n n!}{a^{n+1}} 
\end{eqnarray} 

Setting $a=1$ we find 

\begin{eqnarray} 
\Gamma[n+1] &amp;=&amp; \int_0^\infty x^n e^{-x}dx =  n! 
\end{eqnarray} 

Now let's examine this integral in the limit $n \to \infty$. We can take our 
$x$ argument up, into the exponential and write the corresponding function as 
$f(x)$: 

\begin{eqnarray} 
n! &amp;=&amp; \int_0^\infty e^{-x+n \log x}dx\\ 
&amp;=&amp; \int_0^\infty e^{f(x)}dx\\ 
f(x) &amp;=&amp; -x + n \log x 
\end{eqnarray} 

Now $f(x)$ is an absurdly large -- or high-valued -- function for large $n$, 
and so we can approximate this integral as only "counting" contributions 
around the maximum of $f(x)$. We find the position this maximum in the normal 
way: 

\begin{eqnarray} 
f^\prime &amp;=&amp; -1 + \frac{n}{x} = 0 \\ 
x_0 &amp;=&amp; n 
\end{eqnarray} 

Taking a look at our second derivative 
\begin{eqnarray} 
f^{\prime \prime}\vert_{x_0} &amp;=&amp; -\frac{n}{x^2} = -\frac{1}{n} &lt; 0 
\end{eqnarray} 

we see that $x_0$ is the position of a true maximum. Expanding out our $f(x)$ 
with a Taylor approximation: 

\begin{eqnarray} 
n! &amp;\approx&amp; \int_0^\infty e^{f(x_0)+f^\prime(x) 
\vert_{x_0}(x-x_0)+f^{\prime \prime}(x) \vert_{x_0}\frac{(x-x_0)^2}{2}}dx\\ 
\end{eqnarray} 

We see that the first derivative term is zero by construction, and we are left 
with a constant times a Gaussian, 

\begin{eqnarray} 
n! &amp;\approx&amp; e^{-n+n\log n}\int_0^\infty e^{\frac{(x-x_0)^2}{2n}}dx\\ 
&amp;\approx&amp; n^n e^{-n}\int_0^\infty e^{\frac{(x-n)^2}{2n}}dx\\ 
\end{eqnarray} 

Now this integral is tricky, because we are taking the limit as $n \to 
\infty$, which means that, essentially, the middle of our Gaussian 
distribution is far afield from $x=0$. Since the integral of any Gaussian 
$e^{-x^2/(2\sigma^2)}$ is $\sqrt{2 \pi \sigma^2}$, we can approximate the 
integral above to be the "full" $-\infty &lt; x &lt; \infty$ integration, 
because our moment, or center of the distribution, $x_0$ is far to the 
positive side of zero. This yields, with $\sigma^2=\sqrt{n}$: 

\begin{eqnarray} 
n! &amp;\approx&amp; n^n e^{-n}\sqrt{2\pi n} 
\end{eqnarray} 

Which is stirling's approximation! 

Now if we use this approximation to examine the binomial distribution in the 
same limit: 

\begin{eqnarray} 
P(k;N) &amp;=&amp; \frac{N!}{k! (N-k)!}p^k (1-p)^{N-k} 
\end{eqnarray} 