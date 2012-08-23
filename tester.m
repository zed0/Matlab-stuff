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
base1 = 'H:\23rdAugust\SilTP10-3D-16askednorm\TimeMeanQF_Scalar';
base2 = 'H:\23rdAugust\SilTP10-3D-8maskednorm\TimeMeanQF_Scalar';

%%random bits for Peter
% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00001*.im7'];
file2 = [base2 '\B00001*.im7'];
%index to compare (this should match the im7 number above):
index = 1;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'Avg_Vx','fig');
saveas(t,'Avg_Vx','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00002*.im7'];
file2 = [base2 '\B00002*.im7'];
%index to compare (this should match the im7 number above):
index = 2;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'Avg_Vy','fig');
saveas(t,'Avg_Vy','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00003*.im7'];
file2 = [base2 '\B00003*.im7'];
%index to compare (this should match the im7 number above):
index = 3;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'Avg_Vz','fig');
saveas(t,'Avg_Vz','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00004*.im7'];
file2 = [base2 '\B00004*.im7'];
%index to compare (this should match the im7 number above):
index = 4;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'abs(Avg_V)','fig');
saveas(t,'abs(Avg_V)','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00006*.im7'];
file2 = [base2 '\B00006*.im7'];
%index to compare (this should match the im7 number above):
index = 6;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'RMS_Vx','fig');
saveas(t,'RMS_Vx','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00007*.im7'];
file2 = [base2 '\B00007*.im7'];
%index to compare (this should match the im7 number above):
index = 7;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'RMS_Vy','fig');
saveas(t,'RMS_Vy','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00008*.im7'];
file2 = [base2 '\B00008*.im7'];
%index to compare (this should match the im7 number above):
index = 8;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'RMS_Vz','fig');
saveas(t,'RMS_Vz','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00009*.im7'];
file2 = [base2 '\B00009*.im7'];
%index to compare (this should match the im7 number above):
index = 6;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'abs(RMS_V)','fig');
saveas(t,'abs(RMS_V)','tiff');
%close the figure:
close all;

% create a figure to plot to:
t = figure;
%location of files to compare:
file1 = [base1 '\B00010*.im7'];
file2 = [base2 '\B00010*.im7'];
%index to compare (this should match the im7 number above):
index = 6;
%load im7 files:
img1 = im7Load(file1,'3C');
img2 = im7Load(file2,'3C');
img1.index = index;
img2.index = index;
%if they are huge then downscale to make them reasonable:
while size(img1.w) > 1000
	%reduce size by a half:
	img1.w = img1.w(1:2:end, 1:2:end);
	img1.x = img1.x(1:2:end);
	img1.y = img1.y(1:2:end);
end
while size(img2.w) > 1000
	%reduce size by a half:
	img2.w = img2.w(1:2:end, 1:2:end);
	img2.x = img2.x(1:2:end);
	img2.y = img2.y(1:2:end);
end
%rescale images so they can be compared:
cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
%subtract image 2 from image 1:
difference = operf('-',cmp1,cmp2);
%display on the plot:
showf(difference);
setPlotFormatting(difference);
set(gca, 'CLim', [-100 100]);
%save the plot as both fig and tiff:
saveas(t,'Turb_kinetic_E','fig');
saveas(t,'Turb_kinetic_E','tiff');
%close the figure:
close all;

