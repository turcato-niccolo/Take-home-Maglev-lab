function [dx] = maglevSystemDynamics_contrained_horizontal(x,u,paramsFast,modelName)
% maglev platform with simulated constraint that makes the magnet only move
% up and down
dx = maglevSystemDynamics(x,u,paramsFast,modelName);
dx(1) = 0.0;
dx(2) = 0.0;


end