function [ profile ] = getProfileAtCoord(v, coord)
%GETPROFILEATCOORD Get the profile across a field at a certain depth
%	Defaults to a horizontal profile.

	depth = getCoordinateFromReal(v.y, coord);
	profile = v.w(:,depth);
end

