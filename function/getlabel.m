function [labelnow] = getlabel(label,i);
i=ceil(i/2);
if mod(i,6)==0
    labelnow=[label,5];
else
    labelnow=[label,mod(i,6)-1];
end

end