---
layout: post
title: Facility Location as Adaptive K-means
date: '2016-01-03T16:04:00.001-08:00'
author: Robert Speare
tags: 
modified_time: '2016-01-05T14:12:46.851-08:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-5901794179241217380
blogger_orig_url: http://rspeare.blogspot.com/2016/01/facility-location-as-adaptive-k-means.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">In linear programming, a 
typical problem is the following: we have $N$ facilities, which we can choose 
to open or not open, in order to serve $M$ customers, who are strewn 
throughout the world. We would like to minimize the operational cost of 
serving our customers from these facilities, which can be summarized as: 

\begin{eqnarray} 
\mathrm{startup} \ \mathrm{costs} &amp;=&amp; \sum_f s_f y_f\\ 
y_f &amp;=&amp; 0,1 
\end{eqnarray} 

Where $y_f$ is a binary variable -- zero or one -- based on whether we choose 
to open facility $f$. $s_f$ is obviously the associated cost for opening that 
specific facility. We also have transit costs from serving our customers, 
which might be of the very simple form: 

\begin{eqnarray} 
\mathrm{transit} \ \mathrm{costs} &amp;=&amp; \sum_c \sum_f X_{cf} 
D(\mathbf{x}_c, \mathbf{x}_f)\\ 
X_{cf} &amp;=&amp; 0,1 
\end{eqnarray} 

Where $X_{cf}$ is a binary matrix that denotes whether customer $c$ was 
assigned to facility $f$. $D(x_1,x_2)$, is our distance metric, which could be 
Euclidean or "Manhattan" -- where we only take steps to the left or right, up 
or down, no diagonal lines between destinations -- or maybe just a query in 
google maps. 

Adding these to costs together we get a loss function of sorts: 

\begin{eqnarray} 
J &amp;=&amp;  \sum_c \sum_f X_{cf} D(\mathbf{x}_c, \mathbf{x}_f)+ \sum_f s_f 
y_f 
\end{eqnarray} 

which we would like to minimize. There are some simple constraints on our 
binary variables that we can articulate mathematically. Say each facility has 
an associated production capacity $c_f$ and each customer has an associated 
demand $d_c$. Then we have to make sure that the assignments are not 
overworking our facilities: 

\begin{eqnarray} 
\sum_c d_c X_{cf} &amp; \le &amp; c_f y_f \ \forall \ f 
\end{eqnarray} 

Notice I've multiplied by $y_f$ on the RHS. Another constraint we need to have 
is that every customer is served by exactly one facility -- no redundancy: 

\begin{eqnarray} 
\sum_f X_{cf} &amp;=&amp; 1\ \forall \ c 
\end{eqnarray} 

We can also require more explicitly that facilities who are turned off do not 
get any assignments: 

\begin{eqnarray} 
X_{cf} &amp; \le &amp; y_f \ \ \ \forall \ c,f 
\end{eqnarray} 

That's a ton of constraints, but each of them are linear and so we have well 
defined linear program. Given $N$ facility locations and $M$ customer 
locations, with the associated capacities, demands, and start up costs, we can 
find the global optimum of this thing with $N(M+1)$ decision variables, $X$ 
and $y$. 

Turns out this problem is very similar to K means. Because what we are 
essentially doing is breaking down our customers into "facility clusters". 
What if we promoted all customers to facilities themselves? (Or at least gave 
them the option). Then the distance function $D(\mathbf{x}_1,\mathbf{x}_2)$ is 
simply the square root of the $L_2$ norm associated with a mixture of 
Gaussians with a diagonal covariance matrix. Let $\mathbf{x}_2$ be the 
facility, or centroid of the $k^\mathrm{th}$ cluster, then we have: 

\begin{eqnarray} 
\mathrm{Let} \ \ \mathbf{x}_2 &amp;=&amp; \mu_k \\ 
\mathbf{\Sigma} &amp;=&amp; \mathbf{1} \\ 
\mathrm{Then} \ \ D(\mathbf{x}_1,\mathbf{x}_1) &amp;=&amp; 
\sqrt{\left(\mathbf{x}_1-\mathbf{\vec{\mu}}_k\right) 
\mathbf{\Sigma}^{-1}\left(\mathbf{x}_1-\mathbf{\vec{\mu}}_k\right)} 
\end{eqnarray} 

For a mixture of Gaussians density Estimation, our PDF is: 

\begin{eqnarray} 
P(\mathbf{x}) &amp;=&amp; \sum_{k=1}^K \mathcal{N}\left(\mu_k,\mathbf{\Sigma} 
\right) 
\end{eqnarray} 

and the log likelihood for our sequence of customers/facilities is: 

\begin{eqnarray} 
-\log \mathcal{L}(X \vert \lbrace \mu \rbrace_{k=1}^K )&amp;=&amp; \sum_k 
\sum_{ n \in c_k} \frac{\left(\mathbf{x}_n-\mathbf{\mu}_k 
\right)^2}{2\sigma^2}+K\sqrt{2\pi \sigma^2} 
\end{eqnarray} 

I've kept the $\sigma^2$ terms for clarity. Notice that the second term in 
this negative log likelihood, or loss function is the normalization factor: it 
penalizes a high level of total clusters $K$, preventing overfitting. This 
loss function -- apart from the quadratic nature of the summand -- is exactly 
like the objective in our facility location problem. The startup cost for 
every "facility" in this example would be 

\begin{eqnarray} 
s_f &amp;=&amp; \sqrt{2\pi \sigma^2} \ \ \forall f 
\end{eqnarray} 

And the variance of our gaussians we would set to unity: $\sigma \to 1$. Let's 
rewrite the negative log likelihood, but in decision variable language: 

\begin{eqnarray} 
J^\prime &amp;=&amp;  \frac{1}{2}\sum_i \sum_j X_{ij} D(\mathbf{x}_i, 
\mathbf{x}_j)^2+ \sum_j s_j y_j \\ 
s_i &amp;=&amp; \sqrt{2\pi}\\ 
\end{eqnarray} 

We have not yet specified the capacity of our clusters or the "demand" of each 
data point. A simple choice would be to set some upper limit on the size of 
each cluster, and give every data point the same weight or demand: 

\begin{eqnarray} 
d_i &amp;=&amp; 1 \ \ \forall \ i \\ 
c_j &amp;=&amp; c_\mathrm{max} \ \ \forall \ j 
\end{eqnarray} 

This is still a linear program, just with a slightly different list of 
coefficients on the first term! To solve such a system we would need $N(N+1)$ 
decision variables, which could be prohibitive with large systems, but thanks 
to interior point solvers and very clever routines for integer programming we 
can actually run this "adaptive" K-means algorithm in polynomial time! 