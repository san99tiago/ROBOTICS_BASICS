% DENAVIT-HARTENBERG APPROACH PARAMETERS
% SANTIAGO GARCIA ARANGO
% Find general Transformation Matrix from a series of parametes
% warning: if symbolic variables, make sure to use "assume(variable,"real")
% dh_matrix = parameters matrix for Denavit Hartenberg approach. (N x 4)

function [TM, cell_of_TM] = denavit_hartenberg(dh_matrix)
%DENAVIT_HARTENBERG: return general  TM from dh parameters
%Santiago Garcia Arango
if nargin == 0
    fprintf("\n\n *****NOT ARGUMENTS ENTERED **** \n\n")
    return
end

% Obtain each transformation matrix from the D-H table input
for i=1:size(dh_matrix,1)
    cell_of_TM(i,1) = {transformation([1, 0, 0], [0, 0, 0], dh_matrix(i,1), 1)};
    cell_of_TM(i,2) = {transformation([0, 0, 0], [dh_matrix(i,2), 0, 0], 0, 1)};
    cell_of_TM(i,3) = {transformation([0, 0, 0], [0, 0, dh_matrix(i,3)], 0, 1)};
    cell_of_TM(i,4) = {transformation([0, 0, 1], [0, 0, 0], dh_matrix(i,4), 1)};
end


% Convert cell to matrix (to iterate over it easier)
matrix_of_TM = zeros(4*size(dh_matrix,1), 16);  % Initialize matrix

% Obtain matrix of size (4*DH-vertical x 16)...
% equivalent of each [4 x 4] TM of each DH table position
for i=1:size(dh_matrix,1)
    if i==1
        matrix_of_TM = [cell_of_TM{1,:}];
    else
        matrix_of_TM = [ matrix_of_TM(:,:) ; [cell_of_TM{i,:}] ];
    end
end


% Find transformation matrix result(TM11*TM12*TM13*TM14*TM21*...TMN4)
TM = eye(4,4);
i = 1;
row = 1;
while i < size(dh_matrix,1)*4
    fprintf("\n\n\t\t\t*************** ROW %i ******************\n", row);
    
    % Access main matrix and get specific TMs for each DH parameter
    TMi_1 = matrix_of_TM(i:i+3,1:4);
    TMi_2 = matrix_of_TM(i:i+3,5:8);
    TMi_3 = matrix_of_TM(i:i+3,9:12);
    TMi_4 = matrix_of_TM(i:i+3,13:16);
    
    % Show entire row of Matrix Transformations
    disp([TMi_1, TMi_2, TMi_3, TMi_4])
    
    % Get the general Transformation Matrix (from each row of DH table)
    fprintf("TM_%i_%i", (i-1)/4, (i-1)/4+1);
    TM_current = TMi_1 * TMi_2 * TMi_3 * TMi_4
    TM = TM * TM_current;
    
    row = row + 1;
    i = i + 4;
end
fprintf("\n");

end

