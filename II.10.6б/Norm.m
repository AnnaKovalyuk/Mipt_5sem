function f=Norm(N,x)
sum=0
for i=1:N
    sum=sum+x(i)^2
end
f=sqrt(sum)
