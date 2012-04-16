function pptVelocityComparison(folders, outputFile, fileNumber, template, padding, introtext)
%	IM7 to .ppt converter.
%	Version: 0.2
%	Author: Ben Falconer
%	Synatx:

%padding, this is used for padding around the images, this is useful when
%using a template as it allows definition of padding at the bottom
%padding = [left, right, top, bottom]

	if nargin < 3
		fileNumber = 4;
	end
	if nargin < 4
		template = '';
	end
	if nargin < 5
		padding = 0;
	end
	if nargin < 6
		introtext = '';
	end
	fileRegex = ['B' sprintf('%05d', fileNumber) '*.im7'];

	%max number of .im7 files, this is 17 by default
	max = 17;
	figs = [];
	pptname = strcat(outputFile,'.ppt');
	if strcmp('',template)
		ppt=saveppt2(pptname,'init');
	else
		ppt=saveppt2(pptname,'init','template',template);
	end
	
	if ~strcmp('',introtext)
		saveppt2('ppt',ppt,'padding',padding,'textbox',introtext);
	end

	%sort filenames by D

	folderNames = {};
	folderFullNames = {};
	folderHashes = [];
	folderTestPoints = {};
	for i=1:size(folders)
		subfolders = dir(strcat(folders{i},'/*us'));
		for col=1:size(subfolders)
			folderNames{end+1} = subfolders(col).name;
			folderFullNames{end+1} = strcat(folders(i), '/', subfolders(col).name);
			currentD = str2double(getAttribute(subfolders(col).name, 'd'));
			folderHashes(end+1) = currentD;
			currentTestPoint = getAttribute(subfolders(col).name, 'tp');
			if ~ismember(currentTestPoint, folderTestPoints)
				folderTestPoints{end+1} = currentTestPoint;
			end
		end
	end
	[~,sortIndex] = sort(folderHashes);
	folderNames = folderNames(sortIndex);
	folderFullNames = folderFullNames(sortIndex);

	maxCols = 3;
	maxRows = size(folderTestPoints,2);
	i = 1;
	while i <= size(folderNames,2)
		figs = zeros(maxCols,maxRows);
		for col=1:maxCols
			for row=1:maxRows
				a = figure();
				if i>size(folderNames,2) || ~strcmp(getAttribute(folderNames{i}, 'tp'),folderTestPoints(row))
					disp(['No data for ', char(folderTestPoints(row)), '.']);
				else
					fileName = strcat(folderFullNames{i},'\B',sprintf('%05d',fileNumber),'*');
					v = loadvec(fileName);
					%use the I scaling factor if it applies to the current image:
					try
						[ scaleI ] = getScale(v.Attributes, 'I');
						v.w = v.w*scaleI;
					catch err
					end
					showf(v,'cmap','jet','CLim',[0 300]);
					title(['Testpoint ', folderTestPoints{row}, ', ', getAttribute(folderNames{i}, 'd'), 'D']);
					disp(char(folderNames(i)));
					i = i+1;
				end
				figs(row,col) = a;
			end
		end
		figs = reshape(figs,1,maxRows*maxCols);
		saveppt2('ppt',ppt,'figure',figs','col', maxCols, 'resolution',600,'padding',padding)
		close all;
	end
	saveppt2(pptname,'ppt',ppt,'close');
end