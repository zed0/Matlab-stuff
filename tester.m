%% Tester script
%% Presentation creation:
% text = [...
% 	'Symphony PIV Test as performed by\n'...
% 	'Warwick University\n'...
% 	'Warwick PIV Team\n'...
% 	'	Prof P.J.Bryanston-Cross\n'...
% 	'	Dr B.H Timmerman\n'...
% 	'	B.Falconer\n'...
% 	'	P.Hackett & Ian Baylis\n'...
% 	'	T.Gibbs\n\n\n'...
% 	'The following sequence of images presents a representation' ...
% 	' of the results obtained by the Warwick PIV team during'...
% 	' the Symphony PIV Test.'...
% ];
% im2ppt('17May3CUp-TP4-0.1Dy322-3c5mus', 'template.potx', [0, 0, 0, 60],text)
% folderList2=dir('*us');
% folders2={folderList2.name}.'
% for i=1:size(folders2,1)
% 	im2ppt(folders2{i}, '', [0, 0, 0, 0],'')
% end
% im2ppt('29Sept3C-TP7-1.5Dy212-3c12mus', '', [0, 0, 0, 0],'')

% Cross Plotting:
% folderList2=dir('*us');
% folders2={folderList2.name}.'
% folders2={
% 	'17May3CUp-TP4-0.1Dy322-3c5mus';
% }
% testPoint = 'TP4';
% fileBase = 'C:\Users\zed0\Documents\MATLAB\Output\Optitech-TP4\';
% t = figure('Units','normalized','Position',[0 0 1 1]);
% crossplot(folders2,'normal',4);
% saveas(t,[fileBase testPoint '_normal'],'fig');
% saveas(t,[fileBase testPoint '_normal'],'png');
% t = figure('Units','normalized','Position',[0 0 1 1]);
% crossplot(folders2,'spatial',4);
% saveas(t,[fileBase testPoint '_spatial'],'fig');
% saveas(t,[fileBase testPoint '_spatial'],'png');
% close all;

%% Image Stitching:
% folders={
% 	'18May2C-TP4-9Dy272-3c10mus2c10mus0.8msX635mm';
% 	'18May2C-TP4-7Dy272-3c8mus2c8mus0.8msX635mm';
% 	'18May2C-TP4-15Dy222-2c11musX0mm';
% 	'18May2C-TP4-15Dy422-2c11musX320mm';
% 	'18May2C-TP4-15Dy422-2c11musX640mm';
% 	'18May2C-TP4-18Dy200-2c11musX480mm';
% 	'18May2C-TP4-18Dy200-2c11musX640mm';
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
folders2={
	'Symphony-TP1A';
	'Symphony-TP1B';
	'Symphony-TP1C';
}
pptVelocityComparison(folders2, 'TurbKEPlots_1A_1B_1C', 10, '', [0, 0, 0, 0], [0 3000]);

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
% hold off;
% D = 157.43;
% [V,F] = readObj('Symphony23.obj');
% V(:,1) = V(:,1)-2;
% V(:,2) = V(:,2).*-1;
% V(:,3) = V(:,3).*-1;
% V(:,3) = V(:,3)-2.75;
% 
% trisurf(F,V(:,1),V(:,2),V(:,3),'FaceColor',[0.5,0.5,0.5 ],'EdgeColor','none');
% light('Position',[-1.0,-1.0,100.0],'Style','infinite');
% lighting phong;
% axis equal;
% xl = xlabel('x (D)');
% yl = ylabel('z (m)');
% zl = zlabel('y (m)');
% set(gca,'FontSize',12);
% set(xl,'FontSize',15);
% set(yl,'FontSize',15);
% set(zl,'FontSize',15);
% axis([-1 2 -1 1 -1 1]);
% xPlotRange = [-1 2];
% ticks = -6*(D/1000):(D/1000):xPlotRange(2);
% set(gca,'XTick',ticks)
% set(gca,'XTickLabel',ticks/(D/1000))
% hold on;
% plot3([-1 2],[0 0],[0 0],'Color', 'blue', 'LineWidth', 2);
% plot3([0 0],[-1 1],[0 0],'Color', 'red', 'LineWidth', 2);
% plot3([0 0],[0 0],[-1 1],'Color', 'green', 'LineWidth', 2);