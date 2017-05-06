#
# Name: Simple Perceptron
# DataSet: simple
# Subject: Tecnicas de Aprendizaje Automatico
# Author: Calonge Cano, Teodoro
# Author: García Prado, Sergio
# Author: Fernández Angulo, Oscar

dataset=csvread('./../datasets/machine.csv', 1, 2);
# TODO nominalToNumeric discrete attrs?

# Aislar x e y

x=dataset(:,1:size(dataset)(2)-1);

x = x./ sqrt(sum(x.^2,1))

x_ampliado = ones(size(x)(1), size(x)(2)+1);
x_ampliado(:, 1)=ones(size(x_ampliado)(1), 1);
x_ampliado(:, 2:size(x)(2)+1) = x;

y=dataset(:,size(dataset)(2));

# Construir los conjuntos de entrenamiento

aleatorio=rand(size(dataset)(1),1);
hold_out_train=round(size(dataset)(1)*2/3);
hold_out_test=round(size(dataset)(1)/3);

x_index=resize(x, size(x)(1), size(x)(2)+1);
x_index(:,size(dataset)(2))=aleatorio;

x_sort=sortrows(x_index, size(dataset)(2));

x_train=x_sort(1:hold_out_train, 1:size(x)(2));

x_train_ampliado = ones(size(x_train)(1), size(x_train)(2)+1);
x_train_ampliado(:, 1)=ones(size(x_train)(1), 1);
x_train_ampliado(:, 2:size(x_train)(2)+1) = x_train;


y_index=resize(y, size(y)(1), size(y)(2)+1);
y_index(:,2)=aleatorio;

y_sort=sortrows(y_index, 2);

y_train=y_sort(1:hold_out_train, 1:size(y)(2));

# Construir los conjuntos de test

x_test=x_sort((hold_out_train+1):size(x)(1), 1:size(x)(2));


x_test_ampliado = ones(size(x_test)(1), size(x_test)(2)+1);
x_test_ampliado(:, 1)=ones(size(x_test)(1), 1);
x_test_ampliado(:, 2:size(x_test)(2)+1) = x_test;


y_test=y_sort((hold_out_train+1):size(y)(1), 1:size(y)(2));


w=adaline_k(x_train_ampliado, y_train);


# Salida REAL Test

y_p=x_test_ampliado*w;

#Error
error_relativo=abs((y_test - y_p) ./ y_test).*100;

# Tasa de Aciertos
tasa_acierto_10=100*sum(error_relativo <= 10.0)/hold_out_test;

# Tasa de Error
tasa_fallo_10=100-tasa_acierto_10

%{

# Formación de ficheros de entrenamiento y test
data_train=zeros(size(x_train)(1), size(x_train)(2)+1);
data_train(1:size(data_train)(1), 1:(size(data_train)(2)-1))=x_train;
data_train(1:size(data_train)(1), size(data_train)(2))=y_train;
csvwrite('data_wine_train_octave.csv', data_train);

data_test=zeros(size(x_test)(1), size(x_test)(2)+1);
data_test(1:size(data_test)(1), 1:(size(data_test)(2)-1))=x_test;
data_test(1:size(data_test)(1), size(data_test)(2))=y_test;
csvwrite('data_wine_test_octave.csv', data_test);

%}
