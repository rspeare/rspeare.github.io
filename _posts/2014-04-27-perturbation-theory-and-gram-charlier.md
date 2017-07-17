---
layout: post
title: Loop Diagrams and the Gram-Charlier Expansion
date: '2014-04-27T08:09:00.000-07:00'
author: Robert Speare
tags: 
modified_time: '2014-04-27T08:32:20.333-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-299137812876389741
blogger_orig_url: http://rspeare.blogspot.com/2014/04/perturbation-theory-and-gram-charlier.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">In response to the former 
question, whether an arbitrary statistical distribution -- with non-zero 
kurtosis and skewness and higher order cumulants -- can be represented in 
terms of loop diagrams, the answer is yes! 

After looking at Zee's "Child Problem" In "Quantum field theory in a 
nutshell", we see the following multidimensional integral: 

\begin{eqnarray} 
Z(J) &amp;=&amp;\int d^Nq \mathrm{Exp}\left(\frac{-\vec{q}\cdot \mathbf{A} 
\cdot \vec{q}}{2}+\vec{J}\cdot{q}-\frac{\lambda}{4!}q^4 \right) 
\end{eqnarray} 

Which can be described in terms of a Green's function series expansion in 
powers of J: 

\begin{eqnarray} 
Z(J) &amp;=&amp; \sum_{s=0}^N \frac{1}{s!}J_{i_1}J_{i_2}\cdots J_{i_s} 
G_{i_1i_2\cdots i_s} \\ 
G_{i\cdots j} &amp;=&amp; \int d^Nq \left(q_i \cdots q_j 
\right)\mathrm{Exp}\left(\frac{-\vec{q}\cdot \mathbf{A} \cdot 
\vec{q}}{2}-\frac{\lambda}{4!}q^4 \right) = \langle q_i \cdots q_j \rangle 
\end{eqnarray} 

Now G is a rank 's' tensor, and we interpret J physically, as an excitation of 
the system, but in statistics, this is just an offset to the total random 
vector q. The matrix A is the covariance matrix, or our multidimensional 
second cumulant -- rank 2 tensor -- from before. We can immediately write down 
the two point Green's function for this expansion to zeroth and first loop 
order: 

\begin{eqnarray} 
G_{ij} &amp;=&amp; \mathbf{A}^{-1}_{ij}-\lambda \left( \sum_n  
\mathbf{A}^{-1}_{in} \mathbf{A}^{-1}_{jn} \mathbf{A}^{-1}_{nn} \right) 
\end{eqnarray} 

Which, in statistics-speak reads: 

\begin{eqnarray} 
G_{ij} &amp;=&amp; \underline{\underline{c_2}}_{ij}-\lambda \left( \sum_n 
\underline{\underline{c_2}}_{in}\underline{\underline{c_2}}_{jn}\underline{\underline{c_2}}_{nn} 
\right) 
\end{eqnarray} 

Those underlines are messy, but we now see that we are taking into account 
cross correlation between two variables -- labeled by subscripts i and j -- as 
well as "one-loop" terms which allow for correlation with some intermediate 
variable "n", and even accounting for "n"'s correlation with itself. I think 
this is the correct interpretation, and if one were to allow even more 
expansion, we'd have 

\begin{eqnarray} 
G_{ij} &amp;=&amp; \mathbf{A}^{-1}_{ij}-\lambda \left( \sum_n  
\mathbf{A}^{-1}_{in} \mathbf{A}^{-1}_{jn} \mathbf{A}^{-1}_{nn} 
+\mathbf{A}^{-1}_{ij}\mathbf{A}^{-1}_{nn}\mathbf{A}^{-1}_{nn}\right) 
\end{eqnarray} 


for the two-point green's function to oneloop order. This third term 
corresponds to a "disconnected" diagram, since the point -- or random variable 
-- n is in no way correlated with the initial "source" points i and j. 

Now to write the total generating function, we would have something like 

\begin{eqnarray} 
Z(J) &amp;=&amp; \left(\frac{(2\pi)^N}{\vert \mathbf{A}\vert 
}\right)^{1/2}\left[1+\vec{J}\cdot \mathbf{A}^{-1}\cdot \vec{J} -\lambda 
\vec{J}_i (\sum_n  \mathbf{A}^{-1}_{in} \mathbf{A}^{-1}_{jn} 
\mathbf{A}^{-1}_{nn} 
+\mathbf{A}^{-1}_{ij}\mathbf{A}^{-1}_{nn}\mathbf{A}^{-1}_{nn})\vec{J}_j 
\right] 
\end{eqnarray} 

It's a bit unclear where to go from here, but these green's functions 
certainly correspond to expectation values of a random vector. The question 
is, when on introduces anharmonicity into the field -- for instance a non-zero 
fourth cumulant -- what happens to our expectation values? And, how do we 
represent those new 2-point and 4-point green's functions diagrammatically? 