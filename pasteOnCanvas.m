function [result] = pasteOnCanvas(v, canvasX, canvasY)
%PASTEONCANVAS Paste v onto a canvas of range xRange by yRange
	canvas = zeros(size(canvasX,2),size(canvasY,2));
	offsetX = getCoordinateFromReal(canvasX, min(v.x(1),v.x(end)));
	offsetY = getCoordinateFromReal(canvasY, min(v.y(1),v.y(end)));
	rangeX = offsetX:offsetX+size(v.x,2)-1;
	rangeY = offsetY:offsetY+size(v.y,2)-1;

	rangeXtarget = 1:size(v.x,2);
	if(v.x(1)>v.x(end))
		rangeXtarget = fliplr(rangeXtarget);
	end
	rangeYtarget = 1:size(v.y,2);
	if(v.y(1)>v.y(end))
		rangeYtarget = fliplr(rangeYtarget);
	end
	canvas(rangeX,rangeY) = v.w(rangeXtarget, rangeYtarget);
	result = v;
	result.w = canvas;
	result.x = canvasX;
	result.y = canvasY;
end

