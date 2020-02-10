


%input image and grey-scale it

nome_imagem = input('Image name ? example : ''baboon.png'' \n');
imagem = imread(nome_imagem);
gray_image = rgb2gray(imagem);
noise = input('Noise type ? [''salt_pepper'' | ''gaussian'']\n');

%call main_smoothfilters(image,noise)

imagem_noised = noising(gray_image,noise);

ops = input('Type of filter ? [''spatial'' | ''frequency'']\n');

switch ops
    case 'spatial'
        filter = input('Which filter ? [''gaussian'' | ''mean'' | ''median''] \n');
        switch filter
            case 'gaussian'
                gaussiop = input('Sigma ? (integer)');
                imagem_filtered = gaussian_filter(3,gaussiop,imagem_noised);
            case 'mean'
                imagem_filtered = mean_filter(imagem_noised);
            otherwise
                imagem_filtered = median_filter(imagem_noised);
                
        end
    otherwise
        filter = input('Which filter ? [''butterworth'' | ''gaussian''] \n');
        switch filter
            case 'gaussian'
                imagem_filtered = gaussianlphp(imagem_noised);
            otherwise
        end
end

imagem_noised_name = sprintf("%s_%s.png",nome_imagem,noise);
imwrite(imagem_noised,imagem_noised_name);

imagem_filtered_name = sprintf("%s_%s_%s.png",nome_imagem,ops,filter);
imwrite(imagem_filtered,imagem_filtered_name);


