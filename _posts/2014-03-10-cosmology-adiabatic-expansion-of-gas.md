---
layout: post
title: 'Cosmology: Adiabatic Expansion of a Gas'
date: '2014-03-10T23:36:00.001-07:00'
author: Robert Speare
tags:
- Adiabatic Expansion
- Equation of State
modified_time: '2014-03-10T23:37:09.218-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-4706988357193015541
blogger_orig_url: http://rspeare.blogspot.com/2014/03/cosmology-adiabatic-expansion-of-gas.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">For a quick reminder, an 
adiabatic process is one where there is no heat exchange between a system and 
its surroundings. This happens either because the process happens *so quickly* 
that the system "has no chance" to exchange heat, or the system is thermally 
insulated. Taking a look at the first law of thermodynamics for a gas, 

\begin{eqnarray} 
dU &amp;=&amp; dQ + dW \\ 
dU &amp;=&amp; -pdV 
\end{eqnarray} 

For an expanding universe, we can write the energy of our gas as being 
proportional to volume, which is proportional to the scale factor, cubed: 

\begin{eqnarray} 
d(\rho a^3) &amp;=&amp; -p d(a^3) 
\end{eqnarray} 

Putting in our equation of state $p=w \rho$, we find 

\begin{eqnarray} 
d(\rho a^3) &amp;=&amp; -w \rho d(a^3)\\ 
d\rho a^3 + \rho d(a^3) &amp;=&amp; -w \rho d(a^3)\\ 
d\rho a^3 &amp;=&amp; -(w+1) \rho d(a^3)\\ 
\frac{d\rho}{\rho} &amp;=&amp; \frac{d(a^3)}{a^3} 
\end{eqnarray} 

Integrating both sides, we get 

\begin{eqnarray} 
\rho &amp;=&amp; \rho_0 a^{-3(w+1)} 
\end{eqnarray} 