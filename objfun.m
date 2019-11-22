% This procedure is the objective function of the Genetic Algorithm
% optimization method.
function [a]= objfun(MVSwt)

theta= 0.01;
lambda= 0.9;

price= xlsread('price2.xlsx');
ret= log(price(2:end,:)./price(1:end-1,:));
expret=(sum(ret)/519)*252;
expcov=cov(ret)*252;

MVSret= MVSwt*expret';
N=8;

MVSvar=0;
for l= 1:N;
    for m= 1:N;
        MVSvar= MVSvar+(MVSwt(l)*MVSwt(m)*expcov(l,m));
    end;
end;

m1= MVSwt*expret';
m2= MVSvar+(m1^2);
m3=0;
for i= 1:N;
    for j= 1:N;
        for k= 1:N;
            sijk= (sum(ret(:,i).*ret(:,j).*ret(:,k)))/519;
            m3= m3+(MVSwt(i)*MVSwt(j)*MVSwt(k)*sijk);
        end;
    end;
end;
MVSskew= (m3-(3*m2*m1)+(2*(m1^3)))/((sqrt(MVSvar))^3);

a= (lambda*MVSvar)-((1-lambda)*MVSret)-(theta*MVSskew);