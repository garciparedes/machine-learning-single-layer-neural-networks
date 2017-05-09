#
# Name: Simple Perceptron
# DataSet: simple
# Subject: Tecnicas de Aprendizaje Automatico
# Author: Calonge Cano, Teodoro
# Author: García Prado, Sergio
# Author: Fernández Angulo, Oscar

function Simple()
  dataset=csvread('./../datasets/simple.csv', 1, 0);

  bias = -3;
  w = [0.75,1]';

  x=dataset(:,1:size(dataset)(2)-1);
  y=dataset(:,size(dataset)(2));

  w = simple_perceptron_k(x, y, bias, w);

  correct = sum(signo(x*w+bias) == y);
  tasa_acierto_logistic = 100 * correct /size(y,1);
  tasa_fallo_logistic = 100 -tasa_acierto_logistic
end
