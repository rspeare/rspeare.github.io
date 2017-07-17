---
layout: post
title: Importance Sampling
date: '2014-07-09T06:33:00.002-07:00'
author: Robert Speare
tags:
- Numerical
- probability
- Integration
- Bayes
- cumulants. statistics
modified_time: '2014-07-09T08:02:15.213-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-2636740155728159131
blogger_orig_url: http://rspeare.blogspot.com/2014/07/importance-sampling.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">So, last week I was 
learning a great deal about something called the VEGAS algorithm, which was 
first presented by Peter LePage in the 60's or 70's. It's a very clever way of 
going about importance sampling, which is a Monte Carlo method for 
integration. 

To start, let's say we would like to evaluate the integral: 

\begin{eqnarray} 
I &amp;=&amp; \int f(\mathbf{x})d^n x 
\end{eqnarray} 

Where $\mathbf{x}$ is an n-dimensional vector and we are integrating over 
n-dimensional space, with jacobian $d^n x$. Let's say that this function, our 
integrand, $f(\mathbf{x})$, is purely intractable by analytic means -- it is 
impossible to integrate with pen and paper. Luckily, we can estimate this 
integral by other (Monte Carlo) means. 

A naive strategy would be to construct a uniform Probability density function 
(PDF) on the integration region, and sample randomly from this PDF to get the 
independent variable $\mathbf{x}$ and the corresponding integrand value 
$f(\mathbf{x}$. This would be essentially obtaining an expectation value. 
Let's take a look in 1-D: 

\begin{eqnarray} 
I &amp;=&amp; \int_a^b f(x) dx \\ 
g(x) &amp;=&amp; \frac{1}{(b-a)} 
\eta \sim P(x) \\ 
\langle f(x) \rangle_{g(x)} &amp;=&amp; \int_a^b f(x) g(x) dx = \frac{1}{b-a}I 
\end{eqnarray} 

As the number of our random samples, $\eta$ gets large, we can use the law of 
large numbers to assume that our discrete mean closes in on the "true" mean, 
which, in this case, is the value of the integral $I$: 

\begin{eqnarray} 
\langle f(x) \rangle_g &amp;=&amp; \lim_{N \to \infty} \sum_i^N 
\frac{f(\eta_i)}{N} \ \ \ \ \ \eta \sim g(x) \\ 
&amp;=&amp; (b-a) \int f(x) dx 
\end{eqnarray} 

So that's pretty cool! We have estimated an integral by taking a "strange type 
of mean", drawing random variables from some arbitrary -- well, in this case 
uniform -- PDF $g(x)$. One way to take care of our strange factor $b-a$ above 
is to "normalize" 

\begin{eqnarray} 
I &amp;=&amp; \int f(x) dx = \int \frac{f(x)}{g(x)}g(x)dx 
\end{eqnarray} 

We see that the above is just our old integral $I$, but we find that, in 
numerical means, the last term on the right is equivalent to finding the 
expectation value of $f/g$ "under" $g(x)$, which means: 

\begin{eqnarray} 
I &amp;=&amp; \int \frac{f(x)}{g(x)}g(x)dx = \langle \frac{f(x)}{g(x)} 
\rangle_g \\ 
&amp;=&amp; \lim_{N\to \infty} \sum_i^N \frac{1}{N}\frac{f(\eta_i)}{g(\eta_i)} 
\ \ \ \ \ \eta \sim g(x) 
\end{eqnarray} 

So our random sample $\eta$ are drawn from the PDF $g(x)$, and we are 
searching for the mean value of this \textbf{ratio}, $\frac{f}{g}$. 
Interesting trick right? 

Now our next step in this numerical procedure is to estimate the variance in 
our "integral estimator", which is what we will call our sum of the ratios, 
above: 

\begin{eqnarray} 
\hat{I} &amp;=&amp; \sum_i^N \frac{1}{N}\frac{f(\eta_i)}{g(\eta_i)} \ \ \ \ \ 
\eta \sim g(x) \\ 
\lim_{N\to \infty} \hat{I} &amp;=&amp; I 
\end{eqnarray} 

What is $\sigma^2_I$? We construct our estimator of the variance in the usual 
way: the mean of the square minus the square of the mean: 

\begin{eqnarray} 
\sigma^2_I &amp;=&amp; \langle (\hat{I}-I)^2 \rangle = \langle \hat{I}^2 
\rangle - \langle \hat{I} \rangle^2 \\ 
&amp;=&amp; \langle \left(\frac{f(x)}{g(x)}\right)^2 \rangle_g - \langle 
\frac{f(x)}{g(x)}\rangle_g^2 \\ 
&amp;=&amp; \int \left(\frac{f(x)}{g(x)}\right)^2  g(x) dx - \left( \int f(x) 
dx\right)^2\\ 
&amp;=&amp; \int \frac{\vert f(x) \vert^2}{g(x)^2} g(x) dx - \left( \int f(x) 
dx\right)^2\\ 
\end{eqnarray} 

Numerically, this final equation can be represented by another discrete sum, 
which we will call our estimate of the variance: 

\begin{eqnarray} 
\hat{\sigma}^2_I &amp;=&amp; \frac{ \sum_i^N \frac{\vert f(\eta_i) 
\vert^2}{g(\eta_i)^2}- \left( \sum_i^N 
\frac{f(\eta_i)}{g(\eta_i)}\right)^2}{N^2}  \ \ \ \ \ \ \ \eta \sim g(x) 
\end{eqnarray} 

Now since we are subtracting by an estimator of the mean and not the true 
mean, we find that the above estimator of the variance is biased, by a factor 
of $\frac{N-1}{N}$, so we should rewrite our denominator above with an 
$N(N-1)$, as we are used to. 


----------------------------------------------------------------------------------------------------------- 

So what choice of the probability density $g(x)$ minimizes the variance in our 
integral estimate? Intuitively, we can expect that if $g(x)$ closely matches 
the behaviour of $f(x)$ over the whole domain of integration, the ratio $f/g$ 
would remain constant, and we expect very small variance. Let's take a 
function derivative of our expression for variance $\sigma^2_I$ with a 
lagrange multiplier $\lambda$ in place to maintain the constraint of $g(x)$'s 
normalization as a probability density function: 

\begin{eqnarray} 
\sigma^2_I &amp;=&amp; \int \frac{\vert f(x)\vert^2}{g(x)}dx - (\int f(x) 
dx)^2 + \lambda \left(\int g(x) dx -1 \right) \\ 
\frac{\delta \sigma^2_I}{\delta g}&amp;=&amp;  \int \left[ \frac{-\vert 
f(x)\vert^2}{g(x)^2}+\lambda \right] dx 
\end{eqnarray} 

We see that this derivative above will be zero only when the integrand is zero 
for all x, and so we have 

\begin{eqnarray} 
g(x) &amp;=&amp; \lambda \vert f(x) \vert 
\end{eqnarray} 

Since we have already assumed $g(x)$ to be a PDF, we need not place the 
absolute value sign on the LHS, above, because PDF's are positive definite (in 
order to make their cumulative PDF's  $G(x)=\int_{-\infty}^x 
g(x^\prime)dx^\prime $ monotonically increasing). Plugging in our 
normalization constraint, once again, we find: 

\begin{eqnarray} 
\int g(x) dx &amp;=&amp; \lambda \int \vert f(x) \vert dx \\ 
1 &amp;=&amp; \lambda \int \vert f(x) \vert dx \\ 
\frac{1}{\int \vert f(x) \vert dx} &amp;=&amp; \lambda \\ 
\end{eqnarray} 

and so the optimum PDF is 

\begin{eqnarray} 
g(x) &amp;=&amp; \frac{\vert f(x) \vert}{\int \vert f(x) \vert dx} 
\end{eqnarray} 

or, is proportional to absolute value of our integrand -- with some 
normalization constant -- at every $x$. This is pretty cool! One can find, by 
taking a similar functional derivative in N-dimensions, that if $g(x)$, the 
multidimensional PDF is separable across the components of our vector 
$\mathbf{x}$ 

\begin{eqnarray} 
g(\mathbf{x}) &amp;=&amp; \Pi_i^N g_i (x_i) 
\end{eqnarray} 

then the optimum $g(\mathbf{x})$ takes the following form: 

\begin{eqnarray} 
g_j (x_j) &amp;=&amp; \frac{\left[ \int \frac{\vert f(x) \vert^2}{\Pi_{i \ne 
j} g_i (x_i) } d^{n-1}x\right]^{1/2}}{\int dx_j \left[ \int \frac{\vert f(x) 
\vert^2}{\Pi_{i \ne j} g_i (x_i) } d^{n-1}x\right]^{1/2}} 
\end{eqnarray} 


----------------------------------------------------------------------------------------------------------- 

So how does VEGAS go about approximating these "optimum" multidimensional 
distributions? By changing the sampling grid. LePage did a very clever thing 
when he constructed an algorithm that initially samples some integrand 
uniformly, essentially adopting the following PDF: 

\begin{eqnarray} 
g_0(\mathbf{x}) &amp;=&amp; \frac{1}{V_n} 
\end{eqnarray} 

Where $V_n$, is the n-dimensional volume of the integration region. But then, 
once these samples are taken, he perturbs the grid spacings -- keeping the 
number of samples constant -- in proportion with the absolute value of the 
integrand, $f(\mathbf{x})$. What this essentially does is match 
$g(\mathbf{x})$'s peaks to $f(\mathbf{x})$'s peaks, be they high or low, and 
over successive sampling rounds -- let's say M of them -- the "grid", or 
$g(\mathbf{x})$, gets perfectly attuned to the characteristics of 
$f(\mathbf{x})$. 