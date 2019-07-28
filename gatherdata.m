function gatherdata
a= arduino();
fid = fopen('NewEMGDataforearm.txt', 'a+');
fprintf('Noise. Relax');
for i=1:500
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f', val);
end
fprintf('Up');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('Down');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('Supine');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('Pronate');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 1');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 2');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 3');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 4');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('Up');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('Down');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('Supine');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('Pronate');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 1');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 2');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 3');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
fprintf('finger 4');
for i=1:300
    val = readVoltage(a, 'A0');
    fprintf(fid, '%f\n', val);
end
