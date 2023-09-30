using Temporal, Indicators, Plots


function show_momentum(; order::String="CHRIS/CME_CL1", row::Int=252)
    X = quandl("CHRIS/CME_CL1", rows=252, sort='d')
    x = cl(X)
    #x.fields[1] = :Crude
    
    m = macd(x)
    r = rsi(x)
    p = psar(hl(X))
    
    f1 = plot(x, linewidth=3, color=:black)
    scatter!(p, color=:blue, markersize=2)
    f2 = plot(m, linewidth=2, color=[:green :cyan :orange])
    hline!([0.0], linestyle=:dash, color=:grey, label="")
    f3 = plot(r, linewidth=2, color=:gold)
    hline!([20, 80], linestyle=:dot, color=[:green, :red], label="")
    p = plot(f1, f2, f3, layout=@layout[a{0.6h}; b{0.2h}; c{0.2h}])
    return p 

end