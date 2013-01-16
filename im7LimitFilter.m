function [v] = im7LimitFilter(v, limit, value)
%IM7LIMITFILTER change values above limit to be value
%   Detailed explanation goes here
	v.w(v.w>limit)=value;
end


