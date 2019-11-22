% price of 8 stocks on 03/25/2012
futprice0= [5096,2727,1450,4237,2839,2053,1223,2078];

% price of 8 stocks on 07/08/2012
futprice3m= [5440,2113,1550,4000,2735,2046,950,1593];

% price of 8 stocks on 09/25/2012
futprice6m= [7015,2691,1427,4980,2398,2122,1274,1799];

% price of 8 stocks on 03/17/2013
futprice1y= [11600,4221,1697,5749,2169,2060,976,3149];

ret3m= log(futprice3m ./ futprice0);
ret6m= log(futprice6m ./ futprice0);
ret1y= log(futprice1y ./ futprice0);

futret3mMV= MVwt*(ret3m');
futret6mMV= MVwt*(ret6m');
futret1yMV= MVwt*(ret1y');

futret3mEGP= EGPwt*(ret3m');
futret6mEGP= EGPwt*(ret6m');
futret1yEGP= EGPwt*(ret1y');

futret3mMVS01= MVS01wt*(ret3m');
futret6mMVS01= MVS01wt*(ret6m');
futret1yMVS01= MVS01wt*(ret1y');

futret3mMVS10= MVS10wt*(ret3m');
futret6mMVS10= MVS10wt*(ret6m');
futret1yMVS10= MVS10wt*(ret1y');

futret3mMVS50= MVS50wt*(ret3m');
futret6mMVS50= MVS50wt*(ret6m');
futret1yMVS50= MVS50wt*(ret1y');

avgfutret3mMV= mean(futret3mMV);
avgfutret6mMV= mean(futret6mMV);
avgfutret1yMV= mean(futret1yMV);

avgfutret3mEGP= futret3mEGP;
avgfutret6mEGP= futret6mEGP;
avgfutret1yEGP= futret1yEGP;

avgfutret3mMVS01= mean(futret3mMVS01);
avgfutret6mMVS01= mean(futret6mMVS01);
avgfutret1yMVS01= mean(futret1yMVS01);

avgfutret3mMVS10= mean(futret3mMVS10);
avgfutret6mMVS10= mean(futret6mMVS10);
avgfutret1yMVS10= mean(futret1yMVS10);

avgfutret3mMVS50= mean(futret3mMVS50);
avgfutret6mMVS50= mean(futret6mMVS50);
avgfutret1yMVS50= mean(futret1yMVS50);
