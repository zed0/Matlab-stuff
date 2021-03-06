function [ v ] = im7Load( filename, type)
%GET3CPLOT Summary of this function goes here
%   Adjust a vector to our axes and apply the various scaling factors
%	Currently only geared for 3C shots, I will add 2C shots at a later
%	date
%	type will normally be automatically detected, if not you should specify
%	it or expect incorrect results.

	run('symphonySettings');

	%load the im7 file in:
	v = loadvec(filename);

	%work around a bug that stops the axes being labeled correctly:
	[~,~,~,v.namex] = getScale(v.Attributes,'X');
	[~,~,~,v.namey] = getScale(v.Attributes,'Y');
	[~,~,~,v.namew] = getScale(v.Attributes,'I');
	v.index = getIndex(v.name);

	%use the I scaling factor if it applies to the current image:
	try
		[ scaleI ] = getScale(v.Attributes, 'I');
		v.w = v.w*scaleI;
	catch err
	end

	%Do adjustments based on which type of measurement we are taking:
	%(i.e. 2C measurements use different axes from 3C ones)

	if(nargin < 2)
		type = getAttribute(v.setname, 'type');
	end
	if strcmp(type,'3C') || strcmp(type,'3CUp')
		%3C Upstream Adjustments:

		%flip the Z axis:
		v.x = v.x .* -1;


		s = warning('error', 'MATLAB:getAttribute:no_attrib');
		try
			%and offset for the current traverse position:
			v = setoriginf(v, [str2double(getAttribute(v.setname, 'y')), 0]);
			%offset aditionally for the traverse base position:
			v = setoriginf(v, [-travZBase, 0]);

			%translate the plot so that our 0 agrees with their 0:
			v = setoriginf(v, [upTargetOffsetZ, upTargetOffsetY]);
		catch error
			if strcmp(error.identifier,'MATLAB:getAttribute:no_attrib')
				warning('MATLAB:im7Load:no_attribs', 'Skipping translating data due to no attributes');
			else
				rethrow(error)
			end
		end
		warning(s)

		%rename the axes to agree with ours:
		v = changefieldf(v,'namex','z');
		v = changefieldf(v,'namey','y');

	elseif strcmp(type,'3CDwn')
		%3C Downstream Adjustments:

		%rename the axes to agree with ours:
		v = changefieldf(v,'namex','z');
		v = changefieldf(v,'namey','y');

		%translate the plot so that our 0 agrees with their 0:
		v = setoriginf(v, [dwnTargetOffsetZ, dwnTargetOffsetY]);

		%offset aditionally for the traverse base position:
		v = setoriginf(v, [travZBase, 0]);
		%and offset for the current traverse position:
		v = setoriginf(v, [-str2double(getAttribute(v.setname, 'y')), 0]);

		%DON'T flip the Z axis this time:
		%v.x = v.x .* -1;

	elseif strcmp(type,'2C')
		%2C Adjustments:

		%rename the axes to agree with ours:
		v = changefieldf(v,'namex','z');
		v = changefieldf(v,'namey','x');

		%translate the plot so that our 0 agrees with their 0:
		v = setoriginf(v, [twoCTargetOffsetZ, twoCTargetOffsetX]);

		%offset for the traverse base position:
		v = setoriginf(v, [travZBase, 0]);
		%and offset for the current traverse position:
		v = setoriginf(v, [-str2double(getAttribute(v.setname, 'y')), 0]);

		%offset for the D position:
		%not sure which of these is correct, the first gives better looking
		%results.
 		%v = setoriginf(v, [0 , (D/2)*str2double(getAttribute(v.setname, 'd'))]);
		v = setoriginf(v, [0 , D*str2double(getAttribute(v.setname, 'd'))]);

		%offset additionally for the Dantec base position:
 		%v = setoriginf(v, [0, dantecBase]);
		%and offset for the current Dantec position:
		%v = setoriginf(v, [0, str2double(getAttribute(v.setname, 'x'))/2]);
 		v = setoriginf(v, [0, str2double(getAttribute(v.setname, 'x'))]);

		%flip the x axis:
		v.y = v.y .* -1;
	end
end

