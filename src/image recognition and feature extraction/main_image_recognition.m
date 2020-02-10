function [c] = main_image_recognition(tipo,b,ruido,intensidade)
if tipo==0
    
    rmat=b(:,:,1);
    gmat=b(:,:,2);
    bmat=b(:,:,3);
    if ruido == 0
        rmat = imnoise(rmat,'salt & pepper',intensidade);
        rmat = medfilt2(rmat);
        figure,imshow(rmat);
        gmat = imnoise(gmat,'salt & pepper',intensidade);
        gmat = medfilt2(gmat);
        bmat = imnoise(bmat,'salt & pepper',intensidade);
        bmat = medfilt2(bmat);
    end
    levelr=0.65;
    levelg=0.6;
    levelb=0.4;
    i1=im2bw(rmat,levelr);
    i2=im2bw(gmat,levelg);
    i3=im2bw(bmat,levelb);
    isum=(i1&i2&i3);
    subplot(3,3,1),imshow(i1);title('red');
    subplot(3,3,2),imshow(i2);title('green');
    subplot(3,3,3),imshow(i3);title('blue');
    subplot(3,3,4),imshow(isum);title('sum');
    icomp=imcomplement(isum);
    subplot(3,3,5),imshow(icomp);title('reverse');
    ifilled=imfill(icomp,'holes');
else
        if ruido == 0
            b = imnoise(b,'salt & pepper',intensidade);
            b = medfilt2(b);
        end
        level=0.5;
        i1=im2bw(b,level);
        isum=i1;
        subplot(3,3,1),imshow(i1);title('black and white');
        ifilled=imfill(isum,'holes');
end
subplot(3,3,6),imshow(ifilled);title('filled');
se=strel('disk',5);
iopened=imopen(ifilled,se);
subplot(3,3,7),imshow(iopened);title('morfo');
iregion=regionprops(iopened,'centroid');
[label,number]=bwlabel(iopened,4);
stats=regionprops(label,'Eccentricity','Area','BoundingBox');
areas=[stats.Area];
eccentricities=[stats.Eccentricity];
index=find(eccentricities);
statsd=stats(index);
figure,imshow(b);hold on;
for idx=1:length(index)
    h=rectangle('Position',statsd(idx).BoundingBox);
    set(h,'EdgeColor',[0 0.75 0]);
    hold on;
end
if idx>10
title(['Nº objetos = ',num2str(number)]);
end
hold off;