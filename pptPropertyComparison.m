function pptPropertyComparison(folders, outputFile, fileNumber)
%	IM7 to .ppt converter.
%	Version: 0.2
%	Author: Ben Falconer
%	Synatx:
%		
	%Initialise all the variables for the symphony test:
	run('symphonySettings');

	%If the filenumber isn't given then use the default one:
	if nargin < 3
		fileNumber = 4;
	end

	%Create a list of the folders that are present:
	%(we store the fullnames and subfolder names for ease of checking
	%attributes)
	folderFullNames = {};
	folderNames = {};
	for i=1:size(folders)
		%find all sub files of each folder given:
		subfolders = dir(strcat(folders{i},'/*'));
		for j=1:size(subfolders)
			%loop through the files and if they are folders then add them:
			if subfolders(j).isdir && ...
				~strcmp(subfolders(j).name,'.') && ...	%Prevents '.' and
				~strcmp(subfolders(j).name,'..')		%'..' appearing
				folderFullNames{end+1} = fullfile(folders{i}, subfolders(j).name);
				folderNames{end+1} = subfolders(j).name;
			end
		end
	end

	%Find which test points and D positions are present:
	folderTestPoints = getPresentAttributes(folderNames, 'tp');
	folderDPoints = getPresentAttributes(folderNames, 'd');
	%Sort folders by D:
	%(we convert to doubles so that the D points are sorted numerically
	%instead of alphabetically)
	[~, sortIndex] = sort(str2double(folderDPoints));
	folderDPoints = folderDPoints(sortIndex);
	
	%Add all folders to an array indexing their testpoint and D value:
	formatMatrix = cell(0);
	for i=1:size(folderFullNames,2)
		%get the index of the current D value and Testpoint:
		dIndex = strcmp(folderDPoints, getAttribute(folderNames{i},'d'));
		tpIndex = strcmp(folderTestPoints, getAttribute(folderNames{i},'tp'));
		%use the indexes to find the position in the array:
		formatMatrix(dIndex,tpIndex) = folderFullNames(i);
	end

	%Create an array to push figures to:
	figs = zeros(size(formatMatrix));

	%We have to be careful about the order of our figures, plotting in sets
	%of 3x[number of test points] is reasonable.
	maxCols = size(folderTestPoints,1);
	maxRows = 3;

	%itterate through the format Matrix in order of TestPoints then D:
	for col=1:maxCols
		for row=1:size(folderDPoints,1);
			if ~isempty(formatMatrix{row, col})
				%full file name, including the specific im7 file:
				filename = [formatMatrix{row, col} '\B' sprintf('%05d', fileNumber) '*.im7'];
				%load the coresponding im7 file:
				v = im7Load(filename);

				%create a new figure:
				a = figure();
				set(a,'visible','off'); %prevent all the figures popping up

				%Plot to the figure:
				showf(v);
				%Set the formatting for the Plot to our standard settings:
				setPlotFormatting(v);
				set(a,'visible','off');	%showf makes the figures pop up again, this surpresses it.
				figs(row,col) = a;
			else
				disp(['No data for ' char(folderTestPoints(col)) ', ' char(folderDPoints(row)) 'D']);
			end
		end
	end
	%reshape our figure matrix so that it's in the format figs2ppt expects:
	finalFigs = reshape(figs',size(figs,1)*size(figs,2),1);
	%Add all the figures to a Powerpoint presentation:
	figs2ppt([outputFile '.ppt'], finalFigs, [maxCols maxRows]);
	%Free up the figures we were using:
	closeFigs(finalFigs);
end