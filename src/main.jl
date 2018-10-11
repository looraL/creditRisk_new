import Pkg
Pkg.activate(".")

include("CreditRisk.jl")

module tst

import Juno
import Serialization: serialize, deserialize
import Random: seed!
import Profile
import Profile: @profile
import BenchmarkTools: @btime, @benchmark
import Optim: ConjugateGradient

using Main.CreditRisk

n = 2500
c = 4
s = 2
l = 0.5
# nz = 80000
nz = 3000
ne = 3000
#param = Parameter(n,c,s,l)
fixed_para = CreditRisk.Parameter(n,c,s,l)
p2 = CreditRisk.glassermanli_mc_global(fixed_para, (nz, ne), "gl_global2.txt")
@time  p1 = CreditRisk.glassermanli_mc_local(fixed_para, (nz, ne), "gl_local2.txt")
display(p1)


#@time p = onelvl_mc(param, 10000)
#display(p)

# nrep = 10
# ls = range(0; stop=0.2, length=11)
# make_replications((ls, nrep), "glassermanli1.txt")
# ls = range(0.22; stop=0.4, length=10)
# make_replications((ls, nrep), "glassermanli2.txt")
# ls = range(0.42; stop=0.6, length=10)
# make_replications((ls, nrep), "glassermanli3.txt")
# ls = range(0.62; stop=0.8, length=10)
# make_replications((ls, nrep), "glassermanli4.txt")

end
