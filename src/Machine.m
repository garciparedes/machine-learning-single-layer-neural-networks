#
# Name: Adaline
# DataSet: machine
# Subject: Tecnicas de Aprendizaje Automatico
# Author: Calonge Cano, Teodoro
# Author: García Prado, Sergio
# Author: Fernández Angulo, Oscar


function Machine()

  [A,B,X1, X2, X3, X4, X5, X6, X7, X8] = textread('./../datasets/machine.csv', '%s%s%f%f%f%f%f%f%f%f', 'delimiter', ',', 'HeaderLines',1);
  dataset=horzcat( X1, X2, X3, X4, X5, X6, X7, X8);

%{
  Uncomment to use 'nominal attrs' as 'binary attrs'
  a = zeros(size(A,1),1);
  for i = 1:size(A,1)
    a(i) = strmatch(char(A(i,:)),unique(A), 'exact');
  end
  a_bin = a == unique(a)';

  b = zeros(size(B,1),1);
  for i = 1:size(B,1)
    b(i) = strmatch(char(B(i,:)),unique(B), 'exact');
  end
  b_bin = b == unique(b)';

  dataset=horzcat(a_bin, b_bin X1, X2, X3, X4, X5, X6, X7, X8);
%}

  # Aislar x e y

  x=dataset(:,1:size(dataset)(2)-1);

  x = x./ sqrt(sum(x.^2,1));

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

  w=regresion_lineal_K(x_train_ampliado, y_train);
  y_p=x_test_ampliado*w;
  error_relativo=abs((y_test - y_p) ./ y_test).*100;
  tasa_acierto_10=100*sum(error_relativo <= 10.0)/hold_out_test;
  tasa_fallo_10=100-tasa_acierto_10

  w=adaline_k(x_train_ampliado, y_train, 5000);
  y_p=x_test_ampliado*w;
  error_relativo=abs((y_test - y_p) ./ y_test).*100;
  tasa_acierto_10=100*sum(error_relativo <= 10.0)/hold_out_test;
  tasa_fallo_10=100-tasa_acierto_10

%{
  # Formación de ficheros de entrenamiento y test
  data_train=zeros(size(x_train)(1), size(x_train)(2)+1);
  data_train(1:size(data_train)(1), 1:(size(data_train)(2)-1))=x_train;
  data_train(1:size(data_train)(1), size(data_train)(2))=y_train;
  csvwrite('./../datasets/machine-train.csv', data_train);

  data_test=zeros(size(x_test)(1), size(x_test)(2)+1);
  data_test(1:size(data_test)(1), 1:(size(data_test)(2)-1))=x_test;
  data_test(1:size(data_test)(1), size(data_test)(2))=y_test;
  csvwrite('./../datasets/machine-test.csv', data_test);
%}
end
