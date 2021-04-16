function y = sin_scale (x,sf)
% Input: scalar or vector x, sf scale factor
% Output: scalar or vector containing corresponding sine values.
% y = sin(x); ML intrinsic sine function

y = sin(x./sf);

% The ‘.’ before an operator implies a vector/array operation
end
