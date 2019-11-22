% This procedure shows the process of optimizing a portfolio of 8 assets from which
% selected among the largest companies of Tehran Stock Exchange, utilizing
% Genetic Algorithm.
Aeq= [1,1,1,1,1,1,1,1];
beq= 1;
LB= [0;0;0;0;0;0;0;0];
UB= [0.3;0.3;0.3;0.3;0.3;0.3;0.3;0.3];

options= gaoptimset('CrossoverFraction',0.65,'EliteCount',5,'PopulationSize',100,'PlotFcns',...
    @gaplotbestf);
[MVSwt,fval]= ga(@objfun,8,[],[],Aeq,beq,LB,UB,[],options);


