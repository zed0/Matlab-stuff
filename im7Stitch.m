function [target] = im7Stitch(foldername, filenumber)
%IM7CONVERT Convert a list of files from an im7 to a matrix
%	Pass this a list of folders that contain .im7 files.
%	The return value can be saved as a matrix.
%	Usage:
%		 folders={
%			'17May2C-TP4-5Dy322-3c6mus2c6mus0.8msX635mm';
%			'17May2C-TP4-5Dy322-3c6mus2c6mus1.1msX508mm';
%			'17May2C-TP4-5Dy322-3c6mus2c6mus0.6msX720mm';
%		}
%		result = im7Stitch(folders);

	if(nargin < 2)
		filenumber = 4;
	end
	fileRegex = ['B' sprintf('%05d', filenumber) '*.im7'];
	target = zeros(0,0);
	divMat = zeros(size(target));
	initialX = 0;
	Scale_X=0;
	Scale_Y=0;
	for i=1:size(foldername)
		folder = char(foldername(i));
		filename = dir([folder '/' fileRegex]);
		if(isempty(filename))
			err = MException('Im7Convert:FileNotFound', ['The folder ' folder ' does not contain the file you specified.']);
			throw(err);
		end
		filename = [folder '/' filename.name];
		v = loadvec(filename);
		
		matches = regexp(v.Attributes,'_SCALE_I=([-\d\.]*);','tokens');
		Scale_I = str2num(char(matches{1}));
		matches = regexp(v.Attributes,'_SCALE_X=([-\d\.]*);','tokens');
		Scale_X = str2num(char(matches{1}));
		matches = regexp(v.Attributes,'_SCALE_Y=([-\d\.]*);','tokens');
		Scale_Y = str2num(char(matches{1}));

		v.w = v.w*Scale_I;
		matches = regexp(v.setname,'X(\d*)mm','tokens');
		if(size(matches)==0)
			err = MException('Im7Convert:NoXPosition', 'No X position is given in the metadata for this file');
			throw(err);
		end

		xPos = str2num(char(matches{1}));
		xPos = round(xPos * Scale_X);
		
		if(size(target)==0)
			target = v.w;
			divMat = (v.w == 0) .* 0 + (v.w ~= 0) .* 1;
			initialX = xPos;
		else
			binMat = (v.w == 0) .* 0 + (v.w ~= 0) .* 1;
			if(xPos > initialX)
				[r1,c1] = size(target);
				[r2,c2] = size(v.w);
				target = [target zeros(r1, (xPos-initialX)-(c1-c2))];
				divMat = [divMat zeros(r1, (xPos-initialX)-(c1-c2))];
				[r1,c1] = size(v.w);
				target(1:r1, 1+xPos-initialX:c1+xPos-initialX) = target(1:r1, 1+xPos-initialX:c1+xPos-initialX) + v.w;
				divMat(1:r1, 1+xPos-initialX:c1+xPos-initialX) = divMat(1:r1, 1+xPos-initialX:c1+xPos-initialX) + binMat;
			elseif (xPos < initialX)
				[r1,c1] = size(target);
				target = [zeros(r1, initialX-xPos) target];
				divMat = [zeros(r1, initialX-xPos) divMat];
				[r1,c1] = size(v.w);
				target(1:r1, 1:c1) = target(1:r1, 1:c1) + v.w;
				divMat(1:r1, 1:c1) = divMat(1:r1, 1:c1) + binMat;
				initialX = xPos;
			end

		end
	end
	target = target ./ divMat;
	[r1,c1] = size(target);
	imagesc([0 r1*Scale_Y],[0 c1*Scale_X],target);
	return;
end