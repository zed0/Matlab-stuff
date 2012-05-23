function [ index ] = getIndex(filename)
%GETINDEX Gets the index number of the file from the filename
	matches = textscan(filename, 'B%d');
	index = matches{1};
end

