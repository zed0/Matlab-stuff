function setPlotFormatting(v)
%SETPLOTFORMATTING Summary of this function goes here
%   Detailed explanation goes here

	%Reverse X direction so that negative is to the right
	set(gca,'XDir','reverse');

	%Set title
	t = title(['Testpoint ', getAttribute(v.setname, 'tp'), ', ', getAttribute(v.setname, 'd'), 'D']);
	
	%Set font size for various parts of the plot
	set(t, 'FontSize', 20);
	set(gca,'FontSize',12);
	labelX = get(gca,'XLabel');
	set(labelX,'FontSize',15);
	labelY = get(gca,'YLabel');
	set(labelY,'FontSize',15);

	%Set attributes for the colorbar:
	c = colorbar('FontSize',12);	%Tick font size
	colormap('jet');				%Colour scheme
	ylabel(c,[v.namew ' (' v.unitw ')'], 'FontSize', 15); %Label
end

