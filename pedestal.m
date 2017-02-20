function [ result ] = pedestal(ratio, cmap)
%Check the pedestal of a given ration for a correlation map
%   Calculates the pedestal as per section 3 of A. A. S. Awwal, What Can We
%   Learn From The Shape Of A Correlation Peak For Position Estimation
%   (2009)
    cmp = max(max(cmap)) * ratio;
    result = sum(cmap(:) > cmp);
end

