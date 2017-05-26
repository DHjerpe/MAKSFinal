function [ N, DIAMETER,DIST_AVE, S_MAX, S_AVE ] = properties_nw( N, n )
%PROPERTIES: puts out the properties of a network
%   --- Inputs ---
%   N: node matrix (adjacency matrix)

% convert matrix to graph
G = graph(N);

% calculate link density
MAX_EDGES = (numel(N)-numel(diag(N)))/2; 
EDGES = nnz(N)/2;
DENSITY = EDGES/MAX_EDGES;

% calculate diameter
DIST = distances(G);
DIST(DIST == Inf) = 0;  %set distances that are inf to 0 since isolated
DIAMETER = max(max(DIST));

% calculate average distance
DIST = DIST(DIST~=0);
DIST_AVE = mean(triu(DIST));


% get the number of isolated clusters
BINS = conncomp(G); 
nums = zeros(1,max(BINS));
% get biggest cluster
% CHECK AGAIN FOR DEFINITION, THERE MIGHT BE SOMETHING I OVERREAD
parfor i = 1:max(BINS)
    nums(i) = numel(find(BINS == i));
end
S_MAX = max(nums)/n;

% get average cluster size
%
nums = nums(nums~=max(nums));
S_AVE = sum(nums)/length(nums);
if isnan(S_AVE)
    S_AVE = 1;
end

end

