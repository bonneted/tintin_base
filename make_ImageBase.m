function [Cases_MeanMatrix,Cases_Index] = make_ImageBase(AlbumFolder)
%relative Height and Width case average value
Height_ref = 0.24;
Height_delta = 0.02;
Width_ref = 0.28;
Width_delta = 0.12;


AlbumList = dir(AlbumFolder);
Cases_MeanMatrix  = [];
Cases_Index = {};

for ii=1:length(AlbumList)-2
    album = AlbumList(ii+2);
    disp(cat(2,'Proccessing of ',album.name))
    CasesList = dir(fullfile(album.folder,album.name));
    
    FrontPage = CasesList(3);
    FrontPage_path = fullfile(FrontPage.folder,FrontPage.name);
    info = imfinfo(FrontPage_path);
    Height_ALbum = info.Height;
    Width_Album = info.Width;
    
    for kk=1:length(CasesList)-2
        
        thecase_file = CasesList(kk+2);
        thecase_path = fullfile(thecase_file.folder,thecase_file.name);
        info = imfinfo(thecase_path);
        Height =  info.Height/Height_ALbum;
        Width = info.Width/Width_Album;
        
        if abs(Height-Height_ref) < Height_delta && abs(Width-Width_ref) < Width_delta
            thecase = imread(thecase_path);
            Cases_Index{end+1} = imresize(thecase,[200 200]);
            Cases_MeanMatrix = [Cases_MeanMatrix ; squeeze(mean(thecase,[1 2]))'];
        end
    end

end


end