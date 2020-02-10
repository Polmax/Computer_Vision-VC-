function [i_filtered] = gaussian_filter(n,s,imagem)

sigma = s ;
sz = n;
[x,y] =  meshgrid(-sz:sz,-sz:sz);
M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel = exp(Exp_comp)/(2*pi*sigma*sigma);
Output = zeros(size(imagem));
I = padarray(imagem,[sz,sz]);

for i=1:size(I,1)-M
    for j=1:size(I,2)-N
        Temp = double(I(i:i+M,j:j+M)).*Kernel;
        Output(i,j) = sum(Temp(:));
    end
end
Output = uint8(Output);
i_filtered=Output;
end

