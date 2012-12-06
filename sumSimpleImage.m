function [ result ] = sumSimpleImage(images)
%SUMSIMPLEIMAGE Summary of this function goes here
%   Detailed explanation goes here

	maxX = -Inf;
	maxY = -Inf;
	minX = Inf;
	minY = Inf;
	maxScaleX = -Inf;
	maxScaleY = -Inf;
	
	for i=1:size(images)
		if max(images(i).x) > maxX
			maxX = max(images(i).x);
		end
		if max(images(i).y) > maxY
			maxY = max(images(i).y);
		end
		if min(images(i).x) < minX
			minX = min(images(i).x);
		end
		if min(images(i).y) < minY
			minY = min(images(i).y);
		end
		if min(images(i).y) < minY
			minY = min(images(i).y);
		end
		if abs(getScale(images(i).Attributes, 'X')) > abs(maxScale)
			maxScaleX = abs(getScale(images(i).Attributes, 'X'));
		end
		if abs(getScale(images(i).Attributes, 'Y')) > abs(maxScale);
			maxScaleY = abs(getScale(images(i).Attributes, 'Y'));
		end
	end
	
	result.x = minX:maxScaleX:maxX;
	result.y = minY:maxScaleY:maxY;
	result.w = zeros(size(result.x),size(result.y));
	
	for i=1:size(images)
			if maxScaleX ~= getScale(v.Attributes, 'X') || maxScaleY ~= getScale(v.Attributes, 'Y') 
				%If v is at a different scale we have to adjust it to the main
				%scale
				%%%%%%%%
				% TODO: nothing needs this at the moment, will throw a
				% warning if something needs to be done.
				%%%%%%%%
				throw(MException('im7Stitch:NotImplemented',...
					'The im7Stitch function does not yet support using images of differing scales'));
			else
				
			end
				
	end
end

