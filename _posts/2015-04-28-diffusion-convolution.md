---
layout: post
title: Diffusion, Convolution
date: '2015-04-28T11:27:00.003-07:00'
author: Robert Speare
tags: 
modified_time: '2015-04-28T11:33:03.869-07:00'
blogger_id: tag:blogger.com,1999:blog-3410852316732630293.post-6632125425858306141
blogger_orig_url: http://rspeare.blogspot.com/2015/04/diffusion-convolution.html
---

<div dir="ltr" style="text-align: left;" trbidi="on">The following notes are 
straight out of Howard Berg's ``Random Walks in Biology'' with a few ``fun'' 
additions. 
## Walker on a Line 

Let's look at a bunch of particles moving on a line in 1-D. Assume that after 
every time interval of $\tau$ seconds, our particles move with equal 
probability to the left or to the right, with some characteristic step size 
$\delta=v_x \tau$. It's important to note that 


(*) $v_x,\tau$ will depend on the size of our particle, and, since we're 
talking about Statistical Mechanics, the medium in which it is immersed, as 
well as the temperature. You should know this already since $kT \sim \langle m 
v_x^2 \rangle$. 

(*) The particle's steps at each moment should be thought of as independent, 
or, uncorrelated random variables; otherwise things will get very, very 
difficult. The snootier description of this point is the phrase i.i.d. : 
independently identically distributed, which means, if we write $s_i(n)$ as 
the $n^\mathrm{th}$ step of the $i^\mathrm{th}$ particle: 

\begin{eqnarray} 
\langle s_i(n) s_I(n+1) \rangle = 0 
\end{eqnarray} 

(*) We should also assume that each particle moves independently from all 
others. This is a simple boiler plate ``dilute'' or ideal assumption. 


If the probability of going right and left is equal -- let's say $p$ and $q$ 
respectively -- then we expect our particles to go nowhere on average. But, 
interestingly enough, the average of the \textit{square} of our displacement 
for each particle will be nonzero. If we denote $x_i(n)$ as the position of 
the $i^\mathrm{th}$ particle after $n$ steps, then 

\begin{eqnarray} 
\langle x_i(n)^2 \rangle \sim n 
\end{eqnarray} 

Which is typical of a diffusion process. 

## Linear Recurrence Relation 
The following \textbf{ linear recurrence relation} is a statement of our 
particle movement: 

\begin{eqnarray} 
x_i(n) &amp;=&amp; x_i(n-1) \pm \delta 
\end{eqnarray} 

After every time step $n-1 \to n$, we have some change to our position, which 
is plus or minus $\delta$. If we average over all our particles, we get 
something called the \textbf{Martingale} property: 

\begin{eqnarray} 
\langle x(n) \rangle &amp;=&amp; \frac{1}{N}\sum_{i=1}^N x_i(n)\\ 
 &amp;=&amp; \frac{1}{N}\sum_{i=1}^N x_i(n-1) \pm \delta 
\end{eqnarray} 
Since half our particles in the sum will have the plus sign, and half the 
negative our second term on the RHS sums to zero and we get: 

\begin{eqnarray} 
\langle x(n) \rangle &amp;=&amp; \langle x(n-1) \rangle 
\end{eqnarray} 

This is a fancier way of saying: the particles don't move, on average. But, 
what about the average of the \textbf{square} of $x(n)$? 

\begin{eqnarray} 
\langle x(n)^2 \rangle &amp;=&amp; \frac{1}{N}\sum_{i=1}^N x_i(n)^2\\ 
&amp;=&amp; \frac{1}{N}\sum_{i=1}^N \left( x_i(n-1)^2 \pm 2 \delta x_i(n-1) + 
\delta^2 \right) 
\end{eqnarray} 

Once again, our second term on the RHS will vanish as we sum, and we are left 
with: 

\begin{eqnarray} 
\langle x(n)^2 \rangle &amp;=&amp; \langle x(n-1)^2 \rangle+\delta^2 \\ 
&amp;=&amp; n \delta^2 
\end{eqnarray} 

Where in the second line I've worked back through all the recursive steps, 
assuming $\langle x^(0)\rangle=0$. So the variance of our particle position is 
linearly increasing with time! If we define $\frac{\delta^2}{2 \tau}=D$, we 
can write this as: 

\begin{eqnarray} 
\langle x^2(t) \rangle &amp;=&amp; \frac{t}{\tau} \delta^2 \\ 
\langle x^2(t) \rangle &amp;=&amp; 2 D t 
\end{eqnarray} 

## Convolution Approach 

But, you guys already knew this! Because we can view $\delta$ as a simple 
random variable drawn from some probability distribution $\delta \sim 
P(\delta)$. Let's examine the binomial distribution 

\begin{eqnarray} 
P(k,n) &amp;=&amp; p^k q^{n-k} \left(\begin{array}{c}n \\k \end{array}\right) 
\\ 
q &amp;=&amp; 1-p 
\end{eqnarray} 

This is the probability of $k$ ``successes'' after $n$ trials. It has the 
first two cumulants: 

\begin{eqnarray} 
\langle k \rangle &amp;=&amp; np \\ 
\langle k^2 \rangle -\langle k \rangle^2 &amp;=&amp; npq 
\end{eqnarray} 

For the time being, let's say that after every time interval $\tau$ that 
particle has only had one chance, one trial, to move left or right: this means 
we set $n=1$. (We will take the $n \to \infty$ limit later, which corresponds 
to Gaussian statistics and temporal coarse graining.) If we define a random 
variable $b$: 

\begin{eqnarray} 
b &amp;\sim&amp; P(k,1) \\ 
b &amp;=&amp; 0,1 
\end{eqnarray} 

we can scale this variable such that we get our proper $\pm \delta$ with 
probability $p$ and $q$ -- which are now no longer equal: 

\begin{eqnarray} 
s &amp;=&amp; 2b-1 \\ 
s &amp;=&amp; \pm 1 
\end{eqnarray} 

and so we write: 

\begin{eqnarray} 
x_i(n) &amp;=&amp; x_i(n-1)+s \delta 
\end{eqnarray} 

$b$ is now a random variable, expectation values: 

\begin{eqnarray} 
\langle b \rangle &amp;=&amp; p \\ 
\langle b^2 \rangle -\langle b \rangle^2 &amp;=&amp; pq \\ 
\langle b^2 \rangle &amp;=&amp; pq + p^2 
\end{eqnarray} 

which, means our statistics for $s$ are: 

\begin{eqnarray} 
\langle s \rangle &amp;=&amp; 2p-1=p-q \\ 
\langle s^2 \rangle &amp;=&amp; \langle 4b^2-4b+1 \rangle \\ 
&amp;=&amp; 4pq+4p^2-4p +1 \\ 
&amp;=&amp; 4pq+4p(p-1) + 1 \\ 
&amp;=&amp; 4pq - 4pq + 1\\ 
\langle s^2 \rangle &amp;=&amp;1\\ 
\langle s^2 \rangle -\langle s \rangle &amp;=&amp; 1-(p-q)^2 
\end{eqnarray} 

So to summarize: 

\begin{eqnarray} 
\langle s \rangle &amp;=&amp; 2p-1=p-q \\ 
\langle s^2 \rangle &amp;=&amp;1\\ 
\langle s^2 \rangle -\langle s \rangle &amp;=&amp; 1-(p-q)^2 
\end{eqnarray} 

We now have everything we need for our linear recurrence relation, and not 
that since $p\neq q$, we're going to have drifting particle. Treating all 
quantities now as random variables rather than ensemble averages over our 1-D 
``gas'' of walkers: 

\begin{eqnarray} 
\langle x_i(n) \rangle &amp;=&amp; \langle x_i(n-1) + s\delta \rangle \\ 
\langle x_i(n) \rangle &amp;=&amp; \langle x_i(n-1) \rangle + (p-q)\delta \\ 
\langle x_i(n) \rangle &amp;=&amp; n (p-q) \delta 
\end{eqnarray} 

We see that for $p=q$ we have no drift, or no net movement (martingale). For 
$p&gt;q$ we have net movement to the right (super-martingale) and $p&lt;q$ we 
have net movement to the left.  Now for variance: 

\begin{eqnarray} 
\langle x_i(n)^2 \rangle &amp;=&amp; \langle (x_i(n-1) + s\delta)^2 \rangle \\ 
\langle x_i(n)^2 \rangle &amp;=&amp; \langle x_i(n-1)^2 + s^2\delta^2 + 
2sx_i(n-1)  \rangle \\ 
\langle x_i(n)^2 \rangle &amp;=&amp; \langle x_i(n-1)^2 \rangle + \langle s^2 
\rangle \delta^2 + \langle 2sx_i(n-1)  \rangle \\ 
\langle x_i(n)^2 \rangle &amp;=&amp; \langle x_i(n-1)^2 \rangle + \delta^2 + 
\langle 2s \rangle \langle x_i(n-1)  \rangle 
\end{eqnarray} 

Using our former expression, we get: 

\begin{eqnarray} 
\langle x_i(n)^2 \rangle &amp;=&amp; \langle x_i(n-1)^2 \rangle + \delta^2 + 
\langle 2s \rangle n (p-q) \delta \\ 
\langle x_i(n)^2 \rangle &amp;=&amp; \langle x_i(n-1)^2 \rangle + \delta^2 + 
2(p-q)^2 n \delta 
\end{eqnarray} 

This last formula looks like a mess, and turns out to be much easier to write 
down the variance of $x_i(n)$: 

\begin{eqnarray} 
\langle x_i(n)^2 \rangle-\langle x_i(n) \rangle^2 &amp;=&amp; n \delta^2 
\left(1-(p-q)^2 \right) 
\end{eqnarray} 

Now, one might ask, how did I do this? You can do the grunt work, via ensemble 
averaging $\sum_{i=1}^N$ or using our equation above if you like, or you can 
\textbf{remember that} $x_i(n)$ \textbf{is drawn from a sum of random 
variables, which means convolution, which means sum of cumulants}! As we 
learned earlier in class, 

\begin{eqnarray} 
X_i &amp; \sim &amp; P(x) \\ 
Z &amp;=&amp; X_1+X_2 \\ 
P(Z) &amp;\sim &amp; (P \star P)(z) \\ 
\langle Z \rangle &amp;=&amp; \langle X_1 \rangle + \langle X_2 \rangle \\ 
\mathrm{Var}(Z)  &amp;=&amp; \mathrm{Var}(X_1) + \mathrm{Var}(X_2) 
\end{eqnarray} 

This makes it easy to write, down, immediately: 

\begin{eqnarray} 
E\left(x_i(n)\right) &amp;=&amp; n (p-q) \delta \\ 
\mathrm{Var}\left(x_i(n)\right) &amp;=&amp; n \delta^2 \left(1-(p-q)^2 \right) 
\end{eqnarray} 

For each and every particle, $x_i$. 

## The $n \to \infty$ limit 

Now, let's assume that we are quite lazy in observing our particle, and that, 
over each time interval $\tau$, it has in fact \textbf{many, many} 
opportunities to move right or left. This means that our distribution on step 
successes is a binomial: 

\begin{eqnarray} 
P(k,n) &amp;=&amp; p^k q^{n-k} \left(\begin{array}{c}n \\k \end{array}\right) 
\end{eqnarray} 

but, with $n$ very very large, and $np$ equal to some finite constant, $\mu$. 
It is a somewhat easy proof to show that in this limit, as $n \to \infty$ and 
$np=\mu$, $npq=\sigma^2$ our Binomial distribution becomes a Gaussian: 

\begin{eqnarray} 
P(k, `` \infty '') &amp;=&amp; \frac{1}{\sqrt{2\pi \sigma^2}} 
e^{\frac{(k-\mu)^2}{2\sigma^2}} 
\end{eqnarray} 

So now, our step variable, $\delta$ is drawn from some Gaussian distribution, 
with mean $\mu$ and variance $\sigma^2$. We won't do the tedious change of 
variables again here, because you see how this is done. The point is, we have 
gone from a binomial-choice process to a Gaussian one. And it's important to 
note that our walker, after sequence of $n$ steps can be viewed as a sum of 
independent $\delta$'s: 

\begin{eqnarray} 
x_i(n) &amp;=&amp; x_i(n-1)+\delta_n \\ 
x_i(n) &amp;=&amp; \sum_{j=1}^n \delta_j \\ 
\delta_j &amp;\sim &amp; \mathcal{N}(\mu,\sigma^2)=  \frac{1}{\sqrt{2\pi 
\sigma^2}} e^{\frac{(\delta-\mu)^2}{2\sigma^2}} 
\end{eqnarray} 

This means, by addition of cumulants alone, that: 

\begin{eqnarray} 
\mathrm{E}\left(x_i(n) \right) &amp;=&amp; n \mu \\ 
\mathrm{Var}\left(x_i(n) \right) &amp;=&amp; n \sigma^2 
\end{eqnarray} 

Once again, we find a non-zero drift -- possibly -- and a linear scaling of 
variance with time. It is important thing to note that 


(****)The convolution of a Gaussian is another Gaussian, with mean 
$\mu_{12}=\mu_1+\mu_2$ and variance $\sigma_{12}=\sigma_1+\sigma_2$. 

So, for example, if our particle is initially placed at position $x=0$, it's 
probability density is a dirac delta function: 

\begin{eqnarray} 
x_i(0) &amp;\sim &amp; \delta(x) 
\end{eqnarray} 

After a single step $\delta$, the new probability density is the convolution: 

\begin{eqnarray} 
\delta &amp;\sim &amp; P(\delta)= \frac{1}{\sqrt{2\pi \sigma^2}} 
e^{\frac{(\delta-\mu)^2}{2\sigma^2}}\\ 
x_i(1) &amp;=&amp; x_i(0)+\delta \\ 
x_i(1) &amp;\sim &amp; (\delta \star P)(x) \\ 
(\delta \star P)(x) &amp;=&amp; \int dx^\prime \delta(x-x^\prime) P(x^\prime) 
\\ 
&amp;=&amp; P(x)=\mathcal{N}(\mu,\sigma^2) 
\end{eqnarray} 

Or, just a Gaussian. So that was pretty easy, since the convolution of a 
function with Dirac delta is just the function itself. But what about after 
the second step? Then we have: 

\begin{eqnarray} 
x_i(2) &amp;\sim &amp; (P \star P)(x) \\ 
 (P \star P)(x) &amp;=&amp; \mathcal{N}(2\mu,2\sigma^2)=  \frac{1}{\sqrt{2\pi 
2\sigma^2}} e^{\frac{(x-2\mu)^2}{4\sigma^2}} 
\end{eqnarray} 

You can see how this goes, we are going to have: 

\begin{eqnarray} 
x_i(n) &amp; \sim &amp; (P \star P \star \cdots  \star P)(x)  \\ 
(P \star P \star \cdots  \star P)(x) &amp;=&amp; \mathcal{N}(n\mu,n\sigma^2)=  
\frac{1}{\sqrt{2\pi n\sigma^2}} e^{\frac{(x-n\mu)^2}{2n\sigma^2}} 
\end{eqnarray} 

This probability density is a Gaussian that is expanding its variance linearly 
with time and drifting with some $\mu$! If we denote $\sigma^2n=\sigma^2 
t/\tau=2Dt$, and $\frac{\mu}{\tau}=v$, we can write in more conventional form: 

\begin{eqnarray} 
P(x(t))&amp;=&amp; \mathcal{N}(vt,2Dt)=  \frac{1}{\sqrt{4\pi Dt}} 
e^{\frac{(x(t)-vt)^2}{4Dt}} 
\end{eqnarray} 
## What do you mean, Diffusion? 

Now, one way for us to think about flux, or the dynamics of many particles is 
to count how many are crossing a surface at each time step. If set a ``net'' 
in the $y-z$ plane at $x=\delta/2$, we can write the number of particles going 
through this net as: 

\begin{eqnarray} 
\frac{1}{2}\left(-N(x+\delta)+N(x) \right) 
\end{eqnarray} 

Since, half the particles on the left of the net -- $N(x)$ -- will move 
through it, to the right, and half the particles on the right of the net -- 
$N(x+\delta)$ -- will move through the opposite way, to the left. Dividing by 
the area of net and the amount of time $\tau$, we get flux: 

\begin{eqnarray} 
J_x &amp;=&amp; \frac{1}{2 A\tau}\left(-N(x+\delta)+N(x) \right) 
\end{eqnarray} 

and, multiplying by $\delta^2/\delta^2$, we can write 

\begin{eqnarray} 
J_x &amp;=&amp; \frac{\delta^2}{2\tau 
\delta}\left(\frac{-N(x+\delta)+N(x)}{\delta A} \right)\\ 
&amp;=&amp; \frac{\delta^2}{2\tau 
\delta}\left(-\rho(x+\delta)+\rho(x)\right)\\ 
 J_x &amp;=&amp; -\frac{\delta^2}{2 \tau \delta}\frac{\partial \rho}{\partial 
x} 
\end{eqnarray} 

and know we notice our former constant $\delta^2/\tau$ as $D$, 

\begin{eqnarray} 
J_x &amp;=&amp; - D \frac{\partial \rho}{\partial x} 
\end{eqnarray} 

or in more general form, since we could placed our surface along any axis: 

\begin{eqnarray} 
\vec{J} &amp;=&amp; - D \vec{\nabla}\rho(\mathbf{x}) 
\end{eqnarray} 

You see that flow will move down concentration gradients with some 
``reaction'' coefficient $D$. This Fick's first law, and if we combine it with 
the continuity equation -- which is really just a sanity check for 
conservation of particles -- we get Fick's second law: 

\begin{eqnarray} 
\vec{\nabla} \cdot \vec{J} + \frac{\partial \rho}{\partial t} &amp;=&amp; 0 \\ 
- D \nabla^2 \rho(\mathbf{x})+ \frac{\partial \rho}{\partial t} &amp;=&amp; 
0\\ 
\left(\frac{\partial}{\partial t}- D \nabla^2\right) \rho(\mathbf{x},t) 
&amp;=&amp; 0 
\end{eqnarray} 

This is the \textbf{diffusion} equation, and it shows that our concentration 
will only reach steady state when $\nabla^2 \rho = 0$. 

## Green's Function for the Diffusion equation 

Now, we would like to find something called a Green's function for the 
diffusion equation, which basically tells us, how does the system react if we 
put a tiny bit of particles at some point in space, at some point in time, 
$x,t$: 

\begin{eqnarray} 
\left(\frac{\partial}{\partial t}- D \nabla^2\right) G(\mathbf{x},t) 
&amp;=&amp;  \delta^D(x,t) 
\end{eqnarray} 

The term on the write is our source function, and basically says that at time 
$t=0$ we put a small amount of concentration at $x=0$. This equation can be 
solved analytically, and in fact, it is no different the Green's function for 
the Schrodinger equation of the free particle: 

\begin{eqnarray} 
\left(i\hbar \frac{\partial}{\partial t}+\frac{\hbar^2}{2m}\nabla^2 
\right)\psi(x,t) &amp;=&amp; V(x) \psi(x) 
\end{eqnarray} 

If we set $V(x)=0$ and $\frac{i\hbar}{2m}=D$ we just have the diffusion 
equation again. 

The best way to find a green's function, or a delta function response is by 
fourier transform. Let's write: 

\begin{eqnarray} 
G(x,t) &amp;=&amp; \int \frac{d^3 k d\omega}{(2\pi)^4} e^{i(kx-\omega 
t)}\tilde{G}(k,\omega) 
\end{eqnarray} 

This means: 

\begin{eqnarray} 
\tilde{G}(k,w) &amp;=&amp; \frac{i}{w-ik^2D}\\ 
G(x,t) &amp;=&amp; \int \frac{d^3k dw}{(2\pi)^4} \frac{i 
e^{i(kx-wt)}}{w-ik^2D} 
\end{eqnarray} 

The best way to approach this integral is via contour integration in the 
complex plane. We wick rotate first, and send $w \to -iw$ to get: 

\begin{eqnarray} 
G(x,t) &amp;=&amp; \int \int_{i \infty}^{-i \infty}\frac{d^3 k 
dw^\prime}{(2\pi)^4} \frac{e^{-w^\prime t}}{i(w^\prime-k^2 D)} 
\end{eqnarray} 

This integrand has a simple pole at $w^\prime=k^2 D$, and we now use the 
residue theorem to write: 

\begin{eqnarray} 
G(x,t) &amp;=&amp; \int \frac{d^3 k}{(2\pi)^2} \frac{2\pi i}{2\pi} 
\mathrm{Res}\left(\frac{e^{-w^\prime t}}{i(w^\prime-k^2 D)}\right) 
\end{eqnarray} 

We see that the $i$'s and $2\pi$'s cancle, and we are left with the fourier 
transform of  a gaussian: 

\begin{eqnarray} 
G(x,t)&amp;=&amp; \int \frac{d^3 k }{(2\pi)^3} e^{i \mathbf{k}\cdot 
\mathbf{x}- k^2 D t}\\ 
G(x,t) &amp;=&amp; \frac{1}{\sqrt{4\pi D t}}e^{-\frac{x^2}{4Dt}} 
\end{eqnarray} 

This Green's function, which is the delta function response of a diffusive 
system, is exactly the probability distribution we derived earlier, for a 
particle that initially had some probability density: 

\begin{eqnarray} 
P(x,t=0) &amp;=&amp; \delta^D(x) 
\end{eqnarray} 

and at later times: 

\begin{eqnarray} 
P(x,t) &amp;=&amp; \frac{1}{\sqrt{4\pi D t}}e^{-\frac{x^2}{4Dt}} 
\end{eqnarray} 

So, the Green's function is in fact the fundamental solution, or the  
probabilistic kernel for all diffusion problems. If we have some source of 
particles in a system, or, some source of probability flux -- since we are now 
treating both on the same grounds -- we have: 

\begin{eqnarray} 
\left( \frac{\partial}{\partial t}-D \nabla^2 \right)P(x,t) &amp;=&amp; j(x,t) 
\end{eqnarray} 

The solution to this in-homogeneous differential equation is a convolution of 
our source with our Green's function: 

\begin{eqnarray} 
P(x,t) &amp;=&amp; (G \star j)(x,t) \\ 
&amp;=&amp; \int d^3 x^\prime dt^\prime G(x-x^\prime, 
t-t^\prime)j(x^\prime,t^\prime) 
\end{eqnarray} 

We can now solve for the probability distribution of any system, for any 
``forcing'' function, or source $j(x,t)$, subject to diffusion. 
<div> 