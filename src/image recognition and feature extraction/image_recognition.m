
iostr = input('Imagem a cores - 0 ou imagem em tons de cinza - 1 ? \n');
tipo = iostr ;
nome = input('Nome da imagem ?\n');
a = imread(nome);
b=a;
ruido = input('Ruido S&P Sim - 0 Não - 1 ?\n');
if ruido == 0
    intensidade = input('intensidade de ruido S&P ?\n');
    main_image_recognition(tipo,b,ruido,intensidade);
else
    ruido = 1;
    intensidade = 0;
    main_image_recognition(tipo,b,ruido,intensidade);

end

