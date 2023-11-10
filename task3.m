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
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06
function new_X = task3(photo, pcs)
  [m, n] = size(photo);
  
  % Convert photo to double.
  photo = double(photo);
  
  % Calculate the mean for each row of photo.
  medie = mean(photo, 2);
  
  % Subtract the mean from each row of photo.
  photo = photo - medie;
  
  % Construct the matrix Z.
  Z = photo * photo' / ( n - 1 );

  % apply eig(Z).
  [V S] = eig(Z);
  
  % Sort the result in descending order and create matrix W from the first pcs components.
  [~, idx] = sort(diag(S), 'descend');
  W = V(:, idx(1:pcs));
  
  % Calculate the matrix Y
  Y = W' * photo;
  
  % Reconstruct the original matrix X by multiplying W with Y and adding medie.
  new_X = W * Y + medie;
  
  % Convert the matrix to uint8 to obtain a valid image.
  new_X = uint8(new_X);
  
endfunction
