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
folderList2=dir('*us');
folders2={folderList2.name}.'
% folders2={
% 	'17May3CUp-TP4-0.1Dy322-3c5mus';
% }
% spatialCrossplot(folders2, 4);
% crossplot(folders2, 4);

testPoint = 'TP7';
fileBase = ['C:\Users\zed0\Documents\MATLAB\Output\Symphony-' testPoint '_crossplot'];
t = figure('Units','normalized','Position',[0 0 1 1]);
crossplot(folders2, 4);
saveas(t,fileBase,'fig');
saveas(t,fileBase,'png');
close all;

%% Image Stitching:
% folders={
% 	'18May2C-TP4-9Dy272-3c10mus2c10mus0.8msX635mm';
% 	'18May2C-TP4-7Dy272-3c8mus2c8mus0.8msX635mm';
% % 	'18May2C-TP4-15Dy222-2c11musX0mm';
% % 	'18May2C-TP4-15Dy422-2c11musX320mm';
% % 	'18May2C-TP4-15Dy422-2c11musX640mm';
% % 	'18May2C-TP4-18Dy200-2c11musX480mm';
% %	'18May2C-TP4-18Dy200-2c11musX640mm';
% }
% result = im7Stitch(folders);

% folderList2=dir('*2C-TP4*mm');
% folders2={folderList2.name}.'
% result = im7Stitch(folders2);

%% Dimension scaling:

% im7Convert('B00004_abs(Avg V).im7');

%% Renamer script:

% folderList2=dir('*');
% folders2={folderList2.name}.'
% rename(folders2);

%% pptVelocityComparison
% folders2={
% 	'Optitheck-TP4';
% 	'Optitheck-TP5';
% 	'Optitheck-TP6';
% }
% pptPropertyComparison(folders2, 'TurbKE_4_5_6', 10);

%% im73Dplot
% folders2 = {
%     %'30Sept3C-TP1A-1.5Dy212-3c14mus';
%     %'30Sept3C-TP1A-12Dy192-3c19mus';
%     %'30Sept3C-TP1A-15Dy192-3c19mus';
%     '30Sept3C-TP1A-1Dy212-3c14mus';
%     %'30Sept3C-TP1A-2.85Dy212-3c14mus';
%     '30Sept3C-TP1A-2Dy212-3c14mus';
%     %'30Sept3C-TP1A-3.5Dy242-3c14mus';
%     '30Sept3C-TP1A-3Dy242-3c14mus';
%     '30Sept3C-TP1A-4Dy242-3c14mus';
%     '30Sept3C-TP1A-6Dy242-3c14mus';
%     '30Sept3C-TP1A-8Dy242-3c17mus';
% }
% folderList2=dir('*us');
% folders2={folderList2.name}.'
% im73Dplot(folders2);


%% Reference plot
% drawWingModel()