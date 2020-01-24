data_in = 'C:\Users\Damien\Documents\quadrillage\data\data_in';
data_out = 'C:\Users\Damien\Documents\quadrillage\data\data_out';

AlbumList = dir(data_in);

folder_in = fullfile(data_in,'05-Le-Lotus-Bleu');
folder_out = fullfile(data_out,'05-Le-Lotus-Bleu');
comic_strip_cutting(folder_in,folder_out)

for ii=1:length(AlbumList)-2
    album = AlbumList(ii+2);
    album_path = fullfile(album.folder,album.name);
    folder_in = fullfile(data_in,album.name);
    folder_out = fullfile(data_out,album.name);
    comic_strip_cutting(folder_in,folder_out)
end