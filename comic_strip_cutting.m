function comic_strip_cutting(folder_in,folder_out)
mkdir(folder_out)
allpageList = dir(folder_in);
for ii=1:length(allpageList)-2
    page = allpageList(ii+2);
    page_path = fullfile(page.folder,page.name);
    page_cutting(page_path,folder_out,0);
    disp(cat(2,'Page ',num2str(ii),' sur ',num2str(length(allpageList)-2)))
end
end