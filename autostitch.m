function [canvas, row, col, cmap, target, targetY, targetX] = ...
    autostitch(image1, image2, ydist, xdist)
%AUTOSTITCH - Automatically stitches 2 images together
% Canvas is the resulting canvas of the 2 images
% row and col are the offset between the origins of the 2 images
	
	s1 = size(image1,1);
	s2 = size(image2,1);
	t1 = size(image1,2);
	t2 = size(image2,2);
    targetY = ydist(1)*s2;
    targetX = xdist(1)*t2;
    targetY2 = ydist(2)*s2;
    targetX2 = xdist(2)*t2;
	target = image2(targetY:targetY2,targetX:targetX2);
	dy = ydist(1)*s2;
	dx = xdist(1)*t2;
	s3 = size(target,1);
	t3 = size(target,2);

	canvas = zeros(s2+s1+s2,t2+t1+t2);
	count = zeros(s2+s1+s2,t2+t1+t2);

	canvas(s2+1:s2+s1, t2+1:t2+t1) = image1;
	count(s2+1:s2+s1, t2+1:t2+t1) = getMask(image1);

	cmap = normxcorr2(target, canvas);
	[row col] = find(cmap == max(max(cmap)));
	row = row-s3-dy; %offset for only taking a third of the image
	col = col-t3-dx; %offset for only taking a third of the image
	canvas(row+1:row+s2, col+1:col+t2) = canvas(row+1:row+s2, col+1:col+t2) + image2;
	count(row+1:row+s2, col+1:col+t2) = count(row+1:row+s2, col+1:col+t2) + getMask(image2);

	canvas = canvas ./count;
end