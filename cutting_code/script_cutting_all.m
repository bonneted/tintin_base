data_in = 'C:\Users\Damien\Documents\quadrillage\data\data_in';
data_out = 'C:\Users\Damien\Documents\quadrillage\data\data_out';

% tic
% folder_in = fullfile(data_in,'03-Tintin_en_Amerique');
% folder_out = fullfile(data_out,'03-Tintin_en_Amerique');
% comic_strip_cutting(folder_in,folder_out)
% toc

AlbumList = dir(data_in);

for ii=1:length(AlbumList)-2
    
    album = AlbumList(ii+2);
    disp(cat(2,'Proccesing of ',album.name))
    album_path = fullfile(album.folder,album.name);
    folder_in = fullfile(data_in,album.name);
    folder_out = fullfile(data_out,album.name);
    comic_strip_cutting(folder_in,folder_out)
    
end
