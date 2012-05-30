function setSpatialCrossplotFormatting(v)
%SETCROSSPLOTFORMATTING Summary of this function goes here
%   Detailed explanation goes here
	run('symphonySettings');

	%Set title
	t = title(['Testpoint ', getAttribute(v.setname, 'tp'), ', ' v.namew]);
	ylabel(['z (' v.unitx ')']);
	xlabel('X (D)');
	set(gca, 'ylim', zCrossLimits);

	%Set font size for various parts of the plot
	set(t, 'FontSize', 20);
	set(gca,'FontSize',12);
	labelX = get(gca,'XLabel');
	set(labelX,'FontSize',15);
	labelY = get(gca,'YLabel');
	set(labelY,'FontSize',15);
end