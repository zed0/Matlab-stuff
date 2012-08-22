%% Tester script
%% Presentation creation:
% im2ppt('17May3CUp-TP4-0.1Dy322-3c5mus', 'template.potx', [0, 0, 0, 60],text)
% folderList2=dir('*us');
% folders2={folderList2.name}.'
% for i=1:size(folders2,1)
% 	im2ppt(folders2{i})
% end
% im72ppt('29Sept3C-TP7-1.5Dy212-3c12mus')

%% Cross Plotting:
% folderList2=dir('*us');
% folders2={folderList2.name}.'
% folders2={
% %     '17May3CUp-TP4-0.1Dy322-3c5mus'
%     '17May3CUp-TP4-0.3Dy322-3c5mus'
% %     '17May3CUp-TP4-0.5Dy322-3c5mus'
%     '17May3CUp-TP4-1.5Dy322-3c5mus'
% %     '17May3CUp-TP4-1Dy322-3c5mus'
% %     '17May3CUp-TP4-2Dy322-3c5mus'
%     '17May3CUp-TP4-3Dy322-3c5mus'
%     '18May3CDwn-TP4-7Dy272-3c8mus2c8mus'
%     '18May3CDwn-TP4-9Dy272-3c10mus2c10mus'
% }
% folders2={
% %     '19May3CUp-TP6-0.1Dy322-3c5mus'
%     '19May3CUp-TP6-0.3Dy322-3c5mus'
% %     '19May3CUp-TP6-0.5Dy322-3c5mus'
%     '19May3CUp-TP6-1.5Dy300-3c5mus'
% %     '19May3CUp-TP6-1Dy300-3c5mus'
% %     '19May3CUp-TP6-2Dy300-3c5mus'
%     '19May3CUp-TP6-3Dy272-3c5mus'
% %     '20May3CDwn-TP6-5Dy272-3c6mus'
%     '20May3CDwn-TP6-7Dy272-3c8mus'
%     '20May3CDwn-TP6-9Dy250-3c10mus'
% }
% spatialCrossplot(folders2, 4);
% crossplot(folders2, 4);

% testPoint = 'TP7';
% fileBase = ['C:\Users\zed0\Documents\MATLAB\Output\Symphony-' testPoint '_crossplot'];
% t = figure('Units','normalized','Position',[0 0 1 1]);
% crossplot(folders2, 4);
% saveas(t,fileBase,'fig');
% saveas(t,fileBase,'png');
% close all;

%% Image Stitching:
% folders={
%  	'20May2C-TP6-5Dy272-3c6mus2c6mus0.6msX720mm';
%  	'20May2C-TP6-7Dy272-3c8mus2c8mus0.6msX720mm';
%   	'20May2C-TP6-7Dy272-3c8mus2c8mus2.4msX0mm';
% }
% result = im7Stitch(folders,3);

% folderList2=dir('*2C-TP4*mm');
% folders2={folderList2.name}.'
% result = im7Stitch(folders2);

%% Renamer script:

% folderList2=dir('*');
% folders2={folderList2.name}.'
% rename(folders2);

%% pptPropertyComparison
% folders2={
% 	'Optitheck-TP4';
% 	'Optitheck-TP5';
% 	'Optitheck-TP6';
% }
% pptPropertyComparison(folders2, 'TurbKE_4_5_6', 10);

%% im73Dplot
% folders = {
% 	'7Oct3C-TP12-1Dy212-3c12mus'
% % 	'7Oct3C-TP12-1.5Dy212-3c12mus'
% 	'7Oct3C-TP12-2Dy212-3c12mus'
% % 	'7Oct3C-TP12-2.85Dy212-3c12mus'
% 	'7Oct3C-TP12-3Dy242-3c12mus'     
% % 	'7Oct3C-TP12-3.5Dy242-3c12mus'
% % 	'7Oct3C-TP12-4Dy242-3c12mus'
% 	'7Oct3C-TP12-6Dy242-3c12mus'     
% % 	'7Oct3C-TP12-8Dy242-3c15mus'     
% 	'7Oct3C-TP12-12Dy192-3c17mus'
% 	'7Oct3C-TP12-15Dy192-3c17mus'
% }
% % folderList=dir('*us');

% folders={folderList.name}.'
% im73Dplot(folders);
% drawWingModel()


%% Reference plot
%drawWingModel()

%%random bits for Peter
t = figure;
v = im7Load('B00004*.im7', '3C');
cmp = im7Load('H:\datafile\xsil18Aug-TP10-1D\ComparisonFiles\8x8_adaptive_abs_(Avg_V).im7','3C');
cmp.index = 4;
w = remapf(v, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(cmp, linspace(200, -200, 400), linspace(-200, 200, 400));
difference = operf('-',w,cmp2);
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [0 100])
saveas(t,'absAvgVDiff8','fig');
saveas(t,'absAvgVDiff8','tiff');
close all;

t = figure;
v = im7Load('B00004*.im7', '3C');
cmp = im7Load('H:\datafile\xsil18Aug-TP10-1D\ComparisonFiles\16x16_adaptive_abs(Avg_V).im7','3C');
cmp.index = 4;
w = remapf(v, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(cmp, linspace(200, -200, 400), linspace(-200, 200, 400));
difference = operf('-',w,cmp2);
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [0 100])
saveas(t,'absAvgVDiff16','fig');
saveas(t,'absAvgVDiff16','tiff');
close all;


t = figure;
v = im7Load('B00010*.im7', '3C');
cmp = im7Load('H:\datafile\xsil18Aug-TP10-1D\ComparisonFiles\8x8_adaptiveTKE.im7','3C');
cmp.index = 10;
w = remapf(v, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(cmp, linspace(200, -200, 400), linspace(-200, 200, 400));
difference = operf('-',w,cmp2);
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [0 100])
saveas(t,'TKEDiff8','fig');
saveas(t,'TKEDiff8','tiff');
close all;

t = figure;
v = im7Load('B00010*.im7', '3C');
cmp = im7Load('H:\datafile\xsil18Aug-TP10-1D\ComparisonFiles\16x16_adaptiveTKE.im7','3C');
cmp.index = 10;
w = remapf(v, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(cmp, linspace(200, -200, 400), linspace(-200, 200, 400));
difference = operf('-',w,cmp2);
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [0 100])
saveas(t,'TKEDiff16','fig');
saveas(t,'TKEDiff16','tiff');
close all
