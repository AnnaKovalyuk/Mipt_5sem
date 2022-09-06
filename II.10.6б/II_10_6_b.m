N=10   %размер матрицы в СЛАУ Ax=f

%запись данных
i=2:1:N-1
s=2./i./i
f=[1,s,-3]' %записали вектор f
a1=[1 0 0 0 0 0 0 0 0 0]
for j=1:N-2
    for k=1:N
        a(j,k)=0
        if j==k || j+2==k
            a(j,k)=1
        elseif j+1==k 
            a(j,k)=-2
        end
    end
end 
a9=ones(1,9)*2
a10=[a9,1]
A=[a1;a;a10] %записали матрицу А 

[B,x_gauss]=Gauss(N,A,f) %получили B - верхнетреугольная матрица и вектор решений x 
[diag,Lmax,Lmin]=Lambda(N,B) %нашли Lmin и Lmax матрицы B по абсолютному значению

B_rev=inv(B)
[diag, L_rev_max, L_rev_min]=Lambda(N,B_rev) %нашли Lmin и Lmax матрицы B_rev по абсолютному значению

mu=Lmax*L_rev_max %число обусловленности

%--------------------------------------------------------------------------------------------
            
for k=1:N
    for j=k:N
        LD(j,k)=A(j,k)    
    end
end
U=A-LD         %Разложили матрицу А на LD и U

epsilon=10^(-15)        %Желаемая точность
x_zeidel=zeros(1,10)'   %Начальное приближение
for i=1:100
    p=x_zeidel
    x_zeidel=inv(LD)*(-U*x_zeidel+f)
    if Norm(N,x_zeidel-p)<epsilon
        break
    end
end

nev_gauss=f-A*x_gauss'      %невязки по обоим методам
nev_zeidel=f-A*x_zeidel     











