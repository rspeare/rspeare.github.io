---
layout: post
title: Canonical Transformation and the word "Symplectic"
date: '2014-08-22T08:53:00.001-07:00'
author: Robert Speare
tags:
- Classical Mechanics
modified_time: '2015-10-16T07:56:22.795-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-7671606984436115901
blogger_orig_url: http://rspeare.blogspot.com/2014/08/canonical-transformation-and-word.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">There is this very 
frustrating thing in Lagrangian and Hamiltonian Mechanics, called a "canonical 
transformation", which supposedly simplifies the equations of motion and sets 
up all sorts of higher order analysis like Action Angle variables, the 
Hamilton-Jacobi equation, and canonical perturbation theory. 

The trouble is, it's hard to get a feel for these things. The basic building 
block of Hamiltonian mechanics is the equation[s] of motion: 

\begin{eqnarray} 
\frac{\partial H}{\partial q_i} &amp;=&amp; -\dot{p_i} \\ 
\frac{\partial H}{\partial p_i} &amp;=&amp; \dot{q_i} 
\end{eqnarray} 

We can write this more succinctly using a phase space vector, which I will 
call "z": 

\begin{eqnarray} 
\mathbf{z} &amp;=&amp; \left( q_1,q_2, \dots, q_n, p_1,p_2, \dots, p_n \right) 
\end{eqnarray} 

So z is a $2n$-dimensional vector in our $2n$-dimensional phase space. We can 
now write the equations of motion using a a strange matrix, $\Omega$: 

\begin{eqnarray} 
\Omega &amp;=&amp; \left(\begin{array}{cc} 
0 &amp; I_n \\ -I_n &amp; 0 
\end{array} \right) 
\end{eqnarray} 

Where $I_n$ represent $n$-dimensional identity matrices, with ones along the 
diagonal, and the zeros represent $n$-by-$n$ zero matrices. This $\Omega$ is 
what we call a block diagonal matrix, in that it can be decomposed into the 
four "blocks" I have written above. We could also write it as a Direct product 
of two matrices, the $n$-by-$n$ identity and one of the pauli spin matrices 
(which is also a rotation about the $xy$ plane of 90 degrees): 

\begin{eqnarray} 
i \sigma_2 &amp;=&amp;  \left(\begin{array}{cc} 
0 &amp; 1 \\ -1 &amp; 0 
\end{array} \right)\\ 
\Omega &amp;=&amp; I_n \bigotimes i \sigma_2 
\end{eqnarray} 

Now, we can write Hamilton's equation of motion in the following form: 

\begin{eqnarray} 
\frac{dz_i}{dt} &amp;=&amp; \Omega_{ij} \frac{\partial H}{\partial z_j} 
\end{eqnarray} 

Another way to use this tidy notation is in the poisson bracket: 

\begin{eqnarray} 
\left[A_i,B_j \right] &amp;=&amp; \sum_k \left(\frac{A_i}{q_k}\frac{B_j}{p_k}- 
\frac{A_i}{p_k}\frac{B_j}{q_k}\right) \\ 
&amp;=&amp; \frac{\partial A_i}{\partial z_k} \Omega_{km} \frac{\partial 
B_j}{\partial z_m}\\ 
\end{eqnarray} 

and one finds, if we compute the poisson bracket of some quantity $A_i$ with 
the Hamiltonian, we get a partial derivative with respect to time via 
chain-rule: 
\begin{eqnarray} 
\left[A_i,H \right] &amp;=&amp; \frac{\partial A_i}{\partial z_k} \Omega_{km} 
\frac{\partial H}{\partial z_m}\\ 
\left[A_i,H \right] &amp;=&amp; \frac{\partial A_i}{\partial z_k} 
\frac{\partial z_k}{\partial t} 
\end{eqnarray} 
and so we find, if our vector-valued function of interest $A_i$ is dependent 
upon $q,p,t$ or $z,t$, we can write our total time derivative as: 

\begin{eqnarray} 
\frac{dA_i}{dt} &amp;=&amp; \left[A_i,H\right] + \frac{\partial A_i}{\partial 
t} 
\end{eqnarray} 

The Hamiltonian is thus called the "generator" of time translation, because, 
let's say $A_i$ does not depend on t. In the quantum mechanics regime of 
things we would say it is  a Schrodinger operator. We could essentially 
translate the operator -- or in this case the function $A_i$ -- forward in 
time by taylor expansion: 

\begin{eqnarray} 
A_i(t) &amp;=&amp; A_i(0) + \frac{dA_i}{dt}\vert_{t_0}(t-t_0)+ 
\frac{d^2A_i}{dt^2}\vert_{t_0}\frac{(t-t_0)^2}{2!}+\dots 
\end{eqnarray} 

But this can be accomplished by repeatedly taking the commutator with H! 

\begin{eqnarray} 
A_i(t) &amp;=&amp; A_i(0) + \frac{dA_i}{dt}\vert_{t_0}(t-t_0)+ 
\frac{d^2A_i}{dt^2}\vert_{t_0}\frac{(t-t_0)^2}{2!}+\dots \\ 
A_i(t) &amp;=&amp; A_i(0) + (t-t_0) \left[A_i(0),H \right]+ 
\frac{(t-t_0)^2}{2!} \left[\left[A_i(0),H \right], H\right]+ 
\frac{(t-t_0)^3}{3!} \left[\left[\left[A_i(0),H \right], H\right],H \right] 
+\dots \\ 
&amp;=&amp; e^{\left[ \ast , H\right](t-t_0)}A_i(0) 
\end{eqnarray} 

This is in incredibly close parallel to the Baker-Hausdorff lemma in Quantum 
mechanics, which essentially makes time-dependent operators -- in the 
Heisenberg picture -- by repeatedly taking commutators on "both sides" of a 
bra-ket operator. If we promote the Hamiltonian to be an operator, then we 
write: 

\begin{eqnarray} 
A_i(t) &amp;=&amp; 
e^{\frac{iH(t-t_0)}{\hbar}}A_i(0)e^{\frac{-iH(t-t_0)}{\hbar}} 
\end{eqnarray} 

where the commutators are no longer in the classical sense, but in the 
``operator'' sense. 


--------------------------------------------------------------------------------------------------------------------------------- 

So, why do we care about all these commutators and things? Well, a simple 
reason is that if we are to have a "valid" canonical transformation, we must 
show that the Hamiltonian Equations of motion remain untarnished.  Let's look 
at our nice form of the EOM again: 

\begin{eqnarray} 
\frac{dz_i}{dt} &amp;=&amp; \Omega_{ij} \frac{\partial H}{\partial z_j} 
\end{eqnarray} 

we can re-write this with a Poisson bracket 

\begin{eqnarray} 
\frac{dz_i}{dt} &amp;=&amp; \left[z_i,H \right] \\ 
&amp;=&amp; \frac{\partial z_i}{\partial z_k}\Omega_{km} \frac{\partial 
H}{\partial z_m}\\ 
dz_i &amp;=&amp; \frac{\partial z_i}{\partial z_k}\Omega_{km} \frac{\partial 
H}{\partial z_m}dt 
\end{eqnarray} 

Now let us transform into some new coordinate system 
$\mathbf{y}=\left(Q_1,Q_2,\dots, Q_n, P_1,P_2,\dots P_n \right)$. We find that 
all of the $dz$'s can be written as: 

\begin{eqnarray} 
dz_i &amp;=&amp; \frac{\partial z_i}{\partial y_j} dy_j \\ 
dz_i &amp;=&amp; J_{ij}^{-1} dy_j 
\end{eqnarray} 
The matrix we have used above is simply the standard jacobian, 
$\mathbf{J}_{ij}=\frac{\partial y_i}{\partial z_j}$. Remember $J^TJ=I$. Now we 
re-write our EOM in the y-coordinates: 

\begin{eqnarray} 
dz_i &amp;=&amp; \frac{\partial z_i}{\partial z_k}\Omega_{km} \frac{\partial 
H}{\partial z_m}dt \\ 
dz_i &amp;=&amp; \delta_{ik}\Omega_{km} \frac{\partial H}{\partial z_m}dt \\ 
J_{ij}^{-1} dy_j &amp;=&amp; \delta_{ik} \Omega_{km} J_{mi}\frac{\partial 
H}{\partial y_i}dt \\ 
\end{eqnarray} 

Multiplying both sides by $J_{ij}$ we get: 
\begin{eqnarray} 
dy_j &amp;=&amp; J_{kj} \Omega_{km} J_{mi}\frac{\partial H}{\partial y_i}dt \\ 
\frac{dy_j}{dt} &amp;=&amp; J_{kj} \Omega_{km} J_{mi}\frac{\partial 
H}{\partial y_i} \\ 
\end{eqnarray} 

Now, we say this final equation is valid if it reproduces the standard 
equations of motion: 

\begin{eqnarray} 
\frac{dy_j}{dt} &amp;=&amp; \left[ y_j, H \right] 
\end{eqnarray} 

Which will only be true if this jacobian transformation preserves the 
structure of our original $Omega$ matrix: 

\begin{eqnarray} 
\Omega_{ij} &amp;=&amp; J_{ki}\Omega_{km}J_{mi}\\ 
\mathbf{\Omega} &amp;=&amp; \mathbf{J}^T\mathbf{\Omega}\mathbf{J} 
\end{eqnarray} 

such a transformation $q,p \to Q,P$ is called "simplectic" or ``canonical'', 
which in my mental dictionary, means that it preserves the structure of this 
matrix $\Omega$ and thus the Poisson brackets/fundamental commutation 
relations: 

\begin{eqnarray} 
\left[ z_i, z_j \right] &amp;=&amp; \Omega_{ij} \\ 
\left[ y_i, y_j \right] &amp;=&amp; \Omega_{ij} 
\end{eqnarray} 

Just like the Lorentz boosts leave the minkowksi metric $\eta$ invariant. This 
set of linear transformations $\mathbf{J}$ can be thought of as a 
representation of the simplectic ``group'', which are continuously connected 
to the identity operation. 

--------------------------------------------------------------------------------------------------------------------------------- 

Now one way to define these canonical transformations is to add a total time 
derivative to the lagrangian: 

\begin{eqnarray} 
L(q,Q,t) &amp;=&amp; L(q,\dot{q},t) - \frac{dF(q,Q,t)}{dt} 
\end{eqnarray} 

Such a "generator" of the canonical transformation is called type 1, because 
it exchanges Q for $\dot{q}$. We allow ourselves to add this total time 
derivative to the Lagrangian, because Hamilton's principle states that we are 
only interested in minimizing the action through variation: 

\begin{eqnarray} 
S &amp;=&amp; \int L dt \\ 
S^\prime &amp;=&amp; \int L - \frac{dF}{dt}dt=S+constant \\ 
\delta S &amp;=&amp; \int \left( \frac{\partial L}{\partial 
q}-\frac{d}{dt}\frac{\partial L}{\partial \dot{q}}\right)\delta q dt \\ 
\delta S = \delta S^\prime 
\end{eqnarray} 

so we don't care about adding total time derivatives. (Notice that I have not 
allowed $F$ to be a function of the generalized coordinate velocity, $\dot{q}$ 
this is because when varying the action, any dependence upon $\dot{q}$ will 
result in non-zero terms outside the functional integral, so we need to be 
careful here! In field theory, we find that adding a total derivative 
$\partial_\mu X^\mu$ to the lagrangian results in the same action as well, so 
perhaps this can also be thought of as a type I canonical transformation...) 

Pounding through the same equations of motion, we find that, if we want our 
new Lagrangian to only depend upon q,Q and t, we require: 

\begin{eqnarray} 
L^\prime(q,Q,t) &amp;=&amp; L - \frac{\partial F}{\partial t}- \frac{\partial 
F}{\partial q}\dot{q}- \frac{\partial F}{\partial Q}\dot{Q}\\ 
\frac{\partial L^\prime}{\partial \dot{q}} =0 &amp;\implies 
&amp;\frac{\partial L}{\partial \dot{q}}=p=\frac{\partial F}{\partial q}\\ 
\end{eqnarray} 

and we make the definition of a new momentum variable 
\begin{eqnarray} 
P=\frac{\partial L^\prime}{\partial \dot{Q}}=-\frac{\partial F}{\partial Q} 
\end{eqnarray} 

 With these two definitions in hand, we have essentially defined our new phase 
space vector $\mathbf{y}_i$. So, we can check out the NEW fundamental 
commutation relations 

\begin{eqnarray} 
\left[ Q,P \right] &amp;=&amp; \frac{\partial Q}{\partial q}\frac{\partial 
P}{\partial p}-\frac{\partial Q}{\partial p}\frac{\partial P}{\partial q} \\ 
\left[ Q, P \right] &amp;=&amp; -\frac{\partial Q}{\partial q}\frac{\partial^2 
F}{\partial p \partial Q}+\frac{\partial Q}{\partial p}\frac{\partial^2 
F}{\partial Q\partial q} \\ 
&amp;=&amp; \frac{\partial Q}{\partial p}\frac{\partial p}{\partial Q} \\ 
&amp;=&amp; 1 
\end{eqnarray} 

Trivially, we expect $\left[Q,Q \right]=\left[P,P \right]=0$, and so it all 
works out. Further generators of the canonical transformation can be created 
using the legendre transform. 