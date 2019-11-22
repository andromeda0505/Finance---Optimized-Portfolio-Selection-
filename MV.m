% This is the procedure of optimizing a portfolio of 8 assets from which
% selected among the largest companies of Tehran Stock Exchange. The
% optimization method is the classic mean-variance method of Markowitz.
price= xlsread('price2.xlsx');
ret= log(price(2:end,:)./price(1:end-1,:));
expret= (sum(ret)/519)*252;
expcov= cov(ret)*252;
PVal= 1;
NumAssets= 8;
AssetMin= 0;
AssetMax= [0.3,0.3,0.3,0.3,0.3,0.3,0.3,0.3];
ConSet= portcons('PortValue',PVal,NumAssets,'AssetLims',AssetMin,AssetMax);
[MVris MVret MVwt]= portopt(expret,expcov,[],[],ConSet);
plot(MVris,MVret,'*-k')