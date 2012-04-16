function crossplot(foldername, format, filenumber)
%	Cross plot function for IM7 images.
%	Version: 0.1
%	Author: Ben Falconer
%	Synatx:
% 		folderList2=dir('*3CUp-TP4*us');
% 		folders2={folderList2.name}.'
% 		result = crossplot(folders2);

	D = 157.43;
	if(nargin < 2)
		format = 'normal';
	end
	if(nargin < 3)
		filenumber = 4;
	end
	fileRegex = ['B' sprintf('%05d', filenumber) '*.im7'];
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
			err = MException('crossplot:FileNotFound', ['The folder ' folder ' does not contain the file you specified.']);
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
			title(['Test point ' getAttribute(v.setname, 'tp') ', ' getAttribute(v.setname, 'day') getAttribute(v.setname, 'month')]);
			[ ~,~,unitsY ] = getScale(v.Attributes, 'Y');
			[ ~,~,unitsI ] = getScale(v.Attributes, 'I');
			if strcmp(format,'normal')
				axis([-150 200 50 300]);
				ylabel(unitsI);
				xlabel(unitsY);
			elseif strcmp(format,'spatial')
				xPlotRange = [0 2200];
				yPlotRange = [-150 300];
				ylabel(unitsY);
				xlabel('D');
				axis([xPlotRange, yPlotRange]);
			else
				err = MException('crossplot:plotTypeUnknown', ['The format ' format ' is not valid.']);
				throw(err);
			end
		end
		
		section = medfilt1(section,7);
		hGroup = hggroup;
		label = char(strcat(getAttribute(v.setname, 'd'),'D'));

		if strcmp(format,'normal')
			h = plot(scale, section, style, 'color', cmap(i,:));
			set(h,'LineWidth',1.5);
			set(h,'Parent',hGroup);
		elseif strcmp(format,'spatial')
			offsetD = D*str2double(getAttribute(v.setname, 'd'));
			h = plot(section + offsetD, scale, style, 'color', cmap(i,:));
			j = plot([offsetD offsetD],[lowerLimit upperLimit],':', 'color', cmap(i,:));
			set(h,'LineWidth',1.5);
			set(j,'Parent',hGroup);
			set(h,'Parent',hGroup);
		else
			err = MException('crossplot:plotTypeUnknown', ['The format ' format ' is not valid.']);
			throw(err);			
		end

		set(get(get(hGroup,'Annotation'),'LegendInformation'),'IconDisplayStyle','on'); 
		legends{i} = label;
	end
	
	if strcmp(format,'spatial')
		ticks = 0:D:xPlotRange(2);
		set(gca,'XTick',ticks)
		set(gca,'XTickLabel',ticks/D)
	end
	legend(legends);
end