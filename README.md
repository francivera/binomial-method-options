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

