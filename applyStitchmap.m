function [target] = applyStitchmap(stitchmap, folders, index)
%APPLYSTITCHMAP Summary of this function goes here
%   Detailed explanation goes here
	run('symphonySettings');
	newX = -400:0.7032:400;
	newY = -200:0.7032:3000;

	
	target = struct;
	target.w = zeros(size(stitchmap));
	target.x = newX;
	target.y = newY;
	target.setname = '';

	for i=1:size(folders)
		if(nargin < 3)
			v = folders{i};
		else
			v = im7Load([folders{i} '/B' sprintf('%05d', index) '*.im7']);
		end
		if i == 1
			%Use the current scale:
			newScaleX = getScale(v.Attributes, 'X');
			newScaleY = getScale(v.Attributes, 'Y');
			target.scalex = newScaleX;
			target.scaley = newScaleY;
			target.Attributes = v.Attributes;
			target.namex = v.namex;
			target.namey = v.namey;
			target.namew = v.namew;
			target.unitx = v.unitx;
			target.unity = v.unity;
			target.unitw = v.unitw;
			target.ysign = v.ysign;
			target.index = v.index;
			target.name = ['B' sprintf('%05d', v.index) 'Stitched Image'];
			target.history = {['created from ' v.setname]};
		end
		v = pasteOnCanvas(v, newX, newY);
		target.w(stitchmap==i) = v.w(stitchmap==i);
	end
end