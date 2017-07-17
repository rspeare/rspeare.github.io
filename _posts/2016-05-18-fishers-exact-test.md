---
layout: post
title: Fisher's Exact Test, Lift, and P-Values for Feature Exploration
date: '2016-05-18T20:21:00.002-07:00'
author: Robert Speare
tags:
- contingency tables
- feature selection
- fisher
- significance
- p_values
- fisher information
- Statistics
- null hypothesis
modified_time: '2016-05-18T20:35:44.836-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-616417580629963040
blogger_orig_url: http://rspeare.blogspot.com/2016/05/fishers-exact-test.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"> 
Let's say you are asked to solve a binary classification problem ($y=0,1$) 
with very few training examples ($N&lt;1000$) and quite a few, possibly 
predictive features ($d&gt;1000$). The standard question of "how the heck do I 
feature select?" becomes very relevant, and in particular, "how the heck do I 
feature select with so few training examples?!?". 

For Categorical features, one of the best ways to test for significance -- 
i.e. a non-null relationship between a feature column and a label column -- is 
Fisher's exact test and Laplace-smoothed lift. 

Fisher's exact test is a combinatoric way of examining a contingency (or 
pivot) table. Let's say we have two columns $x$ and $y$, which both take on, 
in the simplest case, only two values: true and false. If we were to make 
pivot table, we'd have the number of pair-wise events in a 2x2 grid. 

\begin{eqnarray} 
\mathrm{pivot}(x,y) &amp;=&amp; \left( \begin{array}{cc} n_{00} &amp; n_{01} 
\\ 
n_{10} &amp; n_{11} 
\end{array}\right) 
\end{eqnarray} 

Where $n_{11}$ corresponds to the number of times $x$ and $y$ were both True, 
$n_{00}$ corresponds to the number of times $x$ and $y$ were both false, 
$n_{10}$ the number times $x$ was true and $y$ false, etc. (This can be done 
easily in pandas by writing something like  
\textit{pandas.pivot(dataFrame,index=x,columns=y,aggFunc=len,fillna=0}).) 

We can see that the sum of the entries $n_{11}+n_{01}+n_{10}+n_{00}=N$ equals 
the number of training examples, and that the sum over rows or columns equals 
the marginal counts. $n_{11}+n_{10}=R_1$ equals the number times $x$ was true; 
$n_{01}+n_{11}=C_1$ equals the number times $y$ was true; $n_{01}+n_{00}=R_0$ 
equals the number times $x$ was false, etc. 

What fisher proposed is to take this matrix and ask, given the marginal 
counts, $R_0,R_1,C_0,C_1$ -- which, if you think about it, correspond to the 
prior probabilities on $x$ and $y$: $P(x)=\frac{R_1}{N},P(y)=\frac{C_1}{N}$ -- 
how likely is the resulting contingency matrix if $x$ and $y$ are independent? 

The most naive way to answer that question is to take the prior probabilities 
on $x$ and $y$ that's given two us by the data: 

\begin{eqnarray} 
P(x)=p &amp;=&amp; \frac{R_1}{N} \\ 
P(y)=q &amp;=&amp; \frac{C_1}{N} 
\end{eqnarray} 

and quote our good old multinomial: 

\begin{eqnarray} 
P(\mathbf{n}) &amp;=&amp; \frac{N!}{n_{00}!\ n_{10}!\ n_{11}!\ n_{01}!} 
\left[pq\right]^{n_{11}}\left[p(1-q)\right]^{n_{10}}\left[(1-p)q\right]^{n_{01}}\left[(1-p)(1-q)\right]^{n_{00}} 
\end{eqnarray} 

which, can be simplified to: 

\begin{eqnarray} 
P(\mathbf{n}) &amp;=&amp; \frac{N!}{n_{00}!\ n_{10}!\ n_{11}!\ n_{01}!} 
(p)^{n_{10}+n_{11}}(1-p)^{n_{00}+n_{01}}(q)^{n_{11}+n_{01}}(1-q)^{n_{10}+n_{00}}\\ 
P(\mathbf{n}) &amp;=&amp; \frac{N!}{n_{00}!\ n_{10}!\ n_{11}!\ n_{01}!} 
(p)^{R_1}(1-p)^{R_0}(q)^{C_1}(1-q)^{C_0} 
\end{eqnarray} 


The probability distribution above assumes that there is no relationship 
between $x$ and $y$, and so, if we see a contingency table that is very 
unlikely given the above pdf, we know something is up! But, how sure are we 
that the prior distribution estimates, $p,q$ are correct? Our sample size $N$ 
was very small. That's a troubling question, which can be solved by Laplace 
Smoothing, which sets a uniform prior distribution on $P(x)$ and $P(y)$: 

\begin{eqnarray} 
P(x)=p &amp;=&amp; \frac{R_1+\alpha}{N+\alpha d_x} 
\end{eqnarray} 
where $d_x$ is the number of distinct values $x$ can take on -- in this case 
two. And similarly, for $y$ we'd have the prior: 

\begin{eqnarray} 
P(y)=q &amp;=&amp; \frac{C_1+\alpha}{N+\alpha d_y} 
\end{eqnarray} 

This helps things a little bit, where $\alpha$ is the hyper parameter between 
0 and 1 that controls the ``strength'' of our uniform prior. But one also 
might worry if using a multinomial is even appropriate, given, for very few 
datapoints $N$, the highly discrete nature of our contingency table. 

Fisher's exact test explicitly addresses this discreteness aspect through 
combinatorics. 

Let's recall an experiment where one has a drunken man throw $N$ darts at a 
dartboard with $d$ cells. The number of different ways in which this drunken 
dart player can get $n_1$ darts in the first cell $n_2$ in the second, $n_3$ 
in the third, etc. is: 

\begin{eqnarray} 
W &amp;=&amp; \frac{N!}{n_1!n_2!\cdots n_d!} 
\end{eqnarray} 

Taking the log of this combinatoric factor and applying stirling's 
approximation, we get the Shannon entropy: 

\begin{eqnarray} 
\log W &amp;=&amp; -\sum_{i=1}^d p_i \log p_i \\ 
p_i &amp;=&amp; \frac{n_i}{N} 
\end{eqnarray} 

This is all very interesting because, if one looks at the contingency table 
above, we need only promote our counts $n_{00},n_{01},n_{10},n_{11}$ to a 
compound index: $n_{1},n_2,n_3,n_4$ and we get the same formula: 

\begin{eqnarray} 
W &amp;=&amp; \frac{N!}{n_{00}!n_{01}!n_{10}!n_{11}!} 
\end{eqnarray} 

This is the number of ways one can get a contingency table with the  counts 
$n_{ij}$. But, this is NOT a probability. It is simply a multiplicity count of 
some "state" in phase space, $n_{ij}$. (You'll see above that it's a 
normalization factor for the multinomial). If we want to convert this 
multiplicity count to a probability, we have to be like Kolgomorov and divide 
by the multiplicity of the entire sample space $\Omega$. After all, 

\begin{eqnarray} 
P(x \in X) &amp;=&amp; \frac{\vert X \vert}{\vert \Omega \vert} 
\end{eqnarray} 

Where I'm using bars for ``multiplicity'', or the count of phase space cells 
within some region. 

For our contingency table, above, we can define precisely what the sample 
space $\Omega$ is: all contingency tables with the marginal sums $R_0,R_1$ and 
$C_0,C_1$. This can be written as compound combinatoric factor: 

\begin{eqnarray} 
\vert \Omega \vert &amp;=&amp; \left(\begin{array}{c} 
N \\ C_0 
\end{array}\right) 
\left(\begin{array}{c} 
N \\ R_0 
\end{array}\right)\\ 
&amp;=&amp; \frac{N! N!}{R_0!R_1!C_0!C_1!} 
\end{eqnarray} 

And so we have, doing our division: 

\begin{eqnarray} 
P(n_{00},n_{01},n_{10},n_{11} \vert R_1,R_0,C_1,C_0 ) &amp;=&amp; 
\frac{R_0!R_1!C_0!C_1!}{N! n_{00}!n_{01}!n_{10}!n_{11}!} 
\end{eqnarray} 

Let the joint event $n_{00},n_{01},n_{10},n_{11}$ be specified by 
$\mathbf{n}$. Then we can write 

\begin{eqnarray} 
P(\mathbf{n} \vert \mathbf{R},\mathbf{C} ) &amp;=&amp; 
\frac{R_0!R_1!C_0!C_1!}{N! n_{00}!n_{01}!n_{10}!n_{11}!} 
\end{eqnarray} 

or, more generally, for non-binary categorical variables (check it!): 

\begin{eqnarray} 
P(\mathbf{n} \vert \mathbf{R},\mathbf{C} ) &amp;=&amp; 
\frac{\prod_{i=1}^{d_x}R_i! \prod_{j=1}^{d_y} C_j!}{N! \prod_{i,j} n_{ij}!} 
\end{eqnarray} 

This is a very interesting formula, because it gives the precise, discrete 
probability of seeing some contingency table, conforming to marginal counts 
$\mathbf{R}$ and $\mathbf{C}$. With a little bit of algebra, one will see that 
this combinatoric probability converges to the multinomial we quoted above, by 
noting: 

\begin{eqnarray} 
\lim_{N \to \infty} N! &amp;\approx &amp; \left(\frac{N}{e}\right)^N 
\end{eqnarray} 

and so we get: 

\begin{eqnarray} 
P(n_{00},n_{01},n_{10},n_{11} \vert R_1,R_0,C_1,C_0 ) &amp;\approx &amp; 
\frac{(\frac{R_0}{e})^{R_0}(\frac{R_1}{e})^{R_1}(\frac{C_0}{e})^{C_0}(\frac{C_1}{e})^{C_1}}{(N/e)^N 
(\frac{n_{00}}{e})^{n_{00}}(\frac{n_{01}}{e})^{n_{01}}(\frac{n_{10}}{e})^{n_{10}}(\frac{n_{11}}{e})^{n_{11}}} 
\end{eqnarray} 

All the factors of $e$ cancel out, and we can simplify to get: 

\begin{eqnarray} 
pq &amp;=&amp; \frac{n_{11}}{N}\\ 
p(1-q) &amp;=&amp; \frac{n_{10}}{N}\\ 
(1-p)q &amp;=&amp; \frac{n_{01}}{N}\\ 
(1-p)(1-q) &amp;=&amp; \frac{n_{00}}{N} \\ 
P(\mathbf{n} \vert \mathbf{R},\mathbf{C} ) &amp;=&amp; \frac{N!}{\prod_{i,j} 
n_{ij}! 
}(\frac{R_0}{N})^{R_0}(\frac{R_1}{N})^{R_1}(\frac{C_0}{N})^{C_0}(\frac{C_0}{N})^{C_0} 
\\ 
&amp;=&amp; \frac{N!}{n_{00}!\ n_{10}!\ n_{11}!\ n_{01}!} 
(p)^{n_{10}+n_{11}}(1-p)^{n_{00}+n_{01}}(q)^{n_{11}+n_{01}}(1-q)^{n_{10}+n_{00}} 
\end{eqnarray} 

The same multinomial formula we found above! 

This really isn't so surprising, as it says the combinatoric probability 
converges to the multinomial with fully continuous priors $p,q$ in the large 
sample $N \to \infty$ limit, but it is interesting to note. 

Now, Fisher, when quoting p-values, or significance tests for a relationship 
between $x,y$, would simply use the count of contingency tables that had table 
counts $\mathbf{n}$ more extreme than what's observed. For instance, let's say 
we observe a True/True $x,y$ occurence that is higher than expected under the 
marginals: $n_{11}&gt;N p q$ or $n_{11} &gt; R_1 C_1 / N $: what's the sum of 
the probabilities of tables that have an even \textit{higher} $n_{11}$? This 
is called a one-tailed pvalue significance test, and for the fisher exact test 
and the multinomial method, corresponds to a simple sum. 

I won't get too into the details of implementation now, but suffice to say, 
scipy's got a fisher test calculation all on its own! 



------------------------------------------------------------------------------------------------------------------------ 

Now what hasn't been mentioned is lift. And it relates directly to the laplace 
smoothed priors discussed earlier. Lift is simply: 

\begin{eqnarray} 
l(x\vert y) &amp;=&amp; \frac{P(x \vert y)}{P(x)} = \frac{P(x,y)}{P(x)P(y)} 
\end{eqnarray} 

or, the probability of $x$ taking on some value given $y$ relative to $x$ 
occurring independently. Lift is a number between zero and infinity, and 
basically means: how many more times likely is $x$ going to occur given $y$? 
For low sample size $N &lt; 1000$, it's probably a good idea to smooth the 
priors $P(x),P(y)$ giving us: 

\begin{eqnarray} 
l(x\vert y) &amp;=&amp;  \frac{P(x,y)}{P(x)P(y)} \\ 
&amp;=&amp; \frac{(N+\alpha d_x)(N+\alpha d_y)}{N}\frac{n_{xy}}{n_x n_y } 
\end{eqnarray} 

Where $n_x,n_y$ is the event count of $x$ and $y$. $n_{xy}$ is th joint event 
count of $x,y$. 

------------------------------------------------------------------------------------------------------------------------ 

For those who are heavily implementation-focused, you'll note that this fisher 
test can be done for any type of contingency table -- it doesn't have to be 
two binomial marginal distributions, they could easily be multinomials! -- but 
often the best way to do things is to OneHotEncode the scikit-learn first, and 
then do simple fisher exact tests on each of the pairwise 2x2 contingency 
tables for feature selection. I hope that helps! 

<pre><!--EndFragment--></pre> 