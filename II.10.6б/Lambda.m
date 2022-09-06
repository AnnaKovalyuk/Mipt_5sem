function [diag,Lmax,Lmin]=Lambda(N,B)
diag=zeros(1,10)
for j=1:N
    for k=1:N
        if j==k
            diag(j)=abs(B(j,k))
        end
    end
end 
Lmax=max(diag)
Lmin=min(diag)
