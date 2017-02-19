function [ result, x, y ] = trimImage(image)
%TRIMIMAGE Removes whitespace rows from sides of images.
%   Detailed explanation goes here
    y = any(image,2);
    x = any(image,1);
	result = image(y, x);
end

