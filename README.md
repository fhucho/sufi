### Expected outcome of the TCEC 15 superfinal

Probability of winning the whole match after 69 games, 10 LC0 wins and 5 Stockfish wins:

|LC0|Stockfish|
|---|---|
| 99.2 % | 0.8 % |

| Score | Probability |
|-|-|
| 53.0:47.0 | 16.2 % |
| 53.5:46.5 | 15.2 % |
| 52.5:47.5 | 14.4 % |
| 54.0:46.0 | 12.1 % |
| 52.0:48.0 | 10.7 % |
| 54.5:45.5 | 8.3 % |
| 51.5:48.5 | 6.7 % |
| 55.0:45.0 | 5.0 % |
| 51.0:49.0 | 3.6 % |
| 55.5:44.5 | 2.6 % |
| 50.5:49.5 | 1.7 % |
| 56.0:44.0 | 1.3 % |
| 56.5:43.5 | 0.5 % |
| 49.5:50.5 | 0.3 % |
| 57.0:43.0 | 0.2 % |
| 51.5:50.5 | 0.1 % |
| 50.5:51.5 | 0.1 % |
| 49.0:51.0 | 0.1 % |
| 52.5:51.5 | 0.1 % |
| 51.5:52.5 | 0.1 % |

---

**About**

This script computes the expected result of the ongoing match between LC0 and Stockfish using Bayesian inference. It works like this:

1. Assume a prior probability distribution for LC0's win/draw/loss probabilities. I chose the Dirichlet(3, 24, 3) prior. Dirichlet is basically a probability distribution over categorical probability distributions.

2. Compute the posterior distribution based on the games played so far. This is simply Dirichlet(3 + wins, 24 + draws, 3 + losses).

3. Perform millions of simulations of the rest of the match. Each simulation first draws specific win/draw/loss probabilities from the posterior Dirichlet distribution and then simulates the rest of the match.

---

**Choosing the prior**

The Dirichlet(3, 24, 3) prior provides a weakly held belief that the win/draw/loss probabilities are somewhere around 10%/80%/10%. It represents our state of knowledge when we start with Dirichlet(0, 0, 0) and observe 3 wins, 24 draws and 3 losses.
