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
	mask = zeros(size(target));
	initialX = 0;
	scaleX=0;
	scaleY=0;
	for i=1:size(foldername)
		folder = char(foldername(i));
		filename = dir([folder '/' fileRegex]);
		if(isempty(filename))
			err = MException('Im7Convert:FileNotFound', ['The folder ' folder ' does not contain the file you specified.']);
			throw(err);
		end
		filename = [folder '/' filename.name];
		v = loadvec(filename);
		
		[ scaleI offsetI ] = getScale(v.Attributes, 'I');
		[ scaleX offsetX ] = getScale(v.Attributes, 'X');
		[ scaleY offsetY ] = getScale(v.Attributes, 'Y');

		disp(strcat(char(foldername(i)),'Scale_I=',num2str(scaleI),'; Scale_X=',num2str(scaleX),'; Scale_Y=',num2str(scaleY)));

 		v.w = v.w*scaleI;

		posX = 720 - str2double(getAttribute(v.setname, 'x'));

		Distance = D*str2double(getAttribute(v.setname, 'd'));

		posX = posX - Distance;
		posX = round(posX * scaleX);
		
		posY = str2double(getAttribute(v.setname, 'y'));
		posY = -1*round(posY *2*scaleY); %For some reason there is a factor of 2 here.
% 		yPos = -1*round(yPos *scaleY);

		if(size(target)==0)
			target = v.w;
			mask = (v.w == 0) .* 0 + (v.w ~= 0) .* 1;	%0 where v.w is 0, 1 everywhere else
			initialX = posX;
			initialY = posY;
		else
 			currentMask = (v.w == 0) .* 0 + (v.w ~= 0) .* 1;	%0 where v.w is 0, 1 everywhere else
			[r2,c2] = size(v.w);
			rangeX = 1:c2;
			rangeY = 1:r2;
			[r1,c1] = size(target);
			if(posX > initialX)
				target = [target zeros(r1, (posX-initialX)-(c1-c2))];
				mask = [mask zeros(r1, (posX-initialX)-(c1-c2))];
				rangeX = 1+posX-initialX:c2+posX-initialX;
			elseif (posX < initialX)
				target = [zeros(r1, initialX-posX) target];
				mask = [zeros(r1, initialX-posX) mask];
				initialX = posX;
			end
			[r1,c1] = size(target);
			if(posY > initialY)
				target = [target;zeros((posY-initialY)-(r1-r2), c1)];
				mask = [mask;zeros((posY-initialY)-(r1-r2), c1)];
				rangeY = 1+posY-initialY:r2+posY-initialY;
			elseif (posY < initialY)
				target = [zeros(initialY-posY, c1);target];
				mask = [zeros(initialY-posY, c1);mask];
				initialY = posY;
			end
			target(rangeY, rangeX) = target(rangeY, rangeX) + v.w;
			mask(rangeY, rangeX) = mask(rangeY, rangeX) + currentMask;
		end
	end
	target = target ./ mask;
	[r1,c1] = size(target);
	imagesc([c1*scaleX 0],[r1*scaleY 0],target);
	return;
end