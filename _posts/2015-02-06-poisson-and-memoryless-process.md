---
layout: post
title: Poisson and the Memoryless Process
date: '2015-02-06T13:35:00.001-08:00'
author: Robert Speare
tags:
- poisson
- Statistics
- cosmology
modified_time: '2015-10-16T07:55:34.967-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-4497524288383794136
blogger_orig_url: http://rspeare.blogspot.com/2015/02/poisson-and-memoryless-process.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">On a statistical 
mechanics problem set this week, we were asked to ``backwards'' derive the 
Poisson distribution from a statement like this: 

"You notice that, as you're riding high above the ground in airplane, the 
probability for there to be no cars on some stretch of road -- say, the length 
x -- to be $e^{-ax}$. From this observation, can you express the likelihood of 
observing exactly $n$ cars in a length of highway $z$?" 

This is a very tricky question. But we should start by looking at our first 
piece of information in view of the Poisson distribution 

\begin{eqnarray} 
P(n) &amp;=&amp; \frac{\lambda^n}{n!}e^{-\lambda} 
\end{eqnarray} 

$\lambda$ is the mean number of occurrences of some event, for some fixed 
interval. We see that if we set $n=0$ we get the original part of our 
statement: 

\begin{eqnarray} 
P(0) &amp;=&amp;e^{-\lambda} 
\end{eqnarray} 

This is the probability of observing zero ``events'' within some fixed 
interval. (Which, in our case is length. But this could easily be time or 
energy or whatnot.) It's worth noting that, if we write $\lambda=ax$, we can 
see that this is just the cumulative Probability of an exponential 
distribution: 

\begin{eqnarray} 
P(x \ge X) &amp;=&amp; \int_X^\infty ae^{-ax}dx=e^{-aX} 
\end{eqnarray} 

Which is a ``memory-less'', distribution. What does that mean? I like to think 
about the exponential distribution in terms of waiting for a train at the 
train station. If you've already been waiting 10 minutes, and you ask 
yourself, ``what's the probability that I won't see a train for another 5 
minutes''? Mathematically this means 

\begin{eqnarray} 
P(t \ge X+Y \vert t \ge Y) &amp;=&amp; P(t \ge X) 
\end{eqnarray} 

Where $X$ is five minutes and $Y$ is the original 10 minutes. For $X$ and $Y$ 
treated as random variables, this means that we have conditional dependence 
between $X$ and $Y$, or, the **doesn't care that you've already been waiting 
10 minutes**, the expectation of arrival is ubiquitous in time. 

Now that's all very entertaining, but how does this relate to Poisson? Not 
seeing a train arrive in time interval $t$ is the same as not seeing a car on 
the highway over some interval $x$, and, to be exhaustingly pedantic, is the 
same as not seeing a quantum energy level in some band $\Delta E$. What about 
the probability of seeing exactly $n$ such events in said ``width''? 

The first thing we need to do is define, a new variable, which I'll call 
$t_n$, which is the sum of $n$ people's waiting time for a train: 

\begin{eqnarray} 
t_n &amp;=&amp; t_1+t_2+\dots t_n 
\end{eqnarray} 

The probability distribution on $t_n$ is just a convolution of the 
independently, identically distributed variables, 

\begin{eqnarray} 
P(t_n) &amp;=&amp; \frac{a^n t_n^{n-1}}{(n-1)!}e^{-at_n} 
\end{eqnarray} 

Now, this almost looks Poisson, but not quite. What if we looked at the 
cumulative distribution of such a variable; say, of the probability that the 
sum of $n+1$-people's waiting times adds up to something greater than $x$? 

\begin{eqnarray} 
P(t_{n+1} \ge x) &amp;=&amp; \int_x^\infty \frac{a^{n+1} 
t_n^{n}}{(n)!}e^{-at_n} dt_n \\ 
&amp;=&amp; \frac{(ax)^n}{n!}e^{-ax}+\int_x^\infty \frac{a^n 
t_n^{n-1}}{(n-1)!}e^{-at_n} 
\end{eqnarray} 
We see that the second term looks like the cumulative probability of 
$n$-peoples waiting times add up to something greater than $x$. And so we take 
the difference: 

\begin{eqnarray} 
P(t_{n+1} \ge x)  &amp;=&amp; \frac{(ax)^n}{n!}e^{-ax} +P(t_{n} \ge x) \\ 
P(t_{n+1} \ge x) -P(t_{n} \ge x) &amp;=&amp; \frac{(ax)^n}{n!}e^{-ax} 
\end{eqnarray} 

and get Poisson! So the Poisson distribution can be thought of as the 
probability that the sum of **exactly** $n$ waiting times  at a train station 
adds up to some total $x$. In this case, $x$ is our width, be it along a 
highway, energy spectrum, or time, and $n$ is the number of successes, or 
events, or train arrivals. 

Or, perhaps, in a common -- and quite close to the heart example -- baby 
births. 


---------------------------------------------------------------------------------------------------- 


Note, it is important to remember that the mean of the exponential 
distribution is $\langle x \rangle=a^{-1}$, so $\lambda$ should really be 
written: 

\begin{eqnarray} 
P(n) &amp;=&amp; \frac{(t_n/\mu)^n}{n!}e^{-\frac{t_n}{\mu}} 
\end{eqnarray} 

Where $\mu$ is the average``waiting time'' for each independently distributed 
member, $t$. 
<div> 