# European Call Option Pricing using Binomial Trees (CRR) in MATLAB

MATLAB implementation of the **Cox-Ross-Rubinstein (CRR)** binomial tree model to price European call options under geometric Brownian motion assumptions, including backward induction for dynamic delta hedging.

The underlying asset price is assumed to follow a geometric Brownian motion:

$$dS = \mu S dt + \sigma S dW$$

Using the Cox-Ross-Rubinstein parametrization, up ($u$) and down ($d$) movement factors are defined as:

$$u = e^{\sigma \sqrt{\Delta t}}, \quad d = \frac{1}{u} = e^{-\sigma \sqrt{\Delta t}}$$

The option value is calculated at $t=0$ using backward induction with risk-neutral probabilities:

$$V_n(\omega) = \frac{1}{1 + r \Delta t} \left[ \tilde{p} V_{n+1}(\omega H) + (1 - \tilde{p}) V_{n+1}(\omega T) \right]$$


The script also computes the replicating portfolio parameters at $t=0$:
- **Delta ($\Delta$):** The number of underlying shares needed for hedging.
- **Bond ($B$):** The position in the risk-free asset.
## Function Outputs

The function `[v, delta, B] = binomial(S, K, r, sigma, T, N)` returns the following key parameters at $t = 0$:

* **`v` (Option Price):**  
  The theoretical fair value (premium) of the European call option at time $t = 0$, calculated via backward induction from the terminal payoff tree.

* **`delta` ($\Delta$ - Hedge Ratio):**  
  The partial derivative of the option price with respect to the underlying asset price ($\frac{\partial V}{\partial S}$). In practice, it represents the exact number of shares of the underlying stock required at $t = 0$ to construct a risk-free delta-neutral replicating portfolio.

* **`B` (Risk-Free Bond Position):**  
  The amount of cash borrowed or lent in the risk-free asset at rate $r$ to finance the replicating portfolio at $t = 0$. It is calculated as $B = v - \Delta \cdot S_0$.
