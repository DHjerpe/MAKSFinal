function [ N, attacked_node ] = attack( N )
%ATTACK: Random removal, simulation of erroneous failure
% get degrees
for i = 1:length(N(:,1))
    degrees(i) = sum(N(i,:));
end
MAX_NODE = find(degrees == max(degrees));

% select the attacked node
if numel(MAX_NODE) > 1
    r = randi([1 length(MAX_NODE)]);
    attacked_node = MAX_NODE(r);
else
    attacked_node = MAX_NODE;
end

% setting empty: removes all references and orders newly
N(attacked_node,:) = [];
N(:,attacked_node) = [];
% setting null: saves node numbering but does not work for DIAMETER
% N(random_node,:) = 0;
% N(:,random_node) = 0;

end

