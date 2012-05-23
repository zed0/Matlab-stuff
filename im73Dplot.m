function [ output_args ] = im73Dplot(foldername, fileNumber)
%	IM7 to .ppt converter.
%	Version: 0.2
%	Author: Ben Falconer
%	Synatx:
run('symphonySettings');

	if nargin < 3
		fileNumber = 4;
	end
	fileRegex = ['B' sprintf('%05d', fileNumber) '*.im7'];
	fig = figure();
	h = axes();
	set(h, 'CLim', [0 300]);
%  	set(h,'CameraUpVectorMode', 'manual');
%  	set(h,'CameraUpVector', [1 1 1]);
	grid on;
	hold all;

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

		disp(strcat(char(foldername(i)),'scaleI=',num2str(scaleI),'; scaleX=',num2str(scaleX),'; scaleY=',num2str(scaleY)));
		%use the I scaling factor if it applies to the current image:
		try
			[ scaleI ] = getScale(v.Attributes, 'I');
			v.w = v.w*scaleI;
		catch err
		end

		%Traverse baseline: 272mm
		[scaleY] = getScale(v.Attributes, 'Y');
		travY = (str2double(getAttribute(v.setname, 'y')) - travYBase)/scaleY;
		translate = [1 0 0; 0 1 0; 0 travY 1];
		transform = maketform('affine',translate);
		v.w = imtransform(v.w, transform,'XData',[1, size(v.w,2)],'YData',[1 size(v.w,1)]);
		v.w(v.w == 0) = NaN;
		plane = ones(size(v.y,2),size(v.x,2)).*str2double(getAttribute(v.setname, 'd'));
		[x,z] = meshgrid(v.x,v.y);
		surf(x,plane,z,v.w', 'EdgeColor', 'none');
		alpha(0.5)
	end
end