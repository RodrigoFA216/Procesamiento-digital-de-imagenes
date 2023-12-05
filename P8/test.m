function Ej3 = ejer3()
im1=imread("Textil1.png");
im2=imread("Textil2.png");
[w1, w2]=size(im1);
[w3, w4]=size(im2);
SE1=strel("disk",3);
im1ap=imopen(im1,SE1);
im1cl=imclose(im1ap, SE1);
for i =1 : w1
    for j = 1 : w2
        if (im1cl(i,j)<=79)
            imo(i,j)=255;
        else
            imo(i,j)=0;
        end
    end
end
figure;
subplot(2,2,1);
imshow(im1)
title("imagen original")
subplot(2,2,2);
imshow(im1ap);
title("imagen aperturada");
subplot(2,2,3);
imshow(im1cl);
title("imagen cerrada");
subplot(2,2,4);
imshow(imo);
title("imagen umbralizada")


im2ap=imopen(im2,SE1);
im2cl=imclose(im2ap, SE1);
for i =1 : w1
    for j = 1 : w2
        if (im1cl(i,j)<=105)
            imo(i,j)=255;
        else
            imo(i,j)=0;
        end
    end
end
figure;
subplot(2,2,1);
imshow(im2)
title("imagen original")
subplot(2,2,2);
imshow(im2ap);
title("imagen aperturada");
subplot(2,2,3);
imshow(im2cl);
title("imagen cerrada");
subplot(2,2,4);
imshow(imo);
title("imagen umbralizada")

end