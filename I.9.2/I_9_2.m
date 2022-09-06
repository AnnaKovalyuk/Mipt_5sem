x=1.92:0.0001:2.08
y=(x-2).^9
hold all
plot (x,y)
a=[-512 2304 -4608 5376 -4032 2016 -672 144 -18 1]
p0=zeros(1,1601)
for j=1:1601
   p=a(10)
    for i=1:9
        p=x(j)*p+a(10-i)
    end
    p0(j)=p
end
plot(x,p0)

