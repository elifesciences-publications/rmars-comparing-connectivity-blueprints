function E = calc_entropy(A)
% E = calc_entropy(A)
%
% A is Nxn where n is histo bins
%
% S.Jbabdi 04/2018

A(isnan(A))=0;

p  = size(A,2);

% normalise 
A = A./repmat(sum(A,2),1,p); A(isnan(A))=0;

% A.*log(A+~A) ensures that 0*log(0)=0 

E = -sum(A.*log2(A+~A),2);
