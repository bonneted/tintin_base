%% Import data
AlbumFolder = 'C:\Users\Damien\Documents\quadrillage\data\data_out';
pattern_path = 'C:\Users\Damien\Documents\quadrillage\mosaic\neurchibald.jpg';

[pattern_folder,pattern_name,~] = fileparts(pattern_path);
pattern = imread(pattern_path);
[H_pattern,W_pattern,~] = size(pattern);
mosaic_path = fullfile(pattern_folder,'mosaic');

if ~exist(mosaic_path,'dir')
    mkdir(mosaic_path)
end

%% Preparing image data base...
disp('Preparing image data base...')
[Cases_MeanMatrix,Cases_Index] = make_ImageBase(AlbumFolder);

%% Preparing pattern...
disp(' Preparing pattern...')
MatrixRef = make_MatrixPattern_1px(pattern);
%% Matching image and pixels
disp('Matching image and pixels...')
[MatchIndices, settings]= match_PixIm_Random(Cases_MeanMatrix,MatrixRef,100);
  %% Making mosaic
disp('Making mosaic...')
mosaic = make_Mosaic(MatchIndices,Cases_Index,H_pattern,W_pattern);

%% Exporting image
disp('Exporting image...')
FileName = fullfile(mosaic_path,strcat(pattern_name,settings,'.jpg'));
imwrite(mosaic,FileName);
