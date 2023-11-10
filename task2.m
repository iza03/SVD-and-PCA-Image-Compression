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
