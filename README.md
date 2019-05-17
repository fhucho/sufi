### TCEC 15 superfinal win probabilities

After 32 games, 5 LC0 wins and 1 Stockfish win.

|LC0|Stockfish|
|---|---|
| 94.2 % | 5.8 % |

---

**About**

This script computes the expected result of the ongoing match between LC0 and Stockfish using Bayesian inference. It works like this:

1. Assume a prior probability distribution for LC0's win/draw/loss probabilities. I chose the Dirichlet(3, 24, 3) prior. Dirichlet is basically a probability distribution over categorical probability distributions.

2. Compute the posterior distribution based on the games played so far. This is simply Dirichlet(3 + wins, 24 + draws, 3 + losses).

3. Perform millions of simulations of the rest of the match. Each simulation first draws specific win/draw/loss probabilities from the posterior Dirichlet distribution and then simulates the rest of the match.

---

**Choosing the prior**

The Dirichlet(3, 24, 3) prior provides a weakly held belief that the win/draw/loss probabilities are 10%/80%/10%. It represents our state of knowledge when we start with Dirichlet(0, 0, 0) and observe 3 wins, 24 draws and 3 losses.

The prior was changed from Dirichlet(1, 6, 1) because I realized that it gives basically no information about the relative strengths of the engines - but before the match began, we believed that they were approximately equal. Changing the prior changed LC0's win probability from 96.8% to 94.65%.
