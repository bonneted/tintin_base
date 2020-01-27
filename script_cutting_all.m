data_in = 'C:\Users\Utilisateur\Documents\titin_base\data\data_in_clean';
data_out = 'C:\Users\Utilisateur\Documents\titin_base\data\data_out';

tic
folder_in = fullfile(data_in,'03-Tintin_en_Amerique');
folder_out = fullfile(data_out,'03-Tintin_en_Amerique');
comic_strip_cutting(folder_in,folder_out)
toc

AlbumList = dir(data_in);

for ii=1:length(AlbumList)-2
    disp(cat(2,'Découpage de ',album.name))
    album = AlbumList(ii+2);
    album_path = fullfile(album.folder,album.name);
    folder_in = fullfile(data_in,album.name);
    folder_out = fullfile(data_out,album.name);
    comic_strip_cutting(folder_in,folder_out)
end