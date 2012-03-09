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

	D = 157.43;
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

		disp(strcat(char(foldername(i)),'Scale_I=',num2str(Scale_I),'; Scale_X=',num2str(Scale_X),'; Scale_Y=',num2str(Scale_Y)));

 		v.w = v.w*Scale_I;
		matches = regexp(v.setname,'X(\d*)mm','tokens');
		if(size(matches)==0)
			err = MException('Im7Convert:NoXPosition', 'No X position is given in the metadata for this file');
			throw(err);
		end

		xPos = 720 - str2num(char(matches{1}));

		matches = regexp(v.setname,'-(\d*)Dy','tokens');
		if(size(matches)==0)
			err = MException('Im7Convert:NoDPosition', 'No D position is given in the metadata for this file');
			throw(err);
		end
		
		Distance = D*str2num(char(matches{1}));

		xPos = xPos - Distance;
		xPos = round(xPos * Scale_X);
		
		matches = regexp(v.setname,'Dy(\d*)-','tokens');
		if(size(matches)==0)
			err = MException('Im7Convert:NoYPosition', 'No Y position is given in the metadata for this file');
			throw(err);
		end

		yPos = str2num(char(matches{1}));
		yPos = -1*round(yPos *2*Scale_Y); %For some reason there is a factor of 2 here.
		%yPos = -1*round(yPos *Scale_Y);

		if(size(target)==0)
			target = v.w;
			divMat = (v.w == 0) .* 0 + (v.w ~= 0) .* 1;
			initialX = xPos;
			initialY = yPos;
		else
 			binMat = (v.w == 0) .* 0 + (v.w ~= 0) .* 1;
			[r2,c2] = size(v.w);
			xRange = 1:c2;
			yRange = 1:r2;
			[r1,c1] = size(target);
			if(xPos > initialX)
				target = [target zeros(r1, (xPos-initialX)-(c1-c2))];
				divMat = [divMat zeros(r1, (xPos-initialX)-(c1-c2))];
				xRange = 1+xPos-initialX:c2+xPos-initialX;
			elseif (xPos < initialX)
				target = [zeros(r1, initialX-xPos) target];
				divMat = [zeros(r1, initialX-xPos) divMat];
				initialX = xPos;
			end
			[r1,c1] = size(target);
			if(yPos > initialY)
				target = [target;zeros((yPos-initialY)-(r1-r2), c1)];
				divMat = [divMat;zeros((yPos-initialY)-(r1-r2), c1)];
				yRange = 1+yPos-initialY:r2+yPos-initialY;
			elseif (yPos < initialY)
				target = [zeros(initialY-yPos, c1);target];
				divMat = [zeros(initialY-yPos, c1);divMat];
				initialY = yPos;
			end
			target(yRange, xRange) = target(yRange, xRange) + v.w;
			divMat(yRange, xRange) = divMat(yRange, xRange) + binMat;
		end
	end
	target = target ./ divMat;
	[r1,c1] = size(target);
	imagesc([c1*Scale_X 0],[r1*Scale_Y 0],target);
	return;
end