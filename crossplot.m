function [target] = crossplot(foldername, filenumber)
%	Cross plot function for IM7 images.
%	Version: 0.1
%	Author: Ben Falconer
%	Synatx:
% 		folderList2=dir('*3CUp-TP4*us');
% 		folders2={folderList2.name}.'
% 		result = crossplot(folders2);

	D = 157.43;
	if(nargin < 2)
		filenumber = 4;
	end
	fileRegex = ['B' sprintf('%05d', filenumber) '*.im7'];
	target = zeros(0,0);
	legends = cell(size(foldername));
	
	colormap('lines');
	cmap=colormap;

	%sort filenames by D
	hashArray = zeros(size(foldername));
	for i=1:size(foldername)
		hashArray(i) = str2double(getAttribute(foldername{i}, 'd'));
	end
	[~,sortIndex] = sort(hashArray);
	foldername = foldername(sortIndex);
	
	for i=1:size(foldername)
		folder = char(foldername(i));
		filename = dir([folder '/' fileRegex]);
		if(isempty(filename))
			err = MException('Im7Convert:FileNotFound', ['The folder ' folder ' does not contain the file you specified.']);
			throw(err);
		end
		filename = [folder '/' filename.name];
		v = loadvec(filename);
		
		[ scaleI ] = getScale(v.Attributes, 'I');
		[ scaleX offsetX ] = getScale(v.Attributes, 'X');
		[ scaleY offsetY ] = getScale(v.Attributes, 'Y');
		disp(strcat(char(filename),'scaleI=',num2str(scaleI),'; scaleX=',num2str(scaleX),'; scaleY=',num2str(scaleY)));

 		v.w = v.w'*scaleI;

		%Plot the cross section

		%Central point seems to be 35mm
		cutPoint = 35;
		
		%Traverse baseline: 192mm
		travBase = 192;

		cutPoint = round(abs((cutPoint + offsetX) / scaleX)); %convert cut point to our axes
		section = v.w(cutPoint,:);
		sectionLength = (size(section,2)-1);
		totalOffsetY = offsetY + (str2double(getAttribute(v.setname, 'y')) - travBase);
		lowerLimit = -(totalOffsetY);
		upperLimit = -((sectionLength)*scaleY + totalOffsetY);
		scale = lowerLimit:-scaleY:upperLimit; %coordinates are backwards

		if i<8
			style = '-';
		elseif i<15
			style = '--';
		elseif i<22
			style = ':';
		else
			style = '-.';
		end

		if i == 1
			hold all;
			axis([0 2200 -150 300]);
			title(['Test point ' getAttribute(v.setname, 'tp') ', ' getAttribute(v.setname, 'day') getAttribute(v.setname, 'month')]);
			[ ~,~,unitsY ] = getScale(v.Attributes, 'Y');
			[ ~,~,unitsI ] = getScale(v.Attributes, 'I');
			ylabel(unitsY);
			xlabel(unitsI);
		end
		
		section = medfilt1(section,7);
		offsetD = D*str2double(getAttribute(v.setname, 'd'));
		h = plot(section + offsetD, scale, style, 'color', cmap(i,:));
		j = plot([offsetD offsetD],[lowerLimit upperLimit],':', 'color', cmap(i,:));
		hGroup = hggroup;
		set(j,'Parent',hGroup);
		set(h,'Parent',hGroup);
		set(get(get(hGroup,'Annotation'),'LegendInformation'),'IconDisplayStyle','on'); 
		label = char(strcat(getAttribute(v.setname, 'd'),'D'));
		legends{i} = label;
	end

	legend(legends);
end