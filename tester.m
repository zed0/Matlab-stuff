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
% 	'20May2C-TP6-5Dy272-3c6mus2c6mus0.6msX720mm';
% 	'20May2C-TP6-5Dy272-3c6mus2c6mus0.8msX635mm';
% 	'20May2C-TP6-5Dy272-3c6mus2c6mus1.1msX508mm';
% 	'20May2C-TP6-5Dy272-3c6mus2c6mus1.3msX381mm';
% 	'20May2C-TP6-5Dy272-3c6mus2c6mus1.7msX254mm';
% 	'20May2C-TP6-5Dy272-3c6mus2c6mus2msX127mm';
% 	'20May2C-TP6-7Dy272-3c8mus2c8mus0.6msX720mm';
% 	'20May2C-TP6-7Dy272-3c8mus2c8mus0.8msX635mm';
% 	'20May2C-TP6-7Dy272-3c8mus2c8mus1.1msX508mm';
% 	'20May2C-TP6-7Dy272-3c8mus2c8mus1.3msX381mm';
% 	'20May2C-TP6-7Dy272-3c8mus2c8mus1.7msX254mm';
% 	'20May2C-TP6-7Dy272-3c8mus2c8mus2.4msX0mm';
% }
% index = 7;
% for i=1:size(folders)
% 	v = im7Load([folders{i} '/B' sprintf('%05d', index) '*.im7']);
% % 	figure;
% % 	showf(v);
% % 	setPlotFormatting(v);
% end
% result = im7Stitch(folders,index,0.1,0.1);
% figure; showf(result); setPlotFormatting(result);

%% Move files out of the TimeMeanQF_Scalar folder because it breaks everything:

% folders = dir('*');
% folderNames = {folders.name}.'
% for i = 3:size(folderNames,1)
% 	if isdir(folderNames{i}) && ~strcmp(folderNames{i}, '.') && ~strcmp(folderNames{i}, '..')
% 		files = dir(strcat(folderNames{i},'/TimeMeanQF_Scalar/*'));
% 		fileNames = {files.name}.';
% 		for j = 3:size(fileNames,1)
% 			movefile(strcat(folderNames{i},'/TimeMeanQF_Scalar/',fileNames{j}),strcat(folderNames{i},'/',fileNames{j}));
% 		end
% 	end
% end

%% Renamer script:

% folderList=dir('*');
% folders={folderList.name}.'
% rename(folders);
% %check whether the folders can now be used for attributes:
% folderList2=dir('*');
% folders2={folderList2.name}.'
% for i = 3:size(folders2,1)
% 	getAttribute(folders2(i), 'y')
% end

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
% drawWingModel();

%% Random unknown stuff
% t = figure;
% base1 = 'H:\13thsept\sept13th\OptiteckTP4 2Dy3228x8normal\TimeMeanQF_Scalar';
% base2 = 'H:\13thsept\sept12th\optiteckTP4-2D32216norm\TimeMeanQF_Scalar';
% file1 = [base1 '\B00010*.im7'];
% file2 = [base2 '\B00010*.im7'];
% difference = im7Compare(file1, file2, 1);
% showf(difference);
% setPlotFormatting(difference);
% set(gca, 'CLim', [-3000 3000]);
% saveas(t,'OptiteckTP4 2Dy3228x8normal_vs_optiteckTP4-2D32216norm_TKE','fig');
% saveas(t,'OptiteckTP4 2Dy3228x8normal_vs_optiteckTP4-2D32216norm_TKE','tiff');
% close all;
% t = figure;
% file1 = [base1 '\B00004*.im7'];
% file2 = [base2 '\B00004*.im7'];
% difference = im7Compare(file1, file2, 4);
% showf(difference);
% setPlotFormatting(difference);
% set(gca, 'CLim', [-100 100]);
% saveas(t,'OptiteckTP4 2Dy3228x8normal_vs_optiteckTP4-2D32216norm_abs(Avg_V)','fig');
% saveas(t,'OptiteckTP4 2Dy3228x8normal_vs_optiteckTP4-2D32216norm_abs(Avg_V)','tiff');
% close all;

%% random bits for Peter
% 
% base1 = 'H:\23rdAugust\SilTP10-3D-16askednorm\TimeMeanQF_Scalar';
% base2 = 'H:\23rdAugust\SilTP10-3D-8maskednorm\TimeMeanQF_Scalar';
% 
% % create a figure to plot to:
% t = figure;
% %location of files to compare:
% file1 = [base1 '\B00001*.im7'];
% file2 = [base2 '\B00001*.im7'];
% 
% difference = im7Compare(file1, file2, 1);
% 
% %display on the plot:
% showf(difference);
% setPlotFormatting(difference);
% set(gca, 'CLim', [-100 100]);
% %save the plot as both fig and tiff:
% saveas(t,'Avg_Vx','fig');
% saveas(t,'Avg_Vx','tiff');
% %close the figure:
% %close all;

%% Convert several im7 folders to figs and png files.
% folders=dir('*');
% for num=1:size(folders)
% 	if folders(num).isdir && ~strcmp(folders(num).name,'.') && ~strcmp(folders(num).name,'..')
% 		cd([folders(num).name])% '/TimeMeanQF_Scalar'])
% 		for filenumber = 1:17
% 			try %to catch exceptions if file doesn't exist
% 				t = figure;
% 				filename = ['B' sprintf('%05d', filenumber) '*.im7'];
% 				v = im7Load(filename);
% 				v.index = filenumber;
% 				showf(v);
% 				setPlotFormatting(v);
% 				t=title(strrep(folders(num).name,'_','\_'));
% 				set(t, 'FontSize', 20);
% 				saveas(t,sprintf('B%05d.fig', filenumber),'fig');
% 				saveas(t,sprintf('B%05d.png', filenumber),'png');
% 				save(sprintf('B%05d.mat', filenumber),'v');
% 			catch
% 			end
% 			close all;
% 		end
% 		cd ..;
% 	end
% end