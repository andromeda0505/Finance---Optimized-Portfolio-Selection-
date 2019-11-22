price= xlsread('price2.xlsx');
MVS10wt= xlsread('MVS10wt.xlsx');
ret= log(price(2:end,:)./price(1:end-1,:));
expret=(sum(ret)/519)*252;
expcov=cov(ret)*252;

MVS10ret= MVS10wt*expret';
N=8;

MVS10var=0;
for l= 1:N;
    for m= 1:N;
        MVS10var= MVS10var+((MVS10wt(:,l).*MVS10wt(:,m))*expcov(l,m));
    end;
end;
MVS10ris= sqrt(MVS10var);

m1= MVS10wt*expret';
m2= MVS10var+(m1.^2);
m3=0;
for i= 1:N;
    for j= 1:N;
        for k= 1:N;
            sijk= (sum(ret(:,i).*ret(:,j).*ret(:,k)))/519;
            m3= m3+((MVS10wt(:,i).*MVS10wt(:,j).*MVS10wt(:,k))*sijk);
        end;
    end;
end;
MVS10skew= (m3-(3*(m2.*m1))+(2*(m1.^3)))./((sqrt(MVS10var)).^3);

plot(MVS10ris,MVS10ret,'o-r')