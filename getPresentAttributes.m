function [attributeList] = getPresentAttributes(setList, attribute)
%GETPRESENTATTRIBUTES returns a list of the values for an attribute present
%in the input list

	%create a blank cell array to store the attributes:
	attributeList = cell(size(setList,2),1);
	
	%copy every attribute:
	for i=1:size(setList,2)
		attributeList{i} = getAttribute(setList{i}, attribute);
	end
	
	%remove the non-unique attributes:
	attributeList = unique(attributeList);

end

