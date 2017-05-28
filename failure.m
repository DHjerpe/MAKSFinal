function [ N, attacked_node ] = failure( N )
%ATTACK: Random removal, simulation of erroneous failure
% get degrees
failed_node = randi(length(N));

% setting empty: removes all references and orders newly
N(failed_node,:) = [];
N(:,failed_node) = [];
% setting null: saves node numbering but does not work for DIAMETER
% N(random_node,:) = 0;
% N(:,random_node) = 0;

end

