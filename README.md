This script computes the expected result of the ongoing match between LC0 and Stockfish using Bayesian inference. It works like this:

1. Assume a prior probability distribution for LC0's win/draw/loss probabilities. I chose the Dirichlet(3, 24, 3) prior. Dirichlet is basically a probability distribution over Multinomial probability distributions. For example the chosen prior states that the win/draw/loss of 0.2/0.6/0.2 is much more likely than 0.9/0.1/0.0. 

2. Compute the posterior distribution based on the games played so far. This is simply Dirichlet(3 + wins, 24 + draws, 3 + losses).

3. Perform millions of simulations of the rest of the match. Each simulation first draws specific win/draw/loss probabilities from the posterior Dirichlet distribution and then simulates the rest of the match.

---

**Status after 28 games, 5 LC0 wins and 1 Stockfish win:**

|Engine|Win probability|
|---|---|
| LC0 | 94.6  % |
| Stockfish | 5.4% |

Probability that the match will be undecided after 100 games: 1.9%.
