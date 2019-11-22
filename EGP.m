% This is the procedure of optimizing a portfolio of 8 assets from which
% selected among the largest companies of Tehran Stock Exchange. The
% optimization method is the method of Elton, Gruber, and Padberg.
price= xlsread('price2.xlsx');
ret= log(price(2:end,:)./price(1:end-1,:));
expcov= cov(ret)*252;
expret= (sum(ret)/519)*252;
expstd= std(ret)*sqrt(252);
N=8;

for i= 1:N,
    for j= 1:N,
        correl(i,j)= expcov(i,j)/(expstd(1,i)*expstd(1,j));
    end;
end;

s= 0;

for n= 1:N-1,
    s= s+sum(correl(n,n+1:end));
end;

rho= s/28;
rf= 0.3;
sigma=0;

for l= 1:N,
    sigma= sigma+sum((expret(l)-rf)/expstd(l));
end;

for k= 1:N,
    z(k)= (1/(1-rho))*(1/expstd(k))*(((expret(k)-rf)/expstd(k))-(rho/(1+(N-1)*rho))*sigma);
    if z(k)<0,
        z(k)=0;
    end;
end;

EGPwt= z./sum(z);
EGPret= EGPwt*expret';

EGPvar=0;
for x= 1:N;
    for y= 1:N;
        EGPvar= EGPvar+(EGPwt(x)*EGPwt(y)*expcov(x,y));
    end;
end;

EGPris= sqrt(EGPvar);
plot(EGPris,EGPret,'*-m')


