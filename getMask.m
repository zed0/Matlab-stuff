function [result] = getMask(image)
	result = image;
	result(result~=0)=1;
end