function [mask] = getImageMask(v)
%GETMASK Returns a mask for the image
%   This mask will be 1 in locations where the image has data and 0 where
%   it does not.
	mask = (v.w == 0) .* 0 + (v.w ~= 0) .* 1;
end

