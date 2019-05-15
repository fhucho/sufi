using Distributions

function simulate(total, wins, losses, prior)
    N = 1e8
    draws = total - wins - losses
    games = 100 - total

    d = Dirichlet([prior[1] + wins, prior[2] + draws, prior[3] + losses])
    
    results = [0, 0, 0]
    stats = zeros(100)

    for i = 1:N
        theta = rand(d)
        m = Multinomial(games, theta)
        score = rand(m) + [wins, draws, losses]
        if score[1] > score[3]
            results[1] += 1
        elseif score[1] < score[3]
            results[3] += 1
        else
            results[2] += 1
            m = Multinomial(1, theta)
            while true
                score = rand(m) .+ rand(m)
                if score[1] > score[3]
                    results[1] += 1
                    break
                elseif score[3] > score[1]
                    results[3] += 1
                    break
                end
            end
        end
    end
    
    return round.(results / N * 100; digits=2)
end

println(simulate(26, 5, 1, [1, 6, 1]))
