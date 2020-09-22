function [col,glossy,reflect] = redblue(p)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
col=[max(min(p(1)/3+0.5,1),0);0;max(min(p(3)/3+0.5,1),0)];
glossy=0.8;
reflect=1;
end