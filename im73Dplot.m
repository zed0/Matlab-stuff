function [ output_args ] = im73Dplot(foldername, fileNumber)
	run('symphonySettings');

	if nargin < 2
		fileNumber = 4;
	end
	fileRegex = ['B' sprintf('%05d', fileNumber) '*.im7'];
	h = axes();
	set(h, 'CLim', colorLimits(fileNumber,:));
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
		v = im7Load(filename);

		plane = ones(size(v.y,2),size(v.x,2)).*(str2double(getAttribute(v.setname, 'd'))*D);
		[x,z] = meshgrid(v.x,v.y);
		surf(plane,x,z,v.w', 'EdgeColor', 'none');
		alpha(0.8)
	end
end