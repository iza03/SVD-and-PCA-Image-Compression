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
