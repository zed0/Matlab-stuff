function [rf] = recentreImage(f,newx,newy)
%RECENTREIMAGE Recentres an image to fit between the given real coordinates
%in mm.
%	Note that this may give a slightly larger range than you are expecting
%	but it is garanteed to at least cover the range.
%
%	WARNING: This is a lossy opperation so only use it directly before
%	plotting otherwise you risk losing data.
%
%   for example if you called:
%		recentreImage(v, [0 300], [50 100])
%		the original v.w would be plotted in the range [0 300], [50 100]
%		according to the original axis labels
%	Note:  This is an almost exact clone of the remapf function.

	%calculate the scale that the X and Y axes are currently using:
	scaleX = (f.x(end) - f.x(1))/size(f.x,2);
	scaleY = (f.y(end) - f.y(1))/size(f.y,2);

	%calculate the new range at the same scale:
	rangeX = newx(1):scaleX:newx(2);
	rangeY = newy(1):scaleY:newy(2);

	%resize the grid:
	rf = f;
	[xo,yo] = ndgrid(rf.x, rf.y);		% old grid
	[xi,yi] = ndgrid(rangeX,rangeY);	% new grid

	%copy across the new attributes:
	rf.x = rangeX;
	rf.y = rangeY;
	%adjust the w array to the new grid:
	rf.w = griddata(xo,yo,f.w,xi,yi,'nearest');
	if isfield(f,'mask')
		rf.mask = griddata(xo,yo,f.mask,xi,yi,'nearest');
	end
	%add the process to the history:
	rf.history = {f.history{:} ['remapf(ans, X, Y)']}';
	%set undefined elements to zero:
	rf = nantozerofield(rf);
end

