function [psi, u, v] = submit(which)

pas = [0.5, 0.001, 0.01, 0.01];

path = 'CL/';

cl = dlmread(strcat(path, num2str(which), '-cl.txt'), '\t');
dom = dlmread(strcat(path, num2str(which), '-dom.txt'), '\t');
num = dlmread(strcat(path, num2str(which), '-num.txt'), '\t');

h = pas(which);

psi = getLaplacian(cl, dom, num);
[u, v] = getSpeed(dom, psi, h);

end
