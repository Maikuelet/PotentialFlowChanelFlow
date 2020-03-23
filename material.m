%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%     BLOCK IN - OFF       %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function has to place a cilinder in the midddle of the domain of
% study, it works using the circunference equation as a constrain. 
%
%


function [mat] = material(nodeX,nodeY,r)

sizeX = numel(nodeX);
sizeY = numel(nodeY);

mat = zeros(sizeY,sizeX);

N = sizeX - 2;
M = sizeY - 2;

a = nodeX(floor(sizeX/2) + 1);
b = nodeY(floor(sizeY/2) + 1);


for i = 2:N+1
   for j = 2:M+1
       
       % Incircle Condition
       
       if (nodeY(j) - b)^2 + (nodeX(i) - a)^2 <= r^2   
           mat(j,i) = 1;
       end
             
       
   end
end

heatmap(mat)

end

