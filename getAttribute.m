function value = getAttribute( setname, attribute )
%	Get an attribute from the setname of an im7 file.
%	Version: 0.1
%	Author: Ben Falconer
%	Synatx:
%			getAttribute(v.setname, 'x')
%
%	setname is the setname property of the .im7 file you are interested in.
%	attribute is one of the following:
%		'day': day of the month the measurements were taken on
%		'month': the month the measurements were taken in
%		'type': one of 2C, 3CUp, 3CDwn indicating the type of measurement
%		'tp': the test point number
%		'd': the number of D at which the measurement was taken
%		'y': the distance in mm of the Y traverse for the measurement
%		'threec': the 3C pulse seperation
%		'twoc': the 2C pulse seperation
%		'delay': the delay between the 3C measurement and the 2C measurement
%		'x': the distance in mm of the X traverse for the measurement
%	Note that some of these may not be present depending on the measurement

p1 = '^(?<day>\d+)';
p2 = '(?<month>[a-zA-Z]+)';
p3 = '(?<type>\d[a-zA-Z]+)-';
p4 = 'TP(?<tp>[\da-zA-Z]+)-';
p5 = '(?<d>[\d\.]+)D';
p6 = 'y(?<y>\d+)-';
p7 = '(?:3c)?(?<threec>\d+)?(?:mus)?'; %Yes, Matlab's regexes are terrible.
p8 = '(?:2c)?(?<twoc>\d+)?(?:mus)?';
p9 = '(?<delay>[\d\.]+)?(?:ms)?';
p10 = '(?:X)?(?<x>\d+)?(?:mm)?$';

pattern = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10];

%match the above pattern in the setname:
matches = regexp(setname, pattern, 'names');
	if size(matches) > 0
		%return the requested match:
		value = char(matches.(attribute));
	else
		%if there are no matches then error:
		err = MException('getAttribute:noAttribute', ['No value for ' attribute ' is given in the metadata for this file']);
		throw(err);
	end
end


