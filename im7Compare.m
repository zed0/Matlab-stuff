function [difference] = im7Compare(file1, file2, index)
%IM7COMPARE Summary of this function goes here
%   Detailed explanation goes here

	img1 = im7Load(file1,'3C');
	img2 = im7Load(file2,'3C');
	img1.index = index;
	img2.index = index;
	%if they are huge then downscale to make them reasonable:
	quickDownscale(img1, 1000, 2);
	quickDownscale(img2, 1000, 2);

	%rescale images so they can be compared:
	cmp1 = remapf(img1, linspace(200, -200, 400), linspace(-200, 200, 400));
	cmp2 = remapf(img2, linspace(200, -200, 400), linspace(-200, 200, 400));
	%subtract image 2 from image 1:
	difference = operf('-',cmp1,cmp2);
end

