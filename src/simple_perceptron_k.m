#
# Name: Simple Perceptron
# Subject: Tecnicas de Aprendizaje Automatico
# Author: Calonge Cano, Teodoro
# Author: García Prado, Sergio
# Author: Fernández Angulo, Oscar

function w = simple_perceptron_k(x, y)
  # TODO
  # TODO
  # TODO
  # TODO
  # Change From 'Logistic Regression' Method to 'Simple Perceptron' Method


  w = zeros( size(x,2),1);
  nu = zeros(size(x,2),1);
  s = zeros(size(x,1),1);
  nu = 1 ./ (1 .+ e.^-(x * w));
  s = (nu .* (1 .- nu));
  w = inv(x' .* s' * x)*x'*(s'*x*w + y - nu);

end
