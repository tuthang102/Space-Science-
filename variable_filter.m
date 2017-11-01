% function #2

function defil=variable_filter(p,pos) % Enter pos as a 1xpos maxtrix
load('de2all');
de=de2all;
x=length(p);
y=length(pos);

q=zeros(x,y);
count=1;
while count<=y
      for i=1:x
        if de(p(i),pos(count)) ~= 0
            q(i,count)=p(i);
        end
     
      end
    count=count+1;
end

for i=1:x
    if q(i,:) ~= 0
        v(i,1)=q(i,1);
    else
        v(i,1)=0;
    end
end
v=v(v>0);
t=length(v);
defil=zeros(t,y);

num=1;
while num <= y
    for i=1:t
        defil(i,num)=de(v(i),pos(num));
    end
    num=num+1;
end

end
    







