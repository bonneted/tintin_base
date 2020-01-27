%% Import data
AlbumFolder = 'C:\Users\Utilisateur\Documents\titin_base\data\data_out';
pattern_path = 'C:\Users\Utilisateur\Documents\meme\tintin mosaic\tintin_nature.jpg';

[pattern_folder,pattern_name,~] = fileparts(pattern_path);
pattern = imread(pattern_path);
[H_pattern,W_pattern,~] = size(pattern);
mosaic_path = fullfile(pattern_folder,'mosaic');

if ~exist(mosaic_path,'dir')
    mkdir(mosaic_path)
end
    

%% Preparing data
disp('Preparing data...')
MatrixRef = make_MatrixRef(pattern);
[Cases_MeanMatrix,Cases_Index] = make_ImageBase(AlbumFolder);

%% Matching image and pixels
disp('Matching image and pixels...')
[MatchIndices, settings] = match_PixIm_Remote(Cases_MeanMatrix,MatrixRef,25,H_pattern);
  %% Making mosaic
disp('Making mosaic...')
mosaic = make_Mosaic(MatchIndices,Cases_Index,H_pattern,W_pattern);

%% Exporting image
disp('Exporting image...')
FileName = fullfile(mosaic_path,strcat(pattern_name,settings,'.jpg'));
imwrite(mosaic,FileName);
