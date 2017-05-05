#
# Name: Simple Perceptron
# DataSet: simple
# Subject: Tecnicas de Aprendizaje Automatico
# Author: Calonge Cano, Teodoro
# Author: García Prado, Sergio
# Author: Fernández Angulo, Oscar


dataset=csvread('./../datasets/simple.csv', 1, 0);

# Aislar x e y

x=dataset(:,1:size(dataset)(2)-1);

x_ampliado = ones(size(x)(1), size(x)(2)+1);
x_ampliado(:, 1)=ones(size(x_ampliado)(1), 1);
x_ampliado(:, 2:size(x)(2)+1) = x;

y=dataset(:,size(dataset)(2));


y_m = y != unique(y)';
w_m = zeros(size(x_ampliado,2), size(y_m,2));
for i = 1:size(w_m,2)
  w_m(:,i) = simple_perceptron_k(x_ampliado, y_m(:,i));
endfor

correct = 0;
for i = 1:size(y)
  [M,I] = max(1 ./ (1 + e.^(x_ampliado(i,:) * w_m)));
  correct += unique(y)(I) == y(i);
endfor
tasa_acierto_logistic = 100 * correct /size(y,1);
tasa_fallo_logistic = 100 -tasa_acierto_logistic
