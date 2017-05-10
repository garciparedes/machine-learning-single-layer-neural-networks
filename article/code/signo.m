function s = signo(x)
  s = zeros(size(x));
  for i = 1:size(x)
    if x(i) >= 0
      s(i) = 1;
    else
      s(i) = -1;
    end
  end
end
