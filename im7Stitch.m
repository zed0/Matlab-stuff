function [target] = im7Stitch(foldername, filenumber,x_filter,y_filter)
%IM7STITCH Convert a list of files from an im7 to a matrix
%	Pass this a list of folders that contain .im7 files.
%	The return value can be saved as a matrix.
%	Usage:
%		 folders={
%			'17May2C-TP4-5Dy322-3c6mus2c6mus0.8msX635mm';
%			'17May2C-TP4-5Dy322-3c6mus2c6mus1.1msX508mm';
%			'17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm';
%		}
%		result = im7Stitch(folders);
	run('symphonySettings');

	if(nargin < 2)
		filenumber = 4;
	end
	if(nargin < 4)
		x_filter = 0;
		y_filter = 0;
	end

	target = struct;
	target.w = zeros(0,0);
	target.name = ['B' sprintf('%05d', filenumber) 'Stitched Image'];
	target.setname = '';
	target.mask = zeros(0,0);
	for i=1:size(foldername)
		v = im7NaiveFilter(im7Load([foldername{i} '/B' sprintf('%05d', filenumber) '*.im7']),x_filter, y_filter);
		
		newScaleX = getScale(v.Attributes, 'X');
		newScaleY = getScale(v.Attributes, 'Y');

		if i == 1
			%Use the current scale:
			target.scalex = newScaleX;
			target.scaley = newScaleY;
			target.x = v.x;
			target.y = v.y;
			target.Attributes = v.Attributes;
			target.namex = v.namex;
			target.namey = v.namey;
			target.namew = v.namew;
			target.unitx = v.unitx;
			target.unity = v.unity;
			target.unitw = v.unitw;
			target.ysign = v.ysign;
			target.index = v.index;
			target.history = {['created from ' v.setname]};
			
% 			axisX = -200:newScaleX:4000;
% 			axisY = -400:newScaleY:400;

			%Create our canvas:
			target.w = v.w;
			target.mask = getImageMask(target);
		else
			if target.scalex ~= newScaleX || target.scaley ~= newScaleY
				%If v is at a different scale we have to adjust it to the main
				%scale
				%%%%%%%%
				% TODO: nothing needs this at the moment, will throw a
				% warning if something needs to be done.
				%%%%%%%%
				throw(MException('im7Stitch:NotImplemented',...
					'The im7Stitch function does not yet support using images of differing scales'));
			end

			%Get our new X and Y axes:
			newX = [min(min(target.x), min(v.x)) max(max(target.x), max(v.x))];
			newY = [min(min(target.y), min(v.y)) max(max(target.y), max(v.y))];

			%Adjust the target image to accomodate the image to be
			%stitched:
			target = recentreImage(target, newX, newY);
			
			current = recentreImage(v, newX, newY);
			%Find the range the stitched image will cover:
% 			rangeX = getCoordinateFromReal(target.x, v.x(1)):getCoordinateFromReal(target.x, v.x(1))+size(v.x,2)-1;
% 			rangeY = getCoordinateFromReal(target.y, v.y(1)):getCoordinateFromReal(target.y, v.y(1))+size(v.y,2)-1;

			%Paste our new image on top:
			target.mask = getImageMask(target) + getImageMask(current);
			target.w = target.w + current.w;
			target.w = target.w ./ target.mask;
% 			target.w(rangeX, rangeY) = target.w(rangeX, rangeY) + v.w;
% 			target.mask(rangeX, rangeY) = target.mask(rangeX, rangeY) + newMask;
		end
	end
%  	target.w = target.w ./ target.mask;
end