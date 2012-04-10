function [ scale offset units ] = getScale( attributes, axis)
%GETSCALE Summary of this function goes here
%   Detailed explanation goes here

	matches = regexp(attributes,strcat('_SCALE_',axis,'=([-\d\.]*);([-\d\.]*);([^;]*)'),'tokens');
	if size(matches) > 0
		scale = str2num(char(matches{1}{1}));
		offset = str2num(char(matches{1}{2}));
		units = char(matches{1}{3});
	else
		err = MException('getScale:noScaleFactor', strcat('No matches for ',axis,' were found in the given attributes'));
		throw(err);
	end
end

