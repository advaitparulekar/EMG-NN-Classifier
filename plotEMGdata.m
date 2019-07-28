fid = fopen('EMGflexData.txt');
a = fscanf(fid, '%f');
b = linspace(0,length(a), length(a));
length(a)
plot(b, a);