function value = getAttribute( setname, attribute )

p1 = '^(?<day>\d+)';
p2 = '(?<month>[a-zA-Z]+)';
p3 = '(?<type>\d[a-zA-Z]+)-';
p4 = 'TP(?<tp>\d+)-';
p5 = '(?<d>[\d\.]+)D';
p6 = 'y(?<y>\d+)-';
p7 = '(?:3c)?(?<threec>\d+)?(?:mus)?'; %Yes, Matlab's regexes are terrible.
p8 = '(?:2c)?(?<twoc>\d+)?(?:mus)?';
p9 = '(?<delay>[\d\.]+)?(?:ms)?';
p10 = 'X(?<x>\d+)mm$';

pattern = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10];

matches = regexp(setname, pattern, 'names');
	if size(matches) > 0
		value = char(matches.(attribute));
	else
		err = MException('getAttribute:noAttribute', strcat('No value for ', attribute, ' is given in the metadata for this file'));
		throw(err);
	end
end


