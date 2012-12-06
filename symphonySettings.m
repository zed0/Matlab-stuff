%Set this according to which test we are currently looking at, options are
%'optitheck', 'symphony', 'siloet'
test = 'optitheck';
if strcmp(test, 'optitheck')
%% Optitech Settings
	%D Value
	D = 157.43;
	
	%Limits to plot between:
	zPlotLimits = [-250 250];
	zCrossLimits = [-150 150];
	yPlotLimits = [-300 200];
	
	%Constant offsets between the target and nozzle in mm
	%Upstream:
	upTargetOffsetX = 0;
	upTargetOffsetY = -10;
	upTargetOffsetZ = -26;
	%Downstream:
	dwnTargetOffsetX = 0;
	dwnTargetOffsetY = -10;
	dwnTargetOffsetZ = 30;
	%2C:
	twoCTargetOffsetX = -1118;
	twoCTargetOffsetY = 0;
	twoCTargetOffsetZ = 27.2;

elseif strcmp(test, 'siloet')
%% Siloet Settings
% CURRENTLY JUST COPIED FROM SYMPHONY
	%D Value
	D = 185.7;

	%Limits to plot between:	
	zPlotLimits = [-350 250];
	zCrossLimits = [-150 150];
	yPlotLimits = [-300 210];
	
	%Constant offsets between the target and nozzle in mm
	%Upstream:
	upTargetOffsetX = 0;
	upTargetOffsetY = 20;
	upTargetOffsetZ = -32;
elseif strcmp(test, 'symphony')
%% Symphony Settings
	%D Value
	D = 185.7;

	%Limits to plot between:	
	zPlotLimits = [-350 250];
	zCrossLimits = [-150 150];
	yPlotLimits = [-300 210];
	
	%Constant offsets between the target and nozzle in mm
	%Upstream:
	upTargetOffsetX = 0;
	upTargetOffsetY = 20;
	upTargetOffsetZ = -32;
end

%% Common Settings:
%Qinetiq Z Traverse baseline: 302mm
travZBase = 272;

%Dantec Traverse Baseline: 720mm
dantecBase = 720;

%Number of files for each measurement:
numFiles = 17;

%limits for the colour axis to plot with:
colorLimits = [
	-100 100;	%1:  Avg Vx
	-100 100;	%2:  Avg Vy
	0 400;	%3:  Avg Vz
	0 400;	%4:  abs(Avg V)
	0 100000;%5:  Avg Kinetic Energy
	0 75;	%6:  RMS Vx
	0 75;	%7:  RMS Vy
	0 75;	%8:  RMS Vz
	0 75;	%9:  abs(RMX V)
	0 3000;	%10: Turbulent Kinetic Energy
	0 5000;	%11: Reynold Stress XY
	0 5000;	%12: Reynold Stress XZ
	0 5000;	%13: Reynold Stress YZ
	0 5000;%14: Reynold Stress XX
	0 5000;	%15: Reynold Stress YY
	0 5000;	%16: Reynold Stress ZZ
	0 5000;	%17: TSS max 2D
];