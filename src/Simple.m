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


w = simple_perceptron_k(x_ampliado, y)
