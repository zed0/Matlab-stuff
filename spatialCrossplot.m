function spatialCrossplot(folderNames, filenumber)
%	Cross plot function for IM7 images.
%	Version: 0.1
%	Author: Ben Falconer
%	Synatx:
% 		folderList2=dir('*3CUp-TP4*us');
% 		folders2={folderList2.name}.'
% 		result = crossplot(folders2);

	%Load our usual settings:
	run('symphonySettings');

	%Default to a velocity plot if none is specified:
	if(nargin < 2)
		filenumber = 4;
	end

	%sort filenames by D
	folderNames = sortByAttribute(folderNames, 'd');
	
	%Plot all lines to the same graph:
	hold on;
	%Define a colour map for the graph:
	cmap = colormap('lines');
	%Define some styles to use for the lines:
	styles = {'-', '--', ':', '-.'};
	%Create an array to contain the legend entries:
	legendEntries = cell(size(folderNames));

	for i=1:size(folderNames)

		%For each folder we get and load the file corresponding to the
		%appropriate property:
		filename = [folderNames{i} '/B' sprintf('%05d', filenumber) '*.im7'];
		v = im7Load(filename);

		if i==1
			%set our formatting if this is the first time we're running.
			setSpatialCrossplotFormatting(v);
		end

		total = getProfileAtCoord(v,0) + str2double(getAttribute(v.setname, 'd'))*D;
		plot(total, v.x, ...	%Plot our x Axis points against the profile
			'color', cmap(i,:), ...				%Use the colours we defined earlier
			'lineStyle', styles{ceil(i/7)},...	%Use the line styles we defined earlier (7 is the period of the line colours)
			'LineWidth',1.5);
		legendEntries{i} = [getAttribute(v.setname, 'd') 'D'];
	end
	range = xlim;
	ticks = 0:D:range(2);
	set(gca, 'XTick', ticks);
	set(gca,'XTickLabel', ticks/D)

	%Add the legend:
	legend(legendEntries);
	hold off;
end