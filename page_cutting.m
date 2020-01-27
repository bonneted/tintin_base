function [cases,strips] = page_cutting(page_path,save_folder_path,show)

page = imread(page_path);
page_bw = rgb2gray(page);
h_page = length(page);
% threshold = max(210,mean(maxk(mean(page_bw,2),floor(h_page/15)))-25);
% disp(threshold)
threshold = 225;

[~,page_name,~] = fileparts(page_path);

strips = horyzontal_cutting(page,threshold);

cases = cell(length(strips),1);
max_strip_case = 0;

for ii=1:length(strips)
    cases{ii}=horyzontal_cutting(permute(strips{ii},[2 1 3]),threshold);
    for kk=1:length(cases{ii})
        cases{ii}{kk} = permute(cases{ii}{kk},[2 1 3]); 
        imwrite(cases{ii}{kk},fullfile(save_folder_path,strcat(page_name,'-',num2str(ii),'-',num2str(kk),'.jpg')))
        
        if max_strip_case < max(size(cases{ii}))
           max_strip_case = max(size(cases{ii}));
        end
    end
end


if show  
for ii=1:length(strips)
    for kk=1:length(cases{ii})
        subplot(length(strips),max_strip_case,(ii-1)*max_strip_case+kk)
        image(cases{ii}{kk})
        axis equal
        axis off
    end
end
end

end
    

