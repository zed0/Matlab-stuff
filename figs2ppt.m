function [ ppt ] = figs2ppt(filename, figures, layout)
%FIG2PPT Create a ppt file from a matrix of figures
%	filename: the name of the file to be saved to
%	figures: a 1D array of figures to plot
%	layout: an x,y number of figures to plot to each slide, i.e. [2 3] if
%		you wished to plot 2 columns and 3 rows on each slide
%	Example usage:
%		a = figure();
%		b = figure();
%		figs = [a b];
%		figs2ppt(['figures.ppt'], figs, [1 2]);

	%initialise the powerpoint presentation:
	ppt=saveppt2(filename,'init');

	%work out how many plots we need per slide:
	figsPerSlide = layout(1)*layout(2);

	for i=1:figsPerSlide:size(figures,1)
		%get a sub array of figures for each slide and pad it with zeros to
		%make it up to the required size:
		numFigs = min([figsPerSlide size(figures,1)-i+1]);
		currentFigs = zeros(figsPerSlide,1);
		currentFigs(1:numFigs) = figures(i:i+numFigs-1);

		%draw the sub array to the powerpoint slide:
		saveppt2('ppt', ppt, ...
			'figure', currentFigs, ...
			'resolution', 600, ...
			'col', layout(1), ...
			'stretch',false ...
		);
	end
	%save and close the powerpoint presentation:
	saveppt2(filename,'ppt',ppt,'save');
	saveppt2(filename,'ppt',ppt,'close');
end

