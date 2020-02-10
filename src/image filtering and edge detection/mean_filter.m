function [i_filtered] = mean_filter(imagem)
[m,n] = size(imagem);
output = zeros(m,n);
for i=1:m
    for j=1:n
        rmin = max(1,i-1);
        rmax = min(m,i+1);
        cmin = max(1,j-1);
        cmax = min(n,j+1);
        
        temp = imagem(rmin:rmax,cmin:cmax);
        output(i,j) = mean(temp(:));
    end
end
output = uint8(output);
i_filtered = output;
return
end

