---
layout: post
title: Multi-Class Logistic Regression as Maximum (conditional) Entropy
date: '2015-07-27T08:30:00.001-07:00'
author: Robert Speare
tags:
- Maximum Entropy
- probability
- Statistical Mechanics
- logistic regression
- Machine Learning
- Statistics
- Bayes
- Jaynes
modified_time: '2015-10-20T08:13:28.262-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-8690009860928412580
blogger_orig_url: http://rspeare.blogspot.com/2015/07/recently-ive-been-thinking-about.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Recently, I've been 
thinking about Logistic regression -- i.e. Machine Learning classification and 
the activation of neurons in neural networks -- and how it can be framed in 
terms of Statistical Mechanics. If you look at the sigmoid function, you'll 
notice something a bit suspect -- or at least I did: it looks peculiarly like 
a Boltzman distribution, or some properly normalized member of the exponential 
family: 

\begin{eqnarray} 
\mathrm{sigm}(x)&amp;=&amp; \frac{1}{1+e^{-x}} \\ 
\mathrm{sigm}(\beta x)&amp;=&amp; \frac{1}{1+e^{-\beta x}} 
\end{eqnarray} 

If we scale this function by $\beta$, this looks a lot like Boltzman. And, if 
we use the standard framework for logistic regression, where our exponential 
argument is the dot product between a vector of parameters $\vec{\theta}$ and 
a vector of input data, $\vec{x}$, we have: 

\begin{eqnarray} 
P(y=1 \vert \vec{x},\vec{\theta}) &amp;=&amp;  \frac{1}{1+e^{-\vec{\theta} 
\cdot \vec{x}}} 
\end{eqnarray} 

That is, the probability that our feature factor $\vec{x}$ belongs to class 
$y=1$ is given by the sigmoid function, with a ``linear regression'' as its 
argument. Could we derive this sigmoid function by different means? Where does 
it come from? 

Recall that the Boltzman distribution can be derived from maximum entropy. 
Shannon proved that the entropy of a probability distribution is equal to the 
following strange quantity: 

\begin{eqnarray} 
S[p] &amp;=&amp; \sum_i -p(x_i) \log \left(p(x_i)\right) 
\end{eqnarray} 

or, in the continuous PDF case: 

\begin{eqnarray} 
S[p] &amp;=&amp; \int -p(x) \log \left( p(x) \right) dx 
\end{eqnarray} 

another way to write this is 

\begin{eqnarray} 
S &amp;=&amp; \langle -\log\left(p(x) \right) \rangle 
\end{eqnarray} 

Maximizing this entropy, subject only to normalization, involves setting the 
gradient of the following function to zero: 

\begin{eqnarray} 
 G&amp;=&amp; S[p] + \lambda \left( \sum_i p(x_i) -1 \right)\\ 
 \frac{\partial G}{\partial p(x_i)} &amp;=&amp; 0 \ \forall i 
\end{eqnarray} 

If we have a discrete distribution over $N$ total points $\lbrace x_i 
\rbrace_{i=1}^N$, we get the \textbf{**uniform distribution**}. 

\begin{eqnarray} 
p(x_i) &amp;=&amp; \frac{1}{N} 
\end{eqnarray} 

But, once we start specifying certain properties of this distribution, like, 
say it's moments, we will change things substantially. Constraining on the 
mean gives us the exponential distribution: 

\begin{eqnarray} 
G[p]&amp;=&amp; S[p] + \lambda \left( \int p(x) -1 \right)+ \beta \left( \int 
p(x) x - \tau \right)\\ 
 \frac{\delta G}{\delta p(x_i)} &amp;=&amp; 0 \ \forall i \\ 
 \Rightarrow p(x_i) &amp;=&amp; \tau e^{-\tau x_i } 
\end{eqnarray} 

Where now instead of a gradient we've taken a \textbf{**functional 
derivative**}, of the functional $G$. Our result is the exponential 
distribution, which is the \textbf{**maximally entropic**} probability 
distribution with its first moment constrained. (You may not be surprised to 
learn that the Gaussian is the maximally entropic PDF with its first and 
second moment constrained!) 

So maximizing entropy subject to certain constraints places heavy, 
deterministic restrictions on the form of our PDF's. We are essentially 
designing things to be as ``uninformative'' or least biased as possible. As 
Jaynes once said, `our thinking Robot is non-ideological: it takes in only the 
information it is given and nothing more'. 

When we do classification problems, we are really maximizing the entropy of a 
probability distribution on class $y$, not on the feature vector $\vec{x}$, 
and this conditional entropy has a specific form: 

\begin{eqnarray} 
S[p(y \vert \vec{x})] &amp;=&amp; -\sum_i p(\vec{x}) p(y \vert \vec{x})\log 
\left( p(y \vert \vec{x}) \right) 
\end{eqnarray} 

Ok. So now what are our constraints? We would like to define some function of 
the feature vector $\vec{x}$ that is useful, and require our probability 
density on class $y$, $p(y \vert \vec{x}$, to exhibit the \textbf{**same 
ensemble averages**}: 

\begin{eqnarray} 
\sum_{\vec{x},y} p(\vec{x}) p(y \vert \vec{x}) f_y(\vec{x}) &amp;=&amp; 
\langle f_y(\vec{x}) \rangle 
\end{eqnarray} 

Where on the left we are summing over only $\vec{x}$ that are in the training 
set. (This is the role of $p(\vec{x})$. I have seen this equation called a 
``balance'' equation, but really it is just a constraint on the ensemble 
average -- over class $y$ and feature vector $\vec{x}$ -- of some function 
$f_y(\vec{x})$: just like how we constrain energy with the Boltzman 
distribution: 

\begin{eqnarray} 
\sum_{\vec{x}} P(\vec{x}) \mathcal{H}(\mathbf{x}) &amp;=&amp; \langle E 
\rangle 
\end{eqnarray} 

Putting things into our big expression for entropy, we have: 

\begin{eqnarray*} 
G[p] &amp;=&amp; -\sum_i p(\vec{x}) p(y \vert \vec{x})\log \left( p(y \vert 
\vec{x}) \right) + \lambda \left( \sum_y p(y \vert \vec{x}) -1 \right)+ \beta 
\left(\sum_{\vec{x},y} p(\vec{x}) p(y \vert \vec{x}) f_y(\vec{x}) - \langle 
f_y(\vec{x}) \rangle \right) 
\end{eqnarray*} 

So $\lambda$ is the lagrange multiplier that asserts proper normalization on 
the PDF over class, not feature vector $\vec{x}$, and $\beta$ is the lagrange 
multiplier that asserts proper expectation value of the function 
$f_y(\mathbf{x})$ over both class and the training set. We could extend this 
and have \textbf{**multiple**} feature functions to be constrained on, with 
multiple lagrange multpliers by just making them both vector valued: 

\begin{eqnarray*} 
G[p] &amp;=&amp; -\sum_i p(\vec{x}) p(y \vert \vec{x})\log \left( p(y \vert 
\vec{x}) \right) + \lambda \left( \sum_y p(y \vert \vec{x}) -1 \right)+ 
\vec{\beta} \cdot \left(\sum_{\vec{x},y} p(\vec{x}) p(y \vert \vec{x}) 
\vec{f}_y(\vec{x}) - \langle \vec{f}_y(\vec{x}) \rangle \right) 
\end{eqnarray*} 

Setting the gradient -- or in the continuous case, functional derivative -- of 
this expression to zero gives: 

\begin{eqnarray} 
P(y \vert \vec{x}) &amp;=&amp; Z^{-1} e^{\vec{\beta} \cdot 
\vec{f_y}(\vec{x})}\\ 
Z &amp;=&amp; \sum_c e^{\vec{\beta} \cdot \vec{f_y}(\vec{x})} 
\end{eqnarray} 

This expression already has multi-class classification built in, but let's see 
what it looks like for simpler logistic regression, when $y=0,1$. What is a 
good choice for the feature function $\vec{f_y}(\vec{x})$ to get our sigmoid 
function back? Since logistic regression looks a lot like a 
``sigmoid-wrapped'' linear regression in textbooks, it might be a good idea to 
define: 

\begin{eqnarray} 
\vec{f_y}(\vec{x}) &amp;=&amp; \vec{x} \ \ \mathrm{if} \ \ y^\prime=y 
\end{eqnarray} 

Then we have: 

\begin{eqnarray} 
P(y=1 \vert \vec{x}) &amp;=&amp; \frac{ e^{\vec{\beta_1} \cdot 
\vec{x}}}{e^{\vec{\beta_0} \cdot \vec{x}}+e^{\vec{\beta_1} \cdot \vec{x}}} 
\end{eqnarray} 

Simplifying things we get: 

\begin{eqnarray} 
P(y=1 \vert \vec{x}) &amp;=&amp; \frac{ 1}{1+e^{-(\vec{\beta_1}-\vec{\beta_0}) 
\cdot \vec{x}}} 
\end{eqnarray} 

The expression above is precisely logistic regression, with the parameters 
$\beta_0$ the ``anti'' linear-coefficients and $beta_1$ the non-anti linear 
coefficients. We combine them both into the normal $\vec{\theta}$ and write 

\begin{eqnarray} 
P(y=1 \vert \vec{x}) &amp;=&amp; \frac{ 1}{1+e^{-\vec{\theta} \cdot \vec{x}}} 
\end{eqnarray} 

So what does this mean? It means that $\beta_1$ is constraining the ensemble 
average of the $i^\mathrm{th}$ component of the feature vector $\vec{x}$, 
given that class is $y=1$;  And conversely for $\beta_0$, we are constraining 
the $i^\mathrm{th}$ component of the feature vector when the class is $y=0$. 
These feature functions can be called marginal counts, or marginal 
probabilities on $\vec{x}$. 

Now in the last post I talked about how the vector $\theta$ gives the 
direction of \textbf{**fastest increase**} for the logistic function, or the 
direction of ``fastest decision'' -- both for yes and no -- from the decision 
boundary. We can frame this in an even more physical way using Lagrange 
multipliers, because what $\vec{\beta}$ really represents in feature space is 
a \textbf{**constraint force**}, as seen in Lagrangian mechanics. Just like 
when we are minimizing the action -- a functional -- subject to some 
constraint: 

\begin{eqnarray} 
S &amp;=&amp; \int \left[ \mathcal{L(q,\dot{q})}+ \lambda \left(q_x^2+q_y^2 - 
R^2\right)  \right] dt 
\end{eqnarray} 

$\lambda$ above gives the ``tension'' force $\lambda=T$ for a massive 
particle, constrained to move on a circle of radius $R$. We are using the same 
tactic with $\beta$ to ``push'' our PDF into the proper shape. Stronger 
components -- i.e. larger scalar values within $\vec{\beta}$ -- correspond to 
stronger entropic forces on the PDF, and stronger correlation. 

It is easy to extend the expressions above to multiple classes $y=0,1,2 
\dots$, and important to note that the activation of most all neurons in 
neural networks use logistic regression: it's all maximum entropy learning. 
E.T. Jaynes would be very proud. 