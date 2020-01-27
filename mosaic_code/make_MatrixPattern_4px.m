function [MatrixPattern,settings]= make_MatrixPattern_4px(Pattern)
settings='_4px';
MatrixPattern_int = cat(3,Pattern(1:2:end-1,1:2:end-1,:),Pattern(1:2:end-1,2:2:end,:),Pattern(2:2:end,1:2:end-1,:),Pattern(2:2:end,2:2:end,:));
MatrixPattern = squeeze(reshape(MatrixPattern_int,[],1,12));
end