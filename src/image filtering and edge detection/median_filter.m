function [i_filtered] = median_filter(imagem)

a = imagem;
b = a;
[row col] = size(a);
for x = 2:1:row-1
    for y = 2:1:col-1
%% To make a 3x3 mask into a 1x9 mask
a1 = [a(x-1,y-1) a(x-1,y) a(x-1,y+1) a(x,y-1) a(x,y) a(x,y+1)...
    a(x+1,y-1) a(x+1,y) a(x+1,y+1)];
a2 = sort(a1);
med = a2(5); % the 5th value is the median 
b(x,y) = med;
    end
end
i_filtered = b;
return
end

