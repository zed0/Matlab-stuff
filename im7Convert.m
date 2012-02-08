function [ result ] = im7Convert( filename )
%IM7CONVERT Convert a file from an im7 to a sensible format
%	Pass this a .im7 file to scale it for viewing.
%	The return value can be saved as a matrix.
%	Usage:
%		 result = im7Convert('17May3CUp-TP4-0.1Dy322-3c5mus\B00004_abs(Avg V).im7');

    v = loadvec(filename);
    Scale = regexp(v.Attributes,'_SCALE_I=([\d\.]*);','tokens');
    Scale_I = str2num(char(Scale{1}));
    v.w = v.w*Scale_I;
    showf(v,'cmap','jet');
	result = v.w;
end