#
# Name: ADALINE
# Subject: Tecnicas de Aprendizaje Automatico
# Author: Calonge Cano, Teodoro
# Author: García Prado, Sergio
# Author: Fernández Angulo, Oscar

function w = adaline_k(x, y, seasons=5000, alpha = 0.3)
  # TODO
  # TODO
  # TODO
  # TODO
  # Change From 'Minimum Least Squares' Method to 'Delta Rule' Method
  
  w = zeros(size(x)(2), 1);
  for t = 1:seasons
    for i=1:size(x,1)
      p = (x(i,:) * w);
      w = w + alpha * (y(i)-p) * x(i,:)';
    end
    t
    w
  end
end
