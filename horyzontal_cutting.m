function subimages = horyzontal_cutting(image,dist_int_bande,nb_vertical,threshold)

case_width = 100;
image_bw = rgb2gray(image);
[h_image,l_image]=size(image_bw);

vertical_parse=floor([1:nb_vertical]*l_image/(nb_vertical+1));

horyzontals = [1 h_image];

for ii=1:dist_int_bande:h_image-dist_int_bande
    if threshold < sum(image_bw(ii:ii+dist_int_bande,vertical_parse),'all')/((dist_int_bande+1)*nb_vertical)
        horyzontals = [horyzontals ii];
    end
end

down_list = horyzontals(horyzontals < h_image/8);
middle = horyzontals(h_image/8 <= horyzontals & horyzontals < h_image*7/8);
up_list = horyzontals(h_image*7/8 <= horyzontals);

down = max(down_list);
up = min(up_list);

if isempty(middle)
    middle_filt = middle;
else
    middle_filt = [middle(1)];
    for ii=1:length(middle)-1
        if middle(ii+1) - middle(ii) > case_width
            middle_filt = [middle_filt middle(ii+1)];
        end
    end
end

y_subimg = [down middle_filt up];

nb_subimg = length(y_subimg)-1;
subimages = cell(1,nb_subimg);

%display debug
% figure
% image(image);hold on
% plot(l_page/2*ones(length(y_subimg)),y_subimg,'b*');hold on
% plot(l_page/2*ones(length(y_bande))+10,y_bande,'r*')
% axis equal

white_index = [];

for ii=1:nb_subimg
    subimages{ii} = image(y_subimg(ii):y_subimg(ii+1),1:l_image,:); 
    subimage_bw = rgb2gray(subimages{ii});
 
    if 250 < sum(subimage_bw,'all')/(size(subimage_bw,1)*size(subimage_bw,2)) %check for white case removal
        white_index = [white_index ii];
    end
end
subimages(white_index)=[];

end