function im72ppt(filebase)
%	IM7 to .ppt converter.
%	Version: 0.2
%	Author: Ben Falconer
%	Synatx:
%		im2ppt(basename, [template, [padding]])
%		im2ppt('17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm')

	%Initialise all the variables for the symphony test:
	run('symphonySettings');

	%max number of .im7 files, this is 17 by default
	max = numFiles;

	%Create a vector to hold our figures:
	figs = zeros(max,1);

	for i=1:max
		%Choose the file for this itteration:
		filename = [filebase '\B' sprintf('%05d', i) '*.im7'];

		%Load the data from the file:
		v = im7Load(filename);

		%Create a figure for our output:
		a = figure();
		set(a,'visible','off'); %prevent all the figures popping up

		%Plot to the figure:
		%(colorLimits(...) gets the colour limits from the settings file)
		showf(v);
		%Set the formatting for the Plot to our standard settings:
		setPlotFormatting(v);

		set(a,'visible','off'); %showf makes the figures pop up again, this surpresses it.
		figs(i) = a;
	end

	%convert our matrix of figures into a powerpoint presentation:
	figs2ppt([filebase '.ppt'], figs, [3 2]);
	
	%Free up the figures we were using:
	closeFigs(figs);
end