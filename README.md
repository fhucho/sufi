### Expected outcome of the TCEC 15 superfinal

Probability of winning the whole match after 74 games, 10 LC0 wins and 5 Stockfish wins:

|LC0|Stockfish|
|---|---|
| 99.5 % | 0.5 % |

| Score | Probability |
|-|-|
| 53.0:47.0 | 18.4 % |
| 52.5:47.5 | 16.7 % |
| 53.5:46.5 | 16.1 % |
| 52.0:48.0 | 11.9 % |
| 54.0:46.0 | 11.5 % |
| 54.5:45.5 | 6.9 % |
| 51.5:48.5 | 6.9 % |
| 55.0:45.0 | 3.5 % |
| 51.0:49.0 | 3.3 % |
| 55.5:44.5 | 1.6 % |
| 50.5:49.5 | 1.4 % |
| 56.0:44.0 | 0.6 % |

---

**About**

This script computes the expected result of the ongoing match between LC0 and Stockfish using Bayesian inference. It works like this:

1. Assume a prior probability distribution for LC0's win/draw/loss probabilities. I chose the Dirichlet(3, 24, 3) prior. Dirichlet is basically a probability distribution over categorical probability distributions.

2. Compute the posterior distribution based on the games played so far. This is simply Dirichlet(3 + wins, 24 + draws, 3 + losses).

3. Perform millions of simulations of the rest of the match. Each simulation first draws specific win/draw/loss probabilities from the posterior Dirichlet distribution and then simulates the rest of the match.

---

**Choosing the prior**

The Dirichlet(3, 24, 3) prior provides a weakly held belief that the win/draw/loss probabilities are somewhere around 10%/80%/10%. It represents our state of knowledge when we start with Dirichlet(0, 0, 0) and observe 3 wins, 24 draws and 3 losses.
