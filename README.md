### Expected outcome of the TCEC 15 superfinal

Probabilities of winning the whole match after 44 games, 8 LC0 wins and 4 Stockfish wins:

|LC0|Stockfish|
|---|---|
| 92.9 % | 7.1 % |

Score probabilities:

| Score | Probability |
|-|-|
| 53.5:46.5 | 8.5 % |
| 53.0:47.0 | 8.3 % |
| 54.0:46.0 | 8.2 % |
| 52.5:47.5 | 7.8 % |
| 54.5:45.5 | 7.6 % |
| 52.0:48.0 | 6.9 % |
| 55.0:45.0 | 6.8 % |
| 51.5:48.5 | 5.9 % |
| 55.5:44.5 | 5.8 % |
| 51.0:49.0 | 4.8 % |
| 56.0:44.0 | 4.7 % |
| 50.5:49.5 | 3.7 % |
| 56.5:43.5 | 3.7 % |
| 57.0:43.0 | 2.8 % |
| 57.5:42.5 | 2.0 % |
| 49.5:50.5 | 2.0 % |
| 58.0:42.0 | 1.4 % |
| 49.0:51.0 | 1.4 % |
| 58.5:41.5 | 1.0 % |
| 48.5:51.5 | 0.9 % |

---

**About**

This script computes the expected result of the ongoing match between LC0 and Stockfish using Bayesian inference. It works like this:

1. Assume a prior probability distribution for LC0's win/draw/loss probabilities. I chose the Dirichlet(3, 24, 3) prior. Dirichlet is basically a probability distribution over categorical probability distributions.

2. Compute the posterior distribution based on the games played so far. This is simply Dirichlet(3 + wins, 24 + draws, 3 + losses).

3. Perform millions of simulations of the rest of the match. Each simulation first draws specific win/draw/loss probabilities from the posterior Dirichlet distribution and then simulates the rest of the match.

---

**Choosing the prior**

The Dirichlet(3, 24, 3) prior provides a weakly held belief that the win/draw/loss probabilities are somewhere around 10%/80%/10%. It represents our state of knowledge when we start with Dirichlet(0, 0, 0) and observe 3 wins, 24 draws and 3 losses.
