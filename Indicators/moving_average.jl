using Temporal, Indicators, Plots


function show_quantl(;order::String="CHRIS/CME_CL1", row::Int=250)
    X = quandl(order, rows=row, sort='d')
    x = cl(X)
    mafuns = [sma, ema, wma, trima]
    m = hcat([f(x, n=floor(Int, row/10)) for f in mafuns]...)
    
    
    p = plot(dpi=300)
    p = plot!(x, linewidth=3, color=:black)
    p = plot!(m, linewidth=2)
    
    return p
end

