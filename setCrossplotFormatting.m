function setCrossplotFormatting(v)
%SETCROSSPLOTFORMATTING Summary of this function goes here
%   Detailed explanation goes here
	run('symphonySettings');

	%Reverse X direction so that negative is to the right
	set(gca,'XDir','reverse');

	%Set title
	t = title(['Testpoint ', getAttribute(v.setname, 'tp'), ', ' v.namew]);
	xlabel(['z (' v.unitx ')']);
	ylabel([v.namew ' (' v.unitw ')']);
	set(gca, 'xlim', zCrossLimits);

	%Set font size for various parts of the plot
	set(t, 'FontSize', 20);
	set(gca,'FontSize',12);
	labelX = get(gca,'XLabel');
	set(labelX,'FontSize',15);
	labelY = get(gca,'YLabel');
	set(labelY,'FontSize',15);
end