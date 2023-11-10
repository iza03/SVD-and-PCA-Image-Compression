## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} task1 (@var{photo}, @var{k})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-14

function new_X = task1(photo, k)
  [m, n] = size(photo);
  
  % Initialize the final matrix.
  new_X = zeros(m, n);
  
  % Convert photo to double (if necessary).
  photo = double(photo);
  
  % Apply the SVD algorithm to photo.
  [U, S, V] = svd(photo);
  
  % Compute the reduced matrices U, S, and V.
  U_red = U(:, 1:k);
  S_red = S(1:k, 1:k);
  V_red = V(:, 1:k);
  
  % Calculate the new_X, which is the approximation of the original photo matrix,
  % using the calculated matrices.
  new_X = U_red * S_red * V_red';
  
  % Convert the matrix to uint8 to obtain a valid image.
  new_X = uint8(new_X);
endfunction
