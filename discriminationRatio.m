function [ result ] = discriminationRatio(auto, cross)
%Check the discrimination ratio of a auto correlation to a cross
%correlation
%   Calculates discrimination ratio as per section 3 of A. A. S. Awwal,
%   What Can We Learn From The Shape Of A Correlation Peak For Position
%   Estimation (2009)
    result = abs(auto - cross)/auto;
end