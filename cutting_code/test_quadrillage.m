
clear all
page_color = imread('page_test.jpg');
page = rgb2gray(page_color);
[h_page,l_page]=size(page);

nb_vert = 7;
dist_int_bande = 20;

vertical_parse=floor([1:nb_vert]*l_page/(nb_vert+1));


horyzontals = [];

for ii=1:dist_int_bande:h_page-dist_int_bande
    if 252 < sum(page(ii:ii+dist_int_bande,vertical_parse),'all')/(dist_int_bande*nb_vert)
        horyzontals = [horyzontals ii+dist_int_bande/2];
    end
end

down_list = horyzontals(horyzontals < h_page/8);
middle = horyzontals(h_page/8 <= horyzontals & horyzontals < h_page*7/8);
up_list = horyzontals(h_page*7/8 <= horyzontals);

down = max(down_list);
up = min(up_list);
duplicate = [];
for ii=1:length(middle)-1
    if middle(ii)+dist_int_bande == middle(ii+1)
        middle(ii) = middle(ii)+dist_int_bande/2;
        duplicate = [duplicate ii+1];
    end
end
middle(duplicate) = [];

y_bande = [down middle up];
image(page);hold on
plot(l_page/2*ones(length(horyzontals)),horyzontals,'b*');hold on
plot(l_page/2*ones(length(y_bande))+10,y_bande,'r*')
axis equal

nb_bande = length(y_bande)-1;

bandes = cell(1,nb_bande);
for ii=1:nb_bande
    rect = [0, y_bande(ii), l_page, y_bande(ii+1)-y_bande(ii)] ;
    bandes{ii} = imcrop(page_color,rect); 
end






