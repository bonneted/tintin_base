function MatrixPattern = make_MatrixPattern_1px(Pattern)
MatrixPattern = squeeze(reshape(Pattern,[],1,3));
end