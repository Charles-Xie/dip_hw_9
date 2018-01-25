# Question I

Answer for question 1, assignment 3 

name: Chi Xie

student id: 1552636

school: SSE, tongji University

## Subquestion 1

$C = \frac{\sum_{i=1}^n(x_i-\mu)(x_i-\mu)^T}{n-1}$, where $\mu = \frac{1}{n}\sum_{i=1}^nx_i$, and $x_i \in R^{p\times1}$. 

Thus, $C \in R^{p \times p}$. 

Let
$$
x_i = \left[\begin{matrix}a_1\\\dots\\a_p\end{matrix}\right]
$$
Then
$$
C_i = (x_i-\mu)(x_i-\mu)^T = \left[\begin{matrix}a_1a_1\ a_1a_2\ \dots\ a_1a_p\\a_2a_1\ a_2a_2\ \dots\ a_2a_p\\\dots\\a_pa_1\ a_pa_2\ \dots\ a_pa_p\end{matrix}\right]
$$
Because $C_i(m,n) = C_i(n,m)$, $C_i$ is a symmetric matrix. 

So $C$ is a symmetric matrix, too. 

Therefore, $C = C^T$.

Assume that $\alpha_1\ and\ \alpha_2$ are two eigen-vectors corresponding to the largest eigen value $\lambda_1$ and second largest eigen value $\lambda_2$ of $C$

Then $C\alpha_1 = \lambda_1\alpha_1$ and $C\alpha_2 = \lambda_2\alpha_2$. 

So $\alpha_2^TC^T = \lambda_2\alpha_2^T$, which means $\alpha_2^TC^T\alpha_1 = \lambda_2\alpha_2^T\alpha_1$.

Thus, $\alpha_2^TC\alpha_1 = \lambda_2\alpha_2^T\alpha_1$. 

Because $C\alpha_1 = \lambda_1\alpha_1$, we have $\lambda_1\alpha_2^T\alpha_1 = \lambda_2\alpha_2^T\alpha_1$, namely $(\lambda_1 - \lambda_2)\alpha_2^T\alpha_1 = 0$.

Because $\lambda_1 \neq \lambda_2$, $\alpha_2^T\alpha_1 = 0$. It means the dot product of $\alpha_1$ and $\alpha_2$ is zero, that is to say, $\alpha_1$ and $\alpha_2$ are orthogonal.

## Subquestion 2

$var(\alpha^TX)$ is the variance of the data projects along $\alpha$. 

Assume that $\alpha$ is a unit vector.

Then we have $var(\alpha^TX) =  \frac{1}{n-1}\sum_{i=1}^n(\alpha^Tx_i-\alpha^T\mu)^2 = \frac{1}{n-1}\sum_{i=1}^n\alpha^T(x_i-\mu)(x_i-\mu)^T\alpha = \alpha^TC\alpha$

where $\mu = \frac{1}{n}\sum_{i=1}^n\!x_i\ and\ C = \frac{1}{n-1}\sum_{i=1}^n(x_i-\mu)(x_i-\mu)^T$.

If $\alpha$ is orthogonal to $\alpha_1$, we have $\alpha^T\alpha_1 = 0$. Also, because $\alpha$ is a unit vector, $\alpha^T\alpha = 1$.

Based on Lagrange multiplier method, if we want to identify the orientation with largest variance, we have $\frac{d(\alpha^TC\alpha-\lambda_3(\alpha^T\alpha-1)-\lambda_4\alpha^T\alpha_1}{d\alpha} = 2C\alpha-2\lambda_3\alpha-\lambda_4\alpha_1 = 0$.

Then $2\alpha_1^TC\alpha-2\lambda_3\alpha_1^T\alpha-\lambda_4\alpha_1^T\alpha_1 = 2\alpha_1^TC\alpha-\lambda_4 = 0$.

So, $\alpha_1^TC\alpha = \frac{\lambda_4}{2}$. 

So, $\alpha^TC\alpha_1 = \frac{\lambda_4}{2}$. 

Because $C\alpha_1 = \lambda_1\alpha_1$,$\lambda_1\alpha^T\alpha_1 = \frac{\lambda_4}{2}$, which means $\lambda_4 = 0$.

Note that $\begin{equation}\begin{cases}2C\alpha-2\lambda_3\alpha-\lambda_4\alpha_1 = 0\\\lambda_4 = 0\end{cases}\end{equation}$, so $C\alpha = \lambda_3\alpha$. That means $\alpha$ must be an eigen vector of C. Then $var(\alpha^TX) = \alpha^TC\alpha = \alpha^T\lambda_3\alpha = \lambda_3$.

If $\alpha$ is orthogonal to $\alpha_1$, $\alpha$ must be an eigen vector of C. 

So, the bigger the eigen value is, the bigger the variance of the data projects along $\alpha$ is. 

Because $\alpha_2$ is associated with the second largest eigen value of $C$, the variance of the data projects along $\alpha_2$ is the second largest one (and the variance along $\alpha_1$ is the largest one).  

So it is the largest one among all the orientation orthogonal to $\alpha_1$.

# Question II

Please read [./Q2/README_Q2.md](./Q2/README_Q2.md) or [./Q2/README_Q2.pdf](./Q2/README_Q2.pdf)