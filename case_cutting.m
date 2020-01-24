clear all
page_color = imread('C:\Users\Utilisateur\Documents\tintin database\05-Le-Lotus-Bleu\05-Le-Lotus-Bleu-05.jpg');

strips = horyzontal_cutting(page_color,5,20,254);

cases = cell(length(strips),1);
for i=1:length(strips)
    cases{i}=horyzontal_cutting(permute(strips{i},[2 1 3]),1,20,252);
end