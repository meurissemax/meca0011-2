%% Main script that calls all functions.

%% Variable declaration
beginFiles = 1;
endFiles = 4;

nbrFiles = endFiles - beginFiles + 1;

pas = [0.5, 0.001, 0.01, 0.01];

[laplacian, speedU, speedV, pressure] = deal(cell(1, nbrFiles));
nodes = cell(1, 2);

%% Calling functions
% Reading files
[cl, dom, num, h] = readFiles(beginFiles, endFiles, pas);

% Calculation of laplacian and velocitiy
for i = 1:nbrFiles
    laplacian{i} = getLaplacian(cl{i}, dom{i}, num{i});
    [speedU{i}, speedV{i}] = getSpeed(dom{i}, laplacian{i}, h(i));
    pressure{i} = getPressure(speedU{i}, speedV{i});
end

%% Calculation of circulation and forces for the situation 3 (or 4)
situation = 4;

nodes{1} = [91, 16];
nodes{2} = [113, 38];

x = [nodes{1}(1)*ones(1, nodes{2}(2)-nodes{1}(2)), nodes{1}(1):nodes{2}(1), nodes{2}(1)*ones(1, nodes{2}(2)-nodes{1}(2)), nodes{2}(1)-1:-1:nodes{1}(1)];
y = [nodes{1}(2):nodes{2}(2), nodes{2}(2)*ones(1, nodes{2}(1)-nodes{1}(1)-1), nodes{2}(2):-1:nodes{1}(2), nodes{1}(2)*ones(1, nodes{2}(1)-nodes{1}(1))];

[u, v, p] = deal(zeros(1, length(x)));

for i = 1:length(x)
    u(i) = speedU{situation}(x(i), y(i));
    v(i) = speedV{situation}(x(i), y(i));
    p(i) = pressure{situation}(x(i), y(i));
end

x = pas(situation)*x;
y = pas(situation)*y;

circulation = circu(u, v, x, y);
[fx, fy] = force(p, x, y);

%% Calculation of the isopsi for the situation 2
column = speedU{2}(:, 2);
[min, pos] = min(abs(column(2:end-1) - 0));
value = laplacian{2}(pos + 1, 2);

isopsi = laplacian{2};
isopsi(isopsi <= value) = NaN;

%% Cleaning of the pressure matrix for the situation 2
cleanPressure = pressure{2};

for i = 1:size(isopsi, 1)
    for j = 1:size(isopsi, 2)
        if isnan(isopsi(i,j))
            cleanPressure(i,j) = NaN;
        end
    end
end

%% Showing results
showMultipleResults(laplacian, 1, nbrFiles, h);

%showSingleResult(isopsi, pas(2), '\Psi (x,y)', 1);
%showSingleResult(cleanPressure, pas(2), 'p(x,y)', 2);

%% Deleting unnecessary variables
clearvars -except circulation cl cleanPressure dom fx fy isopsi laplacian num pressure speedU speedV value
