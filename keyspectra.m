function [S,t] = keyspectra(X)

  [m, n] = size(X);
  points = ceil(m/2);

  S = [];
  t = [];
  det_i = [];         
  all_det_i = [];     

  init_spectrum = mean(X);
  for j = 1:points
    for i = 1:m
      Y = [init_spectrum; X(i,:)];
      Z = Y*Y';
      det_i = [det_i; det(Z)];
    end
    [maxdetval,maxdetlocat] = max(det_i);           
    all_det_i = [all_det_i det_i/norm(det_i)];
    S = [S; X(maxdetlocat,:)];
    init_spectrum = S;
    det_i = [];
  end

  coef = [];
  for i = 1:points-1
    coef = [coef; all_det_i(:,i)' * all_det_i(:,i+1)];
  end
  difcoef = [];
  for i = 1:points-2
    difcoef = [difcoef (coef(i+1) - coef(i))];
  end
  [maxdifcoef,num] = max(difcoef);
  S = S(1:num,:);
  C = X * pinv(S);
  [maxc, t] = max(C);
  [t, maxt] = sort(t);

  for i = 1:length(t)
    S(i,:) = X(t(i),:) / norm(X(t(i),:));
  end
  S = S';

end

%!demo
%! load ./Data/masartdata.mat
%! [S,t] = keyspectra(X);

