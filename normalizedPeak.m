function [ result ] = normalizedPeak(cmap)
%Check the normalized peak of a correlation map
%   Calculates the normalized peak as per section 3 of A. A. S. Awwal, What
%   Can We Learn From The Shape Of A Correlation Peak For Position
%   Estimation (2009)
    result = max(max(cmap)) / sum(sum(cmap));
end