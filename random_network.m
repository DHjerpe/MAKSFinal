function [ N ] = random_network( n, rho )
%RANDOM NETWORK: 
% create a Poisson-Network

N = zeros(n);

for i = 1:n
    for j = (i+1):n
        % make diagonal zero in any case
        if i == j
            N(i,j) = 0;
        end
        % generate random number
        rnd = rand();
        if rnd <= rho
            N(i,j) = 1; 
            N(j,i) = 1; % to keep it symmetrical
        end
        
        
    end
end


end

