function I = Simpson(x,y)
% Created by: Jenna Stubbers
% Created on: April 12, 2019
% Last updated: April 17, 2019
% 
% This function performs numerical integration of experimental y values 
% with respect to x. The method of integration is Simpson's 1/3 rule;
% however, if there are an odd number of intervals, the last interval is
% integrated using the Trapezoidal Rule. The two integrals are then
% compounded into one final value.
%
% Inputs:
% x = independent variable of experimental data
% y = dependent variable of experimental data; function values with respect to x
% 
% Outputs:
% I = total integral value of the function values with respect to x

%% Perform initial verifications of user inputs
if nargin ~= 2
    error('Please provide two inputs.');
end

points = length(x); %creates a variable with the total number of points
m = length(y);
if points ~= m
    error('Both input vectors must be the same length.');
end

correct_spacing = linspace(x(1),x(points),points); %makes an equally spaced vector between x(1) and x(n)
if correct_spacing ~= x %checks for equal spacing in x
    error('The x vector must have equal spacing.');
end

%% Determine if Trapezoidal Rule will need to be used
end_simpson = points;
if mod(points,2) == 0 %if this is true, then there are an even number of points, i.e. an odd number of intervals
    warning('The Trapezoidal Rule will be employed for the final interval.');
    end_simpson = points-1; %simpson's rule will end at the 2nd to last pt.
    Itrap = (x(points)-x(end_simpson)) * (y(end_simpson)+y(points)) / 2; %calculate trapezoidal rule for last interval
else
    Itrap = 0; %no trapezoidal rule will be used
end

intervals_simp = end_simpson - 1;

%% Calculate total I value
midsum1 = sum(y(2:2:end_simpson-1)); % calculate first sum of the 1/3 rule (will be multiplied by 4)
midsum2 = sum(y(3:2:end_simpson-2)); % calculate second sum of the 1/3 rule (will be multiplied by 2)

I = (x(end_simpson)-x(1)) * (y(1)+4*midsum1+2*midsum2+y(end_simpson)) / (3*(intervals_simp)); % calculate I
I = I + Itrap; %will only increase if the trap rule was used
end

