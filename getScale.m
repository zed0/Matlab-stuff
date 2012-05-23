function [ scale offset units name ] = getScale( attributes, axis)
%	Get scale, offset and units from the attributes metadata of an im7 file.
%	Version: 0.1
%	Author: Ben Falconer
%	Synatx:
%			[ scaleI offsetI unitsI ] = getScale(v.Attributes, 'I');
%
%	setname is the setname property of the .im7 file you are interested in.
%	attribute is generally one of the following:
%		'X': X axis details
%		'Y': Y axis details
%		'I': 
%		'W': Values for the w matrix

%regex to match the attributes string
	matches = regexp(attributes,strcat('_SCALE_',axis,'=(?<scale>[-\d\.]*);(?<offset>[-\d\.]*);(?<units>[^;]*);(?<name>[^ ]*?);\s'),'names');
	if size(matches) > 0
		%if we have a match then return the values we found
		scale = str2double(char(matches.scale));
		offset = str2double(char(matches.offset));
		units = char(matches.units);
		name = regexprep(matches.name, ';', ' ');
	else
		%if we can't find a match then error:
		err = MException('getScale:noScaleFactor', ['No matches for ' axis ' were found in the given attributes']);
		throw(err);
	end
end

