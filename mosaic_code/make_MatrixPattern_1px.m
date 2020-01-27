function MatrixRef = make_MatrixPattern_1px(imref)
MatrixRef = squeeze(reshape(imref,[],1,3));
end