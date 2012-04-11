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

% Cross Plotting:
% folderList2=dir('*us');
% folders2={folderList2.name}.'
% result = crossplot(folders2);

folders2={
%    '7Oct3C-TP12-0.5Dy212-3c12mus';
    '7Oct3C-TP12-1.5Dy212-3c12mus';
    '7Oct3C-TP12-12Dy192-3c17mus';
    '7Oct3C-TP12-15Dy192-3c17mus';
    '7Oct3C-TP12-1Dy212-3c12mus';
    '7Oct3C-TP12-2.85Dy212-3c12mus';
    '7Oct3C-TP12-2Dy212-3c12mus';
    '7Oct3C-TP12-3.5Dy242-3c12mus';
    '7Oct3C-TP12-3Dy242-3c12mus';
    '7Oct3C-TP12-4Dy242-3c12mus';
    '7Oct3C-TP12-6Dy242-3c12mus';
    '7Oct3C-TP12-8Dy242-3c15mus';
}
result = crossplot(folders2);

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
