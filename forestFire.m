function forestFire

    %Allocate grid size
    nx = 50;
    ny = 50;

    %initialise cell
    cells = zeros(nx, ny);

    %Generate random life cells
    n = numel(cells);   %Get the number of elements present in 2d array cells
    indexArray = randsample(n, n/10);
    cells(indexArray) = 1;
    showCells(cells);
    %Rules that have to be changed by us
    %main loop that has iterations
    %{
        while(1)
        %Next generation cell locations
        newCells = findNeighbor(cells);
        cells = newCells;
        %Check out the cell map
        showCells(cells);
    end
    %}
end

function findNeighbor(c)
    % Periodic boundary condition
    cExt = zeros(size(c)+2);
    cExt(2:end-1, 2:end-1) = c;
    cExt(1, 2:end-1) = c(end, :);
    cExt(end, 2:end-1) = c(1, :);
    cExt(2:end-1, 1) = c(:, end);
    cExt(2:end-1, end) = c(:, 1);
    % Four corners
    cExt(1, 1) = c(end, end);
    cExt(1, end) = c(end, 1);
    cExt(end, 1) = c(1, end);
    cExt(end, end) = c(1, 1);
    [nx, ny] = size(c);
    
    cNew = zeros(size(c));
    %Initial loop
    idx = 0;
    %{
    for ely = 2:ny+1
        for ex = 2:nx+1
            idx = idx + 1;
            count = sum(sum(cExt(elx-1:elx+1, ely-1:ely+1))) - c(idx);
    %}
            
end

function showCells(cells)
% Visualization
imagesc(cells); caxis([0 1]);
colormap(flipud(gray)); axis off; axis equal; drawnow
end