function drawRect(x, y, width, height, varargin)
%DRAWRECT Summary of this function goes here
%   Detailed explanation goes here    
    if width < 0
        x = x + width;
        width = -width;
    end
    if height < 0
        y = y + height;
        height = -height;
    end
    rectangle('Position', [x, y, width, height], varargin{:});
end