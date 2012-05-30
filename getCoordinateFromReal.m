function [result] = getCoordinateFromReal(axis, coordinate)
%GETCOORDINATEFROMREAL Returns the matrix line that most closely
%corresponds to the real coordinate (generally in mm)
%SYNTAX:
%	result = getCoordinateFromReal(v.x, 35);

	distance = abs(axis - coordinate); %the distance from the requested value
	result = find(distance == min(distance),1);

end

