---
layout: post
title: A first scrawl  at connected and disconnected Moments
date: '2014-05-16T05:21:00.000-07:00'
author: Robert Speare
tags:
- connected moments
- probability
- bispectrum
- power spectrum
- cumulants. statistics
modified_time: '2014-05-18T07:43:19.023-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-9067749091665778977
blogger_orig_url: http://rspeare.blogspot.com/2014/05/connect-cumulants-and-disconnected.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">Building upon the last 
post, I finally realize the difference between connected moments and 
disconnected moments: It has to do with conservation of momentum in the 
Feynman diagrams we have been using to represent the Gram-Charlier expansion. 
(I've recently realized the story becomes more complicated in Statmech, and 
connected moments are quickly defined to be the cumulants, but more on that 
next time.) 

The correlation between two localized excitations in the field are given by 
derivatives the generating function: 

\begin{eqnarray} 
\langle J_{i_1}\dots J_{i_l} \rangle &amp;=&amp; \frac{\partial}{\partial 
J_{i_1}}\cdots \frac{\partial}{\partial J_{i_l}} 
\log\left(Z(\mathbf{J})\right) 
\end{eqnarray} 

But we found, from before, that the generating function was actually built out 
of a sum of Green's functions, which are basically correlators in momentum 
space: 

\begin{eqnarray} 
Z(\mathbf{J}) &amp;=&amp; \sum_s=0^l J_{i_1}\cdots J_{i_l} G_{i_1 \cdots i_l} 
\\ 
G_{ij} &amp;=&amp; \langle q_i q_j \rangle = \int d^Nq \left(q_i 
q_j\right)e^{\mathbf{J}\cdot \mathbf{q} - \mathbf{q}\cdot \mathbf{A} \cdot 
\mathbf{q}-\frac{\lambda}{4!} \mathbf{q}^4} 
\end{eqnarray} 

The above is written for a random anharmonic field -- thus the lambda J $q^4$ 
term -- and we see that this is just our two-point green's function from 
before. If we expand this integral out in powers of lambda, we will get our 
one loop and two loop terms: 

\begin{eqnarray} 
G_{ij} &amp;=&amp; \langle q_i q_j \rangle = \int d^Nq \left(q_i q_j\right) 
\left(1-\frac{\lambda}{4!}\sum_n (q_n)^4+\frac{\lambda^2}{4!4!}\sum_m \sum_n 
(q_n)^4(q_m)^4 + \dots \right)e^{\mathbf{J}\cdot \mathbf{q} - \mathbf{q}\cdot 
\mathbf{A} \cdot \mathbf{q}} 
\end{eqnarray} 

We see by Wick contraction this leads to terms like: 

\begin{eqnarray} 
G_{ij} &amp;=&amp; \langle q_i q_j \rangle + \sum_n \frac{\lambda}{4!} \langle 
q_i q_j q_n q_n q_n q_n\rangle +  \sum_m \sum_n \frac{\lambda^2}{4!4!} \langle 
q_i q_j q_n q_n q_n q_n q_m q_m q_m q_m\rangle + \dots \\ 
&amp;=&amp;  \mathbf{A}^{-1}_{ij} + \frac{\lambda (4\cdot 
3)}{4!}\sum_n(\mathbf{A}^{-1}_{in}\mathbf{A}^{-1}_{nj}\mathbf{A}^{-1}_{nn}+\mathbf{A}^{-1}_{ij}\mathbf{A}^{-1}_{nn}\mathbf{A}^{-1}_{nn} 
) + \frac{\lambda (8 \cdot 7)}{4! 4!}\sum_m \sum_n \left( \dots \right)+\dots 
\end{eqnarray} 

The disconnected terms are any that contain 
\begin{eqnarray} 
\mathbf{A}^{-1}_{ij} 
\end{eqnarray} 

in the n and m summations.  The word "connected" in momentum space means that 
the sum of our q's must be equal to zero. Or, that the ingoing and outgoing 
momenta must sum to zero. (Disconnected diagrams correspond to "vacuum 
fluctuations" where a random variable or particle appears out of nowhere, and 
then disappears at some later point in time.) This restriction on our 
available terms in the two-point Green's function can be written as: 

\begin{eqnarray} 
G_{ij\ \ \rm{connected}} &amp;=&amp; \langle q_i q_j \rangle \delta(q_i+q_j) + 
\sum_n\frac{\lambda}{4!} \langle q_i q_j q_n q_n q_n q_n\rangle 
\delta(q_i+q_j+q_n) \\ &amp;&amp;+ \sum_m \sum_n \frac{\lambda^2}{4!4!} 
\langle q_i q_j q_n q_n q_n q_n q_m q_m q_m q_m\rangle \delta(q_i+q_j+q_n+q_m) 
+ \dots 
\end{eqnarray} 

And this discrete sum looks a lot like the one loop "integrations" I have been 
working with for the power spectrum and bispectrum! Trouble is, in Standard 
perturbation theory, we are using an explicit recursion relation to expand the 
random variable -- over density -- in powers of the scale factor, not through 
some coupling constant lambda. 

 The anharmonic term may be written slightly incorrectly above, but it is 
difficult to represent the potential of a self-interacting field without a 
textbook. I'll have to look up the approximation. 


------------------------------------------------------------------------------------------------------------------------- 
                    Translational invariance of correlation functions and 
"connectedness" 

------------------------------------------------------------------------------------------------------------------------- 

It is also interesting to note that, translationally invariant correlation 
functions, such as the Power Spectrum and Bispectrum, carry a natural dirac 
delta function of the form 

\begin{eqnarray} 
G_{ij} &amp;=&amp; \langle q_i q_j \rangle \delta(q_i +q_j) \\ 
G_{ijk} &amp;=&amp; \langle q_i q_j q_k \rangle \delta(q_i +q_j+q_k) , 
\end{eqnarray} 

written above. This means that translationally invariant correlations 
automatically require connected diagrams? After reading about this in some 
Statmech textbooks, it seems a translationally invariant system already 
defines connected moments as the cumulants due to a graphical expansion of the 
partition function. Will write more about this later.... 