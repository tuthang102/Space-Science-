% function 1
function p=data_filter(cond)
load('de2all')% load all de2 data
de=de2all;
a=length(de2all); % get length of matrix de 
p=zeros(a,1);
for i=1:a
    if de(i,4)<cond(1) && de(i,5)>cond(2) && de(i,8)>cond(3) && de(i,8)< cond(4) && cond(5)<de(i,9) && de(i,9)<cond(6)
        p(i,1)=i; % Give values of i as a matrix
    end
end
p=p(p>0);
end