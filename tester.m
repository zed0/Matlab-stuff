%% Tester script
%% Presentation creation:
% im2ppt('17May2C-TP4-0.1Dy322-3c5mus', 'template.potx', [0, 0, 0, 60],text)
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
% %     '17May2C-TP4-0.1Dy322-3c5mus'
%     '17May2C-TP4-0.3Dy322-3c5mus'
% %     '17May2C-TP4-0.5Dy322-3c5mus'
%     '17May2C-TP4-1.5Dy322-3c5mus'
% %     '17May2C-TP4-1Dy322-3c5mus'
% %     '17May2C-TP4-2Dy322-3c5mus'
%     '17May2C-TP4-3Dy322-3c5mus'
%     '18May3CDwn-TP4-7Dy272-3c8mus2c8mus'
%     '18May3CDwn-TP4-9Dy272-3c10mus2c10mus'
% }
% folders2={
% %     '19May2C-TP6-0.1Dy322-3c5mus'
%     '19May2C-TP6-0.3Dy322-3c5mus'
% %     '19May2C-TP6-0.5Dy322-3c5mus'
%     '19May2C-TP6-1.5Dy300-3c5mus'
% %     '19May2C-TP6-1Dy300-3c5mus'
% %     '19May2C-TP6-2Dy300-3c5mus'
%     '19May2C-TP6-3Dy272-3c5mus'
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

% %TP6:
% % foldersA={
% % 	'19May2C-TP6-15Dy222-X320mm';
% % 	'19May2C-TP6-15Dy222-X640mm';
% % 	'19May2C-TP6-15Dy422-X0mm';
% % 	'19May2C-TP6-15Dy422-X320mm';
% % 	'19May2C-TP6-15Dy422-X640mm';
% % 	'19May2C-TP6-15Dy222-X0mm';
% % }
% % foldersB={
% % 	'20May2C-TP6-5Dy272-0.6msX720mm';
% % 	'20May2C-TP6-5Dy272-0.8msX635mm';
% % 	'20May2C-TP6-5Dy272-X254mm';
% % 	'20May2C-TP6-5Dy272-X381mm';
% % 	'20May2C-TP6-5Dy272-X508mm';
% % }
% % foldersC={
% % 	'20May2C-TP6-7Dy272-0.6msX720mm';
% % 	'20May2C-TP6-7Dy272-0.8msX635mm';
% % 	'20May2C-TP6-7Dy272-1.1msX508mm';
% % 	'20May2C-TP6-7Dy272-1.3msX381mm';
% % 	'20May2C-TP6-7Dy272-1.7msX254mm';
% % 	'20May2C-TP6-7Dy272-2.0msX127mm';
% % 	'20May2C-TP6-7Dy272-2.4msX0mm';
% % 	'20May2C-TP6-7Dy272-X0mm';
% % }
% % foldersD={
% % 	'20May2C-TP6-9Dy250-0.8msX635mm';
% % 	'20May2C-TP6-9Dy250-1.1msX508mm';
% % 	'20May2C-TP6-9Dy250-1.5msX381mm';
% % 	'20May2C-TP6-9Dy250-1.9msX254mm';
% % }
% % 
% % foldersE={
% % 	'20May2C-TP6-9Dy250-X720mm';
% % }
% 
% %TP6 - postproc
% % foldersA={
% % 	'19May2C-TP6-18Dy200-X480mm-postproc';
% % 	'19May2C-TP6-18Dy200-X640mm-postproc';
% % 	'19May2C-TP6-18Dy400-X480mm-postproc';
% % 	'19May2C-TP6-18Dy400-X640mm-postproc';
% % }
% % foldersB={
% % 	'20May2C-TP6-5Dy272-X127mm-postproc';
% % 	'20May2C-TP6-5Dy272-X254mm-postproc';
% % 	'20May2C-TP6-5Dy272-X381mm-postproc';
% % 	'20May2C-TP6-5Dy272-X508mm-postproc';
% % 	'20May2C-TP6-5Dy272-X635mm-postproc';
% % 	'20May2C-TP6-5Dy272-X720mm-postproc';
% % }
% % foldersC={
% % 	'19May2C-TP6-15Dy222-X0mm-postproc';
% % 	'19May2C-TP6-15Dy222-X320mm-postproc';
% % 	'19May2C-TP6-15Dy222-X640mm-postproc';
% % 	'19May2C-TP6-15Dy422-X0mm-postproc';
% % 	'19May2C-TP6-15Dy422-X320mm-postproc';
% % 	'19May2C-TP6-15Dy422-X640mm-postproc';
% % }
% % foldersD={
% % 	'20May2C-TP6-7Dy272-2.4msX0mm-postproc';
% % 	'20May2C-TP6-7Dy272-X0mm-postproc';
% % 	'20May2C-TP6-7Dy272-X127mm-postproc';
% % 	'20May2C-TP6-7Dy272-X254mm-postproc';
% % 	'20May2C-TP6-7Dy272-X381mm-postproc';
% % 	'20May2C-TP6-7Dy272-X508mm-postproc';
% % 	'20May2C-TP6-7Dy272-X635mm-postproc';
% % 	'20May2C-TP6-7Dy272-X720mm-postproc';
% % }
% % foldersE={
% % 	'20May2C-TP6-9Dy250-X381mm-postproc';
% % 	'20May2C-TP6-9Dy250-X508mm-postproc';
% % 	'20May2C-TP6-9Dy250-X635mm-postproc';
% %  	'20May2C-TP6-9Dy250-X720mm-postproc';
% %  	'20May2C-TP6-9Dy250-X254mm-postproc';
% % }
% 
% %TP6 - both:
% % foldersA={
% % 	'19May2C-TP6-18Dy200-X480mm-postproc';
% % 	'19May2C-TP6-18Dy200-X640mm-postproc';
% % 	'19May2C-TP6-18Dy400-X480mm-postproc';
% % 	'19May2C-TP6-18Dy400-X640mm-postproc';
% % }
% % 
% % foldersB={
% % 	'19May2C-TP6-15Dy222-X320mm';
% % 	'19May2C-TP6-15Dy222-X640mm';
% % 	'19May2C-TP6-15Dy422-X0mm';
% % 	'19May2C-TP6-15Dy422-X320mm';
% % 	'19May2C-TP6-15Dy422-X640mm';
% % 	'19May2C-TP6-15Dy222-X0mm';
% % 	'19May2C-TP6-15Dy222-X0mm-postproc';
% % 	'19May2C-TP6-15Dy222-X320mm-postproc';
% % 	'19May2C-TP6-15Dy222-X640mm-postproc';
% % 	'19May2C-TP6-15Dy422-X0mm-postproc';
% % 	'19May2C-TP6-15Dy422-X320mm-postproc';
% % 	'19May2C-TP6-15Dy422-X640mm-postproc';
% % }
% % foldersC={
% % 	'20May2C-TP6-5Dy272-0.6msX720mm';
% % 	'20May2C-TP6-5Dy272-0.8msX635mm';
% % 	'20May2C-TP6-5Dy272-X254mm';
% % 	'20May2C-TP6-5Dy272-X381mm';
% % 	'20May2C-TP6-5Dy272-X508mm';
% % 	'20May2C-TP6-5Dy272-X127mm-postproc';
% % 	'20May2C-TP6-5Dy272-X254mm-postproc';
% % 	'20May2C-TP6-5Dy272-X381mm-postproc';
% % 	'20May2C-TP6-5Dy272-X508mm-postproc';
% % 	'20May2C-TP6-5Dy272-X635mm-postproc';
% % 	'20May2C-TP6-5Dy272-X720mm-postproc';
% % }
% % foldersD={
% % 	'20May2C-TP6-7Dy272-0.6msX720mm';
% % 	'20May2C-TP6-7Dy272-0.8msX635mm';
% % 	'20May2C-TP6-7Dy272-1.1msX508mm';
% % 	'20May2C-TP6-7Dy272-1.3msX381mm';
% % 	'20May2C-TP6-7Dy272-1.7msX254mm';
% % 	'20May2C-TP6-7Dy272-2.0msX127mm';
% % 	'20May2C-TP6-7Dy272-2.4msX0mm';
% % 	'20May2C-TP6-7Dy272-X0mm';
% % 	'20May2C-TP6-7Dy272-2.4msX0mm-postproc';
% % 	'20May2C-TP6-7Dy272-X0mm-postproc';
% % 	'20May2C-TP6-7Dy272-X127mm-postproc';
% % 	'20May2C-TP6-7Dy272-X254mm-postproc';
% % 	'20May2C-TP6-7Dy272-X381mm-postproc';
% % 	'20May2C-TP6-7Dy272-X508mm-postproc';
% % 	'20May2C-TP6-7Dy272-X635mm-postproc';
% % 	'20May2C-TP6-7Dy272-X720mm-postproc';
% % }
% % foldersE={
% % 	'20May2C-TP6-9Dy250-0.8msX635mm';
% % 	'20May2C-TP6-9Dy250-1.1msX508mm';
% % 	'20May2C-TP6-9Dy250-1.5msX381mm';
% % 	'20May2C-TP6-9Dy250-1.9msX254mm';
% % 	'20May2C-TP6-9Dy250-X720mm';
% % 	'20May2C-TP6-9Dy250-X381mm-postproc';
% % 	'20May2C-TP6-9Dy250-X508mm-postproc';
% % 	'20May2C-TP6-9Dy250-X635mm-postproc';
% % 	'20May2C-TP6-9Dy250-X720mm-postproc';
% % 	'20May2C-TP6-9Dy250-X254mm-postproc';
% % }
% 
% %TP4
% % foldersA={
% % % 	'17May2C-TP4-5Dy322-0.6X720mm-8normmasked';
% % % 	'17May2C-TP4-5Dy322-0.8X635mm-8normmasked';
% % 	'17May2C-TP4-5Dy322-1.1X508mm-8adaptmasked';
% % % 	'17May2C-TP4-5Dy322-1.1X508mm-8normmasked';
% % 	'17May2C-TP4-5Dy322-1.3X381mm-8fadaptmasked';
% % % 	'17May2C-TP4-5Dy322-1.3X381mm-8normmasked';
% % % 	'17May2C-TP4-5Dy322-1.7X254mm-16normmasked';
% % 	'17May2C-TP4-5Dy322-1.7X254mm-8adaptmasked';
% % % 	'17May2C-TP4-5Dy322-1.7X254mm-8normmasked';
% % % 	'17May2C-TP4-5Dy322-2X127mm-8normmasked';
% % }
% % foldersB={
% % 	'17May2C-TP4-7Dy272-0.6X720mm-8normmasked';
% % 	'17May2C-TP4-7Dy272-0.8X635mm-mm8adaptmasked';
% %  	'17May2C-TP4-7Dy272-1.1X508mm-8normmasked';
% %  	'17May2C-TP4-7Dy272-1.3X381mm-8normmasked';
% %  	'17May2C-TP4-7Dy272-1.7X254mm-8normmasked'; %This one causes noise on the left
% % 	'18May2C-TP4-7Dy272-0.6X720mm-8normmasked';
% % 	'18May2C-TP4-7Dy272-0.8X635mm-8normmasked';
% % }
% % foldersC={
% % 	'18May2C-TP4-9Dy272-0.6X720mm-8normmasked';
% % 	'18May2C-TP4-9Dy272-0.8X635mm-8normmasked';
% % 	'18May2C-TP4-9Dy272-1.5X381mm-8normmasked';
% % 	'18May2C-TP4-9Dy272-1.9X254mm-8normmasked';
% % 	'18may2C-TP4-9Dy272-1.1X508mm-8normmasked';
% % }
% % 
% % foldersD={
% % 	'18May2C-TP4-15Dy222-8X0mm-normalmasked';
% % 	'18May2C-TP4-15Dy222-8X320mm-normalmasked';
% % 	'18May2C-TP4-15Dy222-8X640mm-normmasked';
% % 	'18May2C-TP4-15Dy422-8X0mm-normmasked';
% % 	'18May2C-TP4-15Dy422-8X320mm-normmasked';
% % 	'18May2C-TP4-15Dy422-8X640mm-normmasked';
% % }
% % 
% % %using 16 mesh instead:
% % % foldersD={
% % % 	'18May2C-TP4-15Dy222-16X0mm-adapt';
% % % 	'18May2C-TP4-15Dy422-16X0mm-adapt';
% % %  	'18May2C-TP4-15Dy422-16X320mm-adapt';
% % % 	'18May2C-TP4-15Dy222-16X320mm-adapt';
% % % 	'18May2C-TP4-15Dy422-16X640mm-adapt';
% % % 	'18May2C-TP4-15Dy222-16X640mm-adapt';
% % % }
% % 
% % foldersE={
% % 	'18May2C-TP4-18Dy200-8X480mm-normmasked';
% % 	'18May2C-TP4-18Dy200-8X640mm-normmasked';
% % 	'18May2C-TP4-18Dy400-8X480mm-normmasked';
% % 	'18May2C-TP4-18Dy400-8X640mm-normmasked';
% % % 	'17May2C-TP4-18Dy200-0.4X720mm-16normmasked';
% % 	'17May2C-TP4-18Dy200-0.4X720mm-8normmasked';
% % % 	'17May2C-TP4-18Dy400-0.4X720mm-16normmasked';
% % 	'17May2C-TP4-18Dy400-0.4X720mm-8normmasked';
% % }
% 
% foldersA={
% 	'18May2C-TP4-15Dy222-X0mm-postproc';
% 	'18May2C-TP4-15Dy222-X320mm-postproc';
% 	'18May2C-TP4-15Dy222-X640mm-postproc';
% 	'18May2C-TP4-15Dy422-X0mm-postproc';
% 	'18May2C-TP4-15Dy422-X320mm-postproc';
% 	'18May2C-TP4-15Dy422-X640mm-postproc';
% }
% foldersB={
% 	'18May2C-TP4-18Dy200-X480mm-postproc';
% 	'18May2C-TP4-18Dy200-X640mm-postproc';
% 	'18May2C-TP4-18Dy400-X480mm-postproc';
% 	'18May2C-TP4-18Dy400-X640mm-postproc';
% }
% foldersC={
% 	'18May2C-TP4-7Dy272-X635mm-postproc';
% 	'18May2C-TP4-7Dy272-X720mm-postproc';
% }
% foldersD={
% 	'18May2C-TP4-9Dy272-X254mm-postproc';
% 	'18May2C-TP4-9Dy272-X381mm-postproc';
% 	'18May2C-TP4-9Dy272-X508mm-postproc';
% 	'18May2C-TP4-9Dy272-X635mm-postproc';
% 	'18May2C-TP4-9Dy272-X720mm-postproc';
% }
% foldersE={
% 	'17May2C-TP4-5Dy322-0.6X720mm-8normmasked';
% 	'17May2C-TP4-5Dy322-0.8X635mm-8normmasked';
% 	'17May2C-TP4-5Dy322-1.1X508mm-8adaptmasked';
% 	'17May2C-TP4-5Dy322-1.1X508mm-8normmasked';
% 	'17May2C-TP4-5Dy322-1.1X508mm-8normmasked1';
% 	'17May2C-TP4-5Dy322-1.3X381mm-8fadaptmasked';
% 	'17May2C-TP4-5Dy322-1.3X381mm-8normmasked';
% 	'17May2C-TP4-5Dy322-1.7X254mm-16normmasked';
% 	'17May2C-TP4-5Dy322-1.7X254mm-8adaptmasked';
% 	'17May2C-TP4-5Dy322-1.7X254mm-8normmasked';
% 	'17May2C-TP4-5Dy322-2X127mm-8normmasked';
% }
% index = 10;
% % for i=1:size(folders)
% % 	v = im7Load([folders{i} '/B' sprintf('%05d', index) '*.im7']);
% % % 	figure;
% % % 	showf(v);
% % % 	setPlotFormatting(v);
% % end
% 
% [a,sma] = im7Stitch(foldersA,index,0,0,0,0);
% [b,smb] = im7Stitch(foldersB,index,0,0,0,0);
% [c,smc] = im7Stitch(foldersC,index,0,0,0,0);
% [d,smd] = im7Stitch(foldersD,index,0,0,0,0);
% [e,sme] = im7Stitch(foldersE,index,0,0,0,0);
% temp = {a;b;c;d;e;};
% [r,smr] = im7Stitch(temp,index,0,0,0,0);
% 
% max = 17;
% results = {};
% for i=1:max
% 	disp(['processing ' int2str(i)]);
% 	a=applyStitchmap(sma,foldersA,i);
% 	b=applyStitchmap(smb,foldersB,i);
% 	c=applyStitchmap(smc,foldersC,i);
% 	d=applyStitchmap(smd,foldersD,i);
% 	e=applyStitchmap(sme,foldersE,i);
% 	temp = {a;b;c;d;e;};
% 	results{i} = applyStitchmap(smr,temp);
% 	current = results{i};
% 	t=figure;
% 	showf(current);
% 	setPlotFormatting(current);
% 	saveas(t,['Opt_TP4_fullstitch_' int2str(i)],'fig');
% 	saveas(t,['Opt_TP4_fullstitch_' int2str(i)],'png');
% 	save(['Opt_TP4_fullstitch_' int2str(i)], 'current');
% 	close all;
% end
% figure; showf(r); setPlotFormatting(r);

%% Autostitch:

index = 10;
folders = dir('*2C*mm');
folderNames = {folders.name}.'
[r,smr] = im7Stitch(folderNames,index,0,0,0,0);
max = 17;
results = {};
for i=1:max
	disp(['processing ' int2str(i)]);
	results{i} = applyStitchmap(smr,folderNames,i);
	current = results{i};
	t=figure;
	showf(current);
	setPlotFormatting(current);
	saveas(t,['Opt_TP2_fullstitch_' int2str(i)],'fig');
	saveas(t,['Opt_TP2_fullstitch_' int2str(i)],'png');
	save(['Opt_TP2_fullstitch_' int2str(i)], 'current');
	close all;
end

%% Move files out of the TimeMeanQF_Scalar folder because it breaks everything:
% 
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
% 
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