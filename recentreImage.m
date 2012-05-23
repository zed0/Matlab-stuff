function [v] = recentreImage(v,x,y)
%RECENTREIMAGE Recentres an image to fit between the given coordinates.
%
%	WARNING: This is a lossy opperation so only use it directly before
%	plotting otherwise you risk losing data.
%
%   for example if you called:
%		recentreImage(v, [0 300], [50 100])
%		the original v.w would be plotted in the range [0 300], [50 100]
%		according to the original axis labels
%	Note:  This is basically just a shortcut for the remapf function.

	%calculate the scale that the X and Y axes are currently using:
	scaleX = abs(v.x(end) - v.x(1))/size(v.x,2);
	scaleY = abs(v.y(end) - v.y(1))/size(v.y,2);
	
	%calculate the new range at the same scale:
	rangeX = (x(2)-x(1))*scaleX;
	rangeY = (y(2)-y(1))*scaleY;
	
	%resize the grid:
	v = remapf(v, linspace(x(1),x(2),rangeX), linspace(y(1),y(2),rangeY));
end

