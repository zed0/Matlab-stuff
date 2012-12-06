function [v] = im7NaiveFilter(v, x_filter, y_filter, proportion)
%IM7NAIEVEFILTER Summary of this function goes here
%   Takes an im7 and sets the borders to 0, either for a number of rows or
%   for a fraction of the image

	if nargin < 4
		proportion = true;
	end

	if proportion
		size_x = round(x_filter*size(v.w, 1));
		size_y = round(y_filter*size(v.w, 2));
		v.w(1:size_x,:) = 0;
		v.w(end-size_x:end,:) = 0;
		v.w(:,1:size_y) = 0;
		v.w(:,end-size_y:end) = 0;
	else
		v.w(1:x_filter,:) = 0;
		v.w(end-x_filter:end,:) = 0;
		v.w(:,1:y_filter) = 0;
		v.w(:,end-y_filter:end) = 0;
	end

end

