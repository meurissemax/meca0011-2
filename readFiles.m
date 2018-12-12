function [cl, dom, num, h] = readFiles(beginFiles, endFiles, pas)

if(beginFiles > endFiles)
    error('Error in input parameters');
end

nbrFiles = endFiles - beginFiles + 1;

[cl, dom, num] = deal(cell(1, nbrFiles));
h = ones(1, nbrFiles);

path = 'CL/';
k = 1;

for i = beginFiles:endFiles
    cl{k} = dlmread(strcat(path, num2str(i), '-cl.txt'), '\t');
    dom{k} = dlmread(strcat(path, num2str(i), '-dom.txt'), '\t');
    num{k} = dlmread(strcat(path, num2str(i), '-num.txt'), '\t');
    h(k) = pas(i);
    
    k = k + 1;
end

end
