function [result sortIndex] = sortByAttribute(setList, attribute)
%SORTBYATTRIBUTE returns a version of the setlist provided sorted according
%to attribute.
%   setlist: a list of files or setnames
%	attribute: an attribute, as given in getAttribute
%		Note: This attribute should be parsable as a number, so D value and
%			traverse positions work well, setnames work less well.
%
%	result: the sorted setlist
%	sortIndex: the index to sort by if there are other lists requiring the
%		same sorting.
	%create an array for hashes
	setHashes = zeros(size(setList));
	for i=1:size(setList,1)
		%push the attribute hashes to each array position:
		setHashes(i) = str2double(getAttribute(setList{i}, attribute));
	end
	%sort the hashes:
	[~,sortIndex] = sort(setHashes);
	%use the sort values of the hashes to sort the setList:
	result = setList(sortIndex);
end

