function [ index ] = getIndex(filename)
%GETINDEX Gets the index number of the file from the filename
	%get only the main part of the filename, drop the extension etc:
	[~,name,~] = fileparts(filename);
	%match the file number:
	matches = textscan(name, 'B%d');
	index = matches{1};
end

