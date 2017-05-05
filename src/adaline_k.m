#
# Name: ADALINE
# Subject: Tecnicas de Aprendizaje Automatico
# Author: Calonge Cano, Teodoro
# Author: García Prado, Sergio
# Author: Fernández Angulo, Oscar

function w = adaline_k(x, y)
  # TODO
  # TODO
  # TODO
  # TODO
# Change From 'Minimum Least Squares' Method to 'Delta Rule' Method


  A = zeros(size(x)(2), size(x)(2));
  B = zeros(size(x)(2), 1);
  for i=1:size(x)(2)
    for j=1:size(x)(2)
      A(i,j)=sum(x(:,i).*x(:,j));
    end
    B(i,1)=sum(y.*x(:,i));
  end
  w=inv(A)*B;

end
