## Copyright (C) 2023 Andrei
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
## @deftypefn {} {@var{retval} =} task2 (@var{photo}, @var{pcs})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2023-02-28

function new_X = task2(photo, pcs)
  [m, n] = size(photo);

  % Cast photo to double
  photo=double(photo);

  % Calculate the mean for each row of photo.
  medie = mean(photo, 2);
  
  % Subtract the mean from each row of photo.
  photo = photo - medie;
  
  % Construct the matrix Z by transposing photo.
  Z = photo'/sqrt(n-1);
  
  % Perform the SVD on matrix Z.
  [U, S, V] = svd(Z);
  
  % Select the first pcs columns of V as the principal components.
  W = V(:, 1:pcs);
  
  % Calculate the matrix Y by projecting Z onto W.
  Y = W' * photo;
  
  % Reconstruct the original matrix X by multiplying W with Y and adding medie.
  new_X = W * Y + medie;
  
  % Convert the matrix to uint8 to obtain a valid image.
  new_X = uint8(new_X);
endfunction

