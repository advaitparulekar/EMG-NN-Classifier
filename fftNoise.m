fid = fopen('oldEmgflexdata.txt', 'r');
data = fscanf(fid, '%f')
x = 1:351;
y = fft(data(650:1000,1));
Ymag = abs(y);
plot(x, Ymag)