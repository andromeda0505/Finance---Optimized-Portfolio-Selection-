price= xlsread('price2.xlsx');
MVS01wt= xlsread('MVS01wt.xlsx');
ret= log(price(2:end,:)./price(1:end-1,:));
expret=(sum(ret)/519)*252;
expcov=cov(ret)*252;

MVS01ret= MVS01wt*expret';
N=8;

MVS01var=0;
for l= 1:N;
    for m= 1:N;
        MVS01var= MVS01var+((MVS01wt(:,l).*MVS01wt(:,m))*expcov(l,m));
    end;
end;
MVS01ris= sqrt(MVS01var);

m1= MVS01wt*expret';
m2= MVS01var+(m1.^2);
m3=0;
for i= 1:N;
    for j= 1:N;
        for k= 1:N;
            sijk= (sum(ret(:,i).*ret(:,j).*ret(:,k)))/519;
            m3= m3+((MVS01wt(:,i).*MVS01wt(:,j).*MVS01wt(:,k))*sijk);
        end;
    end;
end;
MVS01skew= (m3-(3*(m2.*m1))+(2*(m1.^3)))./((sqrt(MVS01var)).^3);

plot(MVS01ris,MVS01ret,'+-b')