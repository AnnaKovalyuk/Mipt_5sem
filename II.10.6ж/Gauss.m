function [B,x_gauss] = Gauss(N,A,f)
B=[A,f]
x_gauss=zeros(1,N)
for k=1:N-1
    for j=k+1:N
        B(j,:)=B(j,:)-B(k,:)*B(j,k)/B(k,k)
    end
end
sum=0
for k=N:-1:1
   sum = B(k,11);
   for j=k:N
     sum = sum-B(k,j)*x_gauss(j);
   end
   x_gauss(k) = sum/B(k,k);
end
B(:,N+1) = []
