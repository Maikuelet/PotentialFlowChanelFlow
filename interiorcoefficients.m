%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%  INTERIOR COEFFICIENT   %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [coeff] = interiorcoefficients(rho,nodeX,faceX,nodeY,faceY,rho0)
    
    sizeX = numel(nodeX);
    sizeY = numel(nodeY);
    
    coeff.ap = zeros(sizeY,sizeX);
    coeff.ae = zeros(sizeY,sizeX);
    coeff.aw = zeros(sizeY,sizeX);
    coeff.an = zeros(sizeY,sizeX);
    coeff.as = zeros(sizeY,sizeX);
    coeff.bp = zeros(sizeY,sizeX);
    
    
    % Interior nodes Filling
    for i = 2:sizeX-1       
        for j = 2:sizeY-1
            
            %[rhoh] = harmonicmean(i,j,nodeX,nodeY,faceX,faceY,rho0,rho);
            
            Dy = faceY(j)-faceY(j-1); 
            Dx = faceX(i)-faceX(i-1);
            
            dPE = nodeX(i+1)-nodeX(i);
            dPW = nodeX(i) - nodeX(i-1);
            dPN = nodeY(j+1) - nodeY(j);
            dPS = nodeY(j)  - nodeY(j-1);
            
            coeff.ae(j,i) = (rho0/rho(j,1+1)) * (Dy/dPE);
            coeff.aw(j,i) = (rho0/rho(j,i-1)) * (Dy/dPW);
            coeff.an(j,i) = (rho0/rho(j+1,i)) * (Dx/dPN);
            coeff.as(j,i) = (rho0/rho(j-1,i)) * (Dx/dPS);
            coeff.ap(j,i) = coeff.ae(j,i)+coeff.aw(j,i)+coeff.an(j,i)+coeff.as(j,i);
            coeff.bp(j,i) = 0;
            
            
            % Using HArmonic Mean
     

%             coeff.ae(j,i) = rhoh.e * (Dy/dPE);
%             coeff.aw(j,i) = rhoh.w * (Dy/dPW);
%             coeff.an(j,i) = rhoh.n * (Dx/dPN);
%             coeff.as(j,i) = rhoh.s * (Dx/dPS);
%             coeff.ap(j,i) = coeff.ae(j,i)+coeff.aw(j,i)+coeff.an(j,i)+coeff.as(j,i);
%             coeff.bp(j,i)= 0;
            
        end        
    end
    
    
end
