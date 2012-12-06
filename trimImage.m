function [ result ] = trimImage(image)
%TRIMIMAGE Removes whitespace rows from sides of images.
%   Detailed explanation goes here
	result = image(any(image,2),any(image,1));
end

