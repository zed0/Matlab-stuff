function closeFigs(figs)
%CLOSEFIGS close all figures in input array, 'figs'
	arrayfun(@(x) close(x), figs(figs>0));
end