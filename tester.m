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
% 

%% Cross Plotting:
% folderList2=dir('*3CUp-TP4*us');
% folders2={folderList2.name}.'
% result = crossplot(folders2);


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

folderList2=dir('*2C-TP4*mm');
folders2={folderList2.name}.'
result = im7Stitch(folders2);

% im7Convert(/B00004_abs(Avg V).im7');
% figure;
% im7Convert();
