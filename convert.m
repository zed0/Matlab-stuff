%	IM7 to .ppt converter.
%	Version: 0.1
%	Author: Ben Falconer
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

%max number of .im7 files, this is 17 by default
max = 17;
figs = [];
for i=1:max
	%it is currently necessary to add the file name here, this will be
	%changed in a later version.
	fname = strcat('17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm\B000',sprintf('%02d',i),'*')
	v = loadvec(fname);
	%use the I scaling factor if it applies to the current image:
	Scale = regexp(v.Attributes,'_SCALE_I=([\d\.]*);','tokens');
	if size(Scale) > 0
		Scale_I = str2num(char(Scale{1}));
		v.w = v.w*Scale_I;
	end
	%output the plot to a figure
	a = figure();
	showf(v,'cmap','jet');
	%make a vector of up to 4 figures and then add all the figures to a
	%Powerpoint slide:
	figs = [figs a];
	if mod(i,4)==0 || i==max
		saveppt2('test.ppt','resolution',600,'f',figs)
		figs = [];
		close all;
	end
end