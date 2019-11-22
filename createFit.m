function createFit(MVS01ris,MVS01ret,MVS50ris,MVS50ret,MVS10ris,MVS10ret)
%CREATEFIT    Create plot of datasets and fits
%   CREATEFIT(MVS01RIS,MVS01RET,MVS50RIS,MVS50RET,MVS10RIS,MVS10RET)
%   Creates a plot, similar to the plot in the main curve fitting
%   window, using the data that you provide as input.  You can
%   apply this function to the same data you used with cftool
%   or with different data.  You may want to edit the function to
%   customize the code and this help message.
%
%   Number of datasets:  3
%   Number of fits:  3


% Data from dataset "MVS01ret vs. MVS01ris":
%    X = MVS01ris:
%    Y = MVS01ret:
%    Unweighted

% Data from dataset "MVS50ret vs. MVS50ris":
%    X = MVS50ris:
%    Y = MVS50ret:
%    Unweighted

% Data from dataset "MVS10ret vs. MVS10ris":
%    X = MVS10ris:
%    Y = MVS10ret:
%    Unweighted
%
% This function was automatically generated on 07-Jun-2013 15:14:04

% Set up figure to receive datasets and fits
f_ = clf;
figure(f_);
set(f_,'Units','Pixels','Position',[586 108 730 485]);
legh_ = []; legt_ = {};   % handles and text for legend
xlim_ = [0.37 -0.7];       % limits of x axis
ax_ = axes;
set(ax_,'Units','normalized','OuterPosition',[0 0 1 1]);
set(ax_,'Box','on');
grid(ax_,'on');
axes(ax_); hold on;


% --- Plot data originally in dataset "MVS01ret vs. MVS01ris"
MVS01ris = MVS01ris(:);
MVS01ret = MVS01ret(:);
h_ = line(MVS01ris,MVS01ret,'Parent',ax_,'Color',[0.333333 0 0.666667],...
    'LineStyle','none', 'LineWidth',1,...
    'Marker','.', 'MarkerSize',12);
xlim_(1) = min(xlim_(1),min(MVS01ris));
xlim_(2) = max(xlim_(2),max(MVS01ris));
legh_(end+1) = h_;
legt_{end+1} = 'MVS01ret vs. MVS01ris';

% --- Plot data originally in dataset "MVS50ret vs. MVS50ris"
MVS50ris = MVS50ris(:);
MVS50ret = MVS50ret(:);
h_ = line(MVS50ris,MVS50ret,'Parent',ax_,'Color',[0 0 0],...
    'LineStyle','none', 'LineWidth',1,...
    'Marker','.', 'MarkerSize',12);
xlim_(1) = min(xlim_(1),min(MVS50ris));
xlim_(2) = max(xlim_(2),max(MVS50ris));
legh_(end+1) = h_;
legt_{end+1} = 'MVS50ret vs. MVS50ris';

% --- Plot data originally in dataset "MVS10ret vs. MVS10ris"
MVS10ris = MVS10ris(:);
MVS10ret = MVS10ret(:);
h_ = line(MVS10ris,MVS10ret,'Parent',ax_,'Color',[0.333333 0.666667 0],...
    'LineStyle','none', 'LineWidth',1,...
    'Marker','.', 'MarkerSize',12);
xlim_(1) = min(xlim_(1),min(MVS10ris));
xlim_(2) = max(xlim_(2),max(MVS10ris));
legh_(end+1) = h_;
legt_{end+1} = 'MVS10ret vs. MVS10ris';

% Nudge axis limits beyond data limits
if all(isfinite(xlim_))
    xlim_ = xlim_ + [-1 1] * 0.01 * diff(xlim_);
    set(ax_,'XLim',xlim_)
else
    set(ax_, 'XLim',[0.41881026988669806, 0.66424266428638656]);
end


% --- Create fit "fit MVS01"
ok_ = isfinite(MVS01ris) & isfinite(MVS01ret);
if ~all( ok_ )
    warning( 'GenerateMFile:IgnoringNansAndInfs', ...
        'Ignoring NaNs and Infs in data' );
end
ft_ = fittype('poly4');

% Fit this model using new data
cf_ = fit(MVS01ris(ok_),MVS01ret(ok_),ft_);

% Or use coefficients from the original fit:
if 0
    cv_ = { -238.37180562932687, 586.84363211396578, -539.17323403546766, 219.66153018933861, -32.438788399798469};
    cf_ = cfit(ft_,cv_{:});
end

% Plot this fit
h_ = plot(cf_,'fit',0.95);
legend off;  % turn off legend from plot method call
set(h_(1),'Color',[1 0 0],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
legh_(end+1) = h_(1);
legt_{end+1} = 'fit MVS01';

% --- Create fit "fit MVS10"
ok_ = isfinite(MVS10ris) & isfinite(MVS10ret);
if ~all( ok_ )
    warning( 'GenerateMFile:IgnoringNansAndInfs', ...
        'Ignoring NaNs and Infs in data' );
end
st_ = [0.69988784992829156 0.63853075827183792 0.033603836066429471 0.068806099118051245 ];
ft_ = fittype('rat12');

% Fit this model using new data
cf_ = fit(MVS10ris(ok_),MVS10ret(ok_),ft_,'Startpoint',st_);

% Or use coefficients from the original fit:
if 0
    cv_ = { 3421.5359097189835, -1020.1505185122122, 1821.1678720606149, -42.27902539836905};
    cf_ = cfit(ft_,cv_{:});
end

% Plot this fit
h_ = plot(cf_,'fit',0.95);
legend off;  % turn off legend from plot method call
set(h_(1),'Color',[0 0 1],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
legh_(end+1) = h_(1);
legt_{end+1} = 'fit MVS10';

% --- Create fit "fit MVS50"
ok_ = isfinite(MVS50ris) & isfinite(MVS50ret);
if ~all( ok_ )
    warning( 'GenerateMFile:IgnoringNansAndInfs', ...
        'Ignoring NaNs and Infs in data' );
end
st_ = [0.58279096517584006 0.81539721147742117 0.87901390459717776 0.98891161607958911 0.00052237535694477089 ];
ft_ = fittype('rat22');

% Fit this model using new data
cf_ = fit(MVS50ris(ok_),MVS50ret(ok_),ft_,'Startpoint',st_);

% Or use coefficients from the original fit:
if 0
    cv_ = { 34.05020411881425, 66.959210951035914, 5.4321661028397745, 13.948575871882895, 53.122915524759392};
    cf_ = cfit(ft_,cv_{:});
end

% Plot this fit
h_ = plot(cf_,'fit',0.95);
legend off;  % turn off legend from plot method call
set(h_(1),'Color',[0.666667 0.333333 0],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
legh_(end+1) = h_(1);
legt_{end+1} = 'fit MVS50';

% Done plotting data and fits.  Now finish up loose ends.
hold off;
leginfo_ = {'Orientation', 'vertical'};
h_ = legend(ax_,legh_,legt_,leginfo_{:}); % create and reposition legend
set(h_,'Units','normalized');
t_ = get(h_,'Position');
t_(1:2) = [0.609096,0.140356];
set(h_,'Interpreter','none','Position',t_);
xlabel(ax_,'');               % remove x label
ylabel(ax_,'');               % remove y label
