**Status after 28 games, 5 LC0 wins and 1 Stockfish win:**

|Engine|Win probability|
|---|---|
| LC0 | 94.6  % |
| Stockfish | 5.4% |

Probability that the match will be undecided after 100 games: 1.9%.

---

**About**

This script computes the expected result of the ongoing match between LC0 and Stockfish using Bayesian inference. It works like this:

1. Assume a prior probability distribution for LC0's win/draw/loss probabilities. I chose the Dirichlet(3, 24, 3) prior. Dirichlet is basically a probability distribution over Multinomial probability distributions. For example the chosen prior states that the win/draw/loss of 20%/60%/20% is much more likely than 90%/10%/0%. 

2. Compute the posterior distribution based on the games played so far. This is simply Dirichlet(3 + wins, 24 + draws, 3 + losses).

3. Perform millions of simulations of the rest of the match. Each simulation first draws specific win/draw/loss probabilities from the posterior Dirichlet distribution and then simulates the rest of the match.

---

**Choosing the prior**

The Dirichlet(3, 24, 3) prior provides a weakly held belief that the win/draw/loss probabilities are 10%/80%/10%. It is our state of knowledge when we start with Dirichlet(0, 0, 0) and observe 3 wins, 24 draws and 3 losses.

The prior was changed from Dirichlet(1, 6, 1) because I realized that it gives basically no information about the relative strengths of the engines - but before the match began, we believed that they were approximately equal. Changing the prior changed the LC0's win probability from 96.8% to 94.65%.
