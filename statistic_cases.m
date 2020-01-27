data_in = 'C:\Users\Utilisateur\Documents\titin_base\data\data_in_clean';
data_out = 'C:\Users\Utilisateur\Documents\titin_base\data\data_out';

AlbumList = dir(data_out);
Height = [];
Width = [];

for ii=1:length(AlbumList)-2
    album = AlbumList(ii+2);
    disp(cat(2,'Proccessing of ',album.name))
    CasesList = dir(fullfile(album.folder,album.name));
    
    FrontPage = CasesList(3);
    FrontPage_path = fullfile(FrontPage.folder,FrontPage.name);
    info = imfinfo(FrontPage_path);
    Height_ALbum = info.Height;
    Width_Album = info.Width;
    
    for kk=2:length(CasesList)-2
        thecase = CasesList(kk+2);
        thecase_path = fullfile(thecase.folder,thecase.name);
        info = imfinfo(thecase_path);
        Height = [Height info.Height/Height_ALbum];
        Width = [Width info.Width/Width_Album];
    end

end

figure
histogram(Height);
figure
histogram(Width)

