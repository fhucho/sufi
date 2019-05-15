This script computes the expected result of the ongoing match between LC0 and Stockfish using Bayesian inference. It works like this:

1. Assume a prior probability distribution for LC0's win/draw/loss probabilities. I chose the weakly informative Dirichlet(1, 6, 1). Dirichlet is basically a probability distribution over Multinomial probability distributions. For example, it states that the win/draw/loss of 0.2/0.4/0.2 is much more likely than 0.9/0.1/0.0. 

2. Compute the posterior distribution based on the games played so far. This is simply Dirichlet(1 + wins, 6 + draws, 1 + losses).

3. Perform millions of simulations of the rest of the match. Each simulation first draws specific win/draw/loss probabilities from the posterior Dirichlet distribution and then simulates the rest of the match.

---

**Status after 26 games, 5 LC0 wins and 1 Stockfish win:**

|Engine|Probability|
|---|---|
| LC0 | 96.7  % |
| Stockfish | 3.4% |
