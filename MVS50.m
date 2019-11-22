price= xlsread('price2.xlsx');
MVS50wt= xlsread('MVS50wt.xlsx');
ret= log(price(2:end,:)./price(1:end-1,:));
expret=(sum(ret)/519)*252;
expcov=cov(ret)*252;

MVS50ret= MVS50wt*expret';
N=8;

MVS50var=0;
for l= 1:N;
    for m= 1:N;
        MVS50var= MVS50var+((MVS50wt(:,l).*MVS50wt(:,m))*expcov(l,m));
    end;
end;
MVS50ris= sqrt(MVS50var);

m1= MVS50wt*expret';
m2= MVS50var+(m1.^2);
m3=0;
for i= 1:N;
    for j= 1:N;
        for k= 1:N;
            sijk= (sum(ret(:,i).*ret(:,j).*ret(:,k)))/519;
            m3= m3+((MVS50wt(:,i).*MVS50wt(:,j).*MVS50wt(:,k))*sijk);
        end;
    end;
end;
MVS50skew= (m3-(3*(m2.*m1))+(2*(m1.^3)))./((sqrt(MVS50var)).^3);

plot(MVS50ris,MVS50ret,'v-g')