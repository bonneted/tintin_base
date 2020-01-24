
function [cases,strips] = page_cutting(page_path,save_folder_path,show)

page = imread(page_path);
[~,page_name,~] = fileparts(page_path);

strips = horyzontal_cutting(page,5,30,254);

cases = cell(length(strips),1);
max_strip_case = 0;

for ii=1:length(strips)
    cases{ii}=horyzontal_cutting(permute(strips{ii},[2 1 3]),1,50,252);
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
    

