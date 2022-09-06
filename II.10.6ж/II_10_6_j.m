N=100   %размер матрицы в СЛАУ Ax=f
%запись данных

a=20
for j=1:N
    for k=1:N
        if j==k 
            A(j,k)=a
        elseif j+1==k || j+2==k || j+3==k || j+4==k || j-1==k || j-2==k || j-3==k || j-4==k 
            A(j,k)=1
        end
    end
end              %записали матрицу А 
f=[1:1:100]'


[B,x_gauss]=Gauss(N,A,f) %получили B - верхнетреугольная матрица и вектор решений x 
[diag,Lmax,Lmin]=Lambda(N,B) %нашли Lmin и Lmax матрицы B по абсолютному значению

%B_rev=inv(B)
%[diag, L_rev_max, L_rev_min]=Lambda(N,B_rev) %нашли Lmin и Lmax матрицы B_rev по абсолютному значению

mu=Lmax*Lmin %число обусловленности

%--------------------------------------------------------------------------------------------
            
for k=1:N
    for j=k:N
        LD(j,k)=A(j,k)    
    end
end
U=A-LD         %Разложили матрицу А на LD и U

epsilon=10^(-15)        %Желаемая точность
x_zeidel=zeros(1,N)'   %Начальное приближение
for i=1:100
    p=x_zeidel
    x_zeidel=inv(LD)*(-U*x_zeidel+f)
    if Norm(N,x_zeidel-p)<epsilon
        break
    end
end

nev_gauss=f-A*x_gauss'      %невязки по обоим методам
nev_zeidel=f-A*x_zeidel     











