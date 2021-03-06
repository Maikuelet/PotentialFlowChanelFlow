%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%  INPUT DATA   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Domain
% Domain Length
domainP=[0  1; 0 1];        %First  row for X dim
                            %Second row for Y dim  
L   = domainP(1,2)-domainP(1,1);
H   = domainP(2,2)-domainP(2,1);


%% Mesh Size
% N  = Nodes X
% M  = Npdes Y 
% H  = Domain Heigth - Y
% L  = Domain Length - X
% Mesh adds 2 extra nodes in each direcction
% for computing the boundaries

N  =  50;
M  =  50;
meshSizes=[N M];


%% Iterative solver parameters
% maxIter   =   Maximum number of iterations
% sigma     =   Error Parameter

maxIter=1e4;
sigma=1e-5;

istream = 3;


%% Phisical Constants
%  Fluid -> Air at 300K
% R     =   Gas Constant [J/kgK]

fluidC.R   = 287;
% Suposing ideal diatomic gas
fluidC.cp   = (5/2)*fluidC.R;
fluidC.gam = 1.394;

%% Reference Values %%
% rho   =   Density [kg/m^3]
% p     =   Pressure [Pa]
% T     =   Temperature [K]
% v     =   Velocity [m/s]
% R     =   GasConstant [kJ/kmolK]
% cp    =   Coefficent of pressure [Ws/kg K]   
% Index 0 accounts for initial conditions ref vals.


p0   = 100000;
T0   = 273+27;
v0   = 4;
rho0 = p0/(fluidC.R*T0);



