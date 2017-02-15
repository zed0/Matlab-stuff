function [target, stitchmap] = im7Stitch(foldername, filenumber,filter_left,filter_right,filter_top,filter_bot,limit)
%IM7STITCH Convert a list of files from an im7 to a matrix
%	Pass this a list of folders that contain .im7 files.
%	The return value can be saved as a matrix.
%	Also accepts a list of data rather than filenames.
%	Usage:
%		 folders={
%			'17May2C-TP4-5Dy322-3c6mus2c6mus0.8msX635mm';
%			'17May2C-TP4-5Dy322-3c6mus2c6mus1.1msX508mm';
%			'17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm';
%		}
%		result = im7Stitch(folders);
%	Or:
%		 folders={
%			a;
%			b;
%			c;
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
	
	if ischar(foldername{1})
		v = im7Load([foldername{1} '/B' sprintf('%05d', filenumber) '*.im7']);
	else
		v = foldername{1};
	end
	newScaleX = getScale(v.Attributes, 'X');
	newScaleY = getScale(v.Attributes, 'Y');
	newX = -400:abs(newScaleX):400;
	newY = -200:abs(newScaleY):3000;

	%Get our new X and Y axes:
% 	newX = -500:abs(newScaleX):500;
%  	newY = -200:abs(newScaleY):4000;
	%newX = -400:0.7032:400;
	%newY = -200:0.7032:3000;
% 	newX = -400:1.4058:400;
% 	newY = -200:1.4058:3000;


	target = struct;
	target.w = zeros(0,0);
	target.name = ['B' sprintf('%05d', filenumber) 'Stitched Image'];
	target.setname = '';
	target.mask = zeros(0,0);

	stitchmap = zeros(size(newX,2),size(newY,2));
	for i=1:size(foldername)
		if ischar(foldername{i})
			disp(['Currently processing ' num2str(i) '/' num2str(size(foldername,1)) ': ' foldername{i}]);
			v = im7Load([foldername{i} '/B' sprintf('%05d', filenumber) '*.im7']);
		else
			v = foldername{i};
			disp(['Currently processing ' num2str(i) '/' num2str(size(foldername,1)) ': ' v.setname]);
		end
		v = im7NaiveFilter(v,filter_left,filter_right,filter_top,filter_bot);
		if(nargin >= 7)
			v = im7LimitFilter(v,limit,0);
		end
		
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
			
			%Create our canvas:
			target.w = v.w;
			%target.mask = getImageMask(target);
			%Adjust the target image to accomodate the image to be
			%stitched if it needs to be expanded:
			if newX(1) < target.x(1) || newX(end) > target.x(end) || newY(1) < target.y(1) || newY(end) > target.y(end)
				target = pasteOnCanvas(target, newX, newY);
				disp('expanded');
			end
			stitchmap(target.w~=0) = i;
		else

			if target.scalex ~= newScaleX || target.scaley ~= newScaleY
				%If v is at a different scale we have to adjust it to the main
				%scale
				%%%%%%%%
				% TODO: nothing needs this at the moment, will throw a
				% warning if something needs to be done.
				%%%%%%%%
				warning(['Not all images are the same scale, the resulting image may be incorrect! (',...
					num2str(newScaleX), ',', num2str(newScaleY), ' comapred to ', num2str(target.scalex), ',', num2str(target.scaley), ')']);
% 				disp(['Skipping ' v.setname]);
% 				continue
%  				throw(MException('im7Stitch:NotImplemented',...
%  					'The im7Stitch function does not yet support using images of differing scales'));
			end

			current = v;
			if newX(1) < current.x(1) || newX(end) > current.x(end) || newY(1) < current.y(1) || newY(end) > current.y(end)
				current = pasteOnCanvas(current, newX, newY);
				disp('expanded');
			end

			%Paste our new image on top:
% 			target.mask = getImageMask(target) + getImageMask(current);
% 			target.w = target.w + current.w;
% 			target.w = target.w ./ target.mask;
%Trying taking minimum of both images in overlapping portions:
			target.w(target.w==0) = NaN;
			current.w(current.w==0) = NaN;
			stitchmap(current.w<target.w|(~isnan(current.w)&isnan(target.w))) = i;
			target.w = min(target.w,current.w);
		end
	end
%  	target.w = target.w ./ target.mask;
end