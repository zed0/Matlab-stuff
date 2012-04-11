function im2ppt(filebase, template, padding, introtext)
%	IM7 to .ppt converter.
%	Version: 0.2
%	Author: Ben Falconer
%	Synatx:
%		im2ppt(basename, [template, [padding]])
%		im2ppt('17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm')
%		im2ppt('17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm', 'template.potx')
%		im2ppt('17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm', 'template.potx', [0, 0, 0, 60])
%		im2ppt('17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm', 'template.potx', [0, 0, 0, 60], 'intro text')
%
%	This requires that Powerpoint (at least 2007) is installed on the
%	computer and the following Matlab libraries:
%	pivmat:
%		available at: http://www.fast.u-psud.fr/pivmat/
%	readimx:
%		avaliable for Windows 32-bit at: http://www.fast.u-psud.fr/pivmat/readimx4matlab_v1.5R1_2009.zip
%		available for Windows 64-bit at: http://www.fast.u-psud.fr/pivmat/readimx4matlab_v1.5R1_2009_64.zip
%	saveppt2:
%		available at: https://github.com/jedediahfrey/Jedediah-Frey-s-MATLABCentral-Projects/tree/master/saveppt2
%
%	This early version is very rough and requires changing of the input
%	file and save path upon each run, later versions should be able to be
%	passed a path and save a .ppt with the correct name as well as
%	formatting the slides in a more appropriate format.
%
%	TODO:
%		Add titles to the slides
%		Change to a function which can be passed a folder name
%		Stop non-stereoscopic images producing plots in the z direction
%		Check if file already exists and make a new file if so

%file basename, this should generally be the folder name assuming that the
%files are in the standard B000XX_*.im7 format
%filebase = '17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm';

%padding, this is used for padding around the images, this is useful when
%using a template as it allows definition of padding at the bottom
%padding = [left, right, top, bottom]
	if nargin < 2
		template = '';
	end
	if nargin < 3
		padding = 0;
	end
	if nargin < 4
		introtext = '';
	end
	%max number of .im7 files, this is 17 by default
	max = 17;

	figs = [];
	pptname = strcat(filebase,'.ppt');
	if strcmp('',template)
		ppt=saveppt2(pptname,'init');
	else
		ppt=saveppt2(pptname,'init','template',template);
	end
	
	if ~strcmp('',introtext)
		saveppt2('ppt',ppt,'padding',padding,'textbox',introtext);
	end

	%make a vector of up to 4 figures and then add all the figures to a
	%Powerpoint slide:
	saveppt2('ppt',ppt,'figure',figs,'resolution',600,'padding',padding)
	figs = [];
	close all;

	for i=1:max
		fname = strcat(filebase,'\B000',sprintf('%02d',i),'*')
		v = loadvec(fname);
		%use the I scaling factor if it applies to the current image:
		try
			[ scaleI ] = getScale(v.Attributes, 'I');
			v.w = v.w*scaleI;
		catch err
		end
		%output the plot to a figure
		a = figure();
		showf(v,'cmap','jet');
		%make a vector of up to 4 figures and then add all the figures to a
		%Powerpoint slide:
		figs = [figs a];
		if mod(i,4)==0 || i==max
			saveppt2('ppt',ppt,'figure',figs,'resolution',600,'padding',padding)
			figs = [];
			close all;
		end
	end
	saveppt2(pptname,'ppt',ppt,'save');
	saveppt2(pptname,'ppt',ppt,'close');
end