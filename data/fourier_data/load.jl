
lines=[]

open("test_complex.dat") do file
    for line in eachline(file)
        push!(lines,[parse(Complex{Float64},z) for z in split(line)])
    end
end

nTrials=length(lines)
nElectrodes=32
nFreq=58

#println("nTrials=",nTrials)
#println("nElectrodes=",nElectrodes)

a = zeros(Complex{Float64},(nTrials,nElectrodes,nFreq))

for i in 1:nTrials
    for j in 1:nElectrodes
        for k in 1:nFreq
            a[i,j,k]=lines[i][32*(k-1)+j]
        end
    end
end



phases=a./(abs.(a))

#println(phases[1,1,1])


itcps=(abs.(sum(phases,dims=1)./nTrials))

avItcp=sum(itcps,dims=2)/nElectrodes

avItcp = [avItcp[1,1,i] for i in 1:size(avItcp)[3]]

#println(size(avItcp))

for x in avItcp
    println(x)
end



