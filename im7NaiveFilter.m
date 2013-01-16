function [v] = im7NaiveFilter(v, filter_left, filter_right, filter_top, filter_bot, proportion)
%IM7NAIEVEFILTER Summary of this function goes here
%   Takes an im7 and sets the borders to 0, either for a number of rows or
%   for a fraction of the image

	if nargin < 6
		proportion = true;
	end

	if proportion
		size_left = round(filter_left*size(v.w, 1));
		size_right = round(filter_right*size(v.w, 1));
		size_top = round(filter_top*size(v.w, 2));
		size_bot = round(filter_bot*size(v.w, 2));
		v.w(1:size_left,:) = 0;
		v.w(end-size_right:end,:) = 0;
		v.w(:,1:size_top) = 0;
		v.w(:,end-size_bot:end) = 0;
	else
		v.w(1:filter_left,:) = 0;
		v.w(end-filter_right:end,:) = 0;
		v.w(:,1:filter_top) = 0;
		v.w(:,end-filter_bot:end) = 0;
	end

end

