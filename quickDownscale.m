function [result] = quickDownscale(im7, maxSize, factor)
%QUICKDOWNSCALE Scales im7 down by factor repeatedly until it is under
%maxSize
	result = im7;
	while size(result.w) > maxSize
		%reduce size by a half:
		result.w = result.w(1:factor:end, 1:factor:end);
		result.x = result.x(1:factor:end);
		result.y = result.y(1:factor:end);
	end
end

