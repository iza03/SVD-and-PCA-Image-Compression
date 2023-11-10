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

