function rename(filelist)
%	Rename files to be in the standardised format.
%	Version: 0.1
%	Author: Ben Falconer
%	Synatx:

% '18May2C-TP4-9Dy272-3c10mus2c10mus1.9msX254mm' is defined as our naming
% scheme

	%validPattern
	p1 = '^(?<day>\d+)';
	p2 = '(?<month>[a-zA-Z]+)';
	p3 = '(?<type>\d[a-zA-Z]+)-';
	p4 = 'TP(?<tp>[\da-zA-Z]+)-';
	p5 = '(?<d>[\d\.]+)D';
	p6 = 'y(?<y>\d+)-';
	p7 = '(?:3c)?(?<threec>\d+)?(?:mus)?'; %Yes, Matlab's regexes are terrible.
	p8 = '(?:2c)?(?<twoc>\d+)?(?:mus)?';
	p9 = '(?<delay>[\d\.]+)?(?:ms)?';
	p10 = '(?:X)?(?<x>\d+)?(?:mm)?';
	p11 = '(?<set>\.set)?$';
	validPattern = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11];

	%pattern1
	%deal with this format: 28Sept-3C-TP3C-1.5Dy212-3c12mus	
	p1 = '^(?<day>\d+)';
	p2 = '(?<month>[a-zA-Z]+)-';
	p3 = '(?<type>\d[a-zA-Z]+)-';
	p4 = 'TP(?<tp>[\da-zA-Z]+)-';
	p5 = '(?<d>[\d\.]+)D';
	p6 = 'y(?<y>\d+)-';
	p7 = '(?<threec>3c\d+mus)?'; %Yes, Matlab's regexes are terrible.
	p8 = '(?<twoc>2c\d+mus)?';
	p9 = '(?<delay>[\d\.]+ms)?';
	p10 = '(?<x>X\d+mm)?';
	p11 = '(?<set>\.set)?$';
	patterns{1} = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11];

	%pattern2
	%deal with this format: 30Sept-Symp-TP1A-3C-1.5Dy212-3c14mus
	p1 = '^(?<day>\d+)';
	p2 = '(?<month>[a-zA-Z]+)-';
	p3 = 'Symp-TP(?<tp>[\da-zA-Z]+)-';
	p4 = '(?<type>\d[a-zA-Z]+)-';
	p5 = '(?<d>[\d\.]+)D';
	p6 = 'y(?<y>\d+)-';
	p7 = '(?<threec>3c\d+mus)?'; %Yes, Matlab's regexes are terrible.
	p8 = '(?<twoc>2c\d+mus)?';
	p9 = '(?<delay>[\d\.]+ms)?';
	p10 = '(?<x>X\d+mm)?';
	p11 = '(?<set>\.set)?$';
	patterns{2} = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11];

	for i=1:size(filelist)
		filename = char(filelist(i));
		%check whether the filenames are already valid:
		matches = regexp(filename, validPattern, 'names');
		if ~isempty(matches)
			fprintf('Acceptable: %s\n',filename);
		else
			%If the files aren't in an acceptable format then report and
			%match them agains other known formats:
			fprintf('Broken: %s\n',filename);
			for j=1:size(patterns,2)
				matches = regexp(filename, patterns{j}, 'names');
				if ~isempty(matches)
					break;
				end
			end
			if ~isempty(matches)
				%If we have found a known format then we will rename it so
				%that it matches the standardised format:
				newName = [matches.day matches.month matches.type '-TP' matches.tp '-' matches.d 'Dy' matches.y '-' matches.threec matches.twoc matches.delay matches.x matches.set];
				fprintf('Fixed: %s\n', newName);
				movefile(filename, newName);
			end
		end
	end
end


