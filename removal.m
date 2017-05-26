function [ N, random_node ] = removal( N )
%REMOVAL: Random removal, simulation of erroneous failure

random_node = randi([1, length(N(1,:))]);
% setting empty: removes all references and orders newly
N(random_node,:) = [];
N(:,random_node) = [];
% setting null: saves node numbering but does not work for DIAMETER
% N(random_node,:) = 0;
% N(:,random_node) = 0;

end

