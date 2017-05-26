%  Script to simulate and visualise repeated failure and attacks
%  onto a network of either randomly distributed nodes or power law
%  distributed nodes
clear all
close all
clc
a = 5
% create network
n = 10000;    % number of nodes
% random
rho = 0.1;  % link probability
% N_create = random_network(n, rho);
%N = N_create;
% scale-free
%[~,N_create] = create_pref(n);

[N, ~] = preferentialNetwork(4,n,4); 

%N = N_create;

D = zeros(10000,1);
s_max = zeros(10000,1);
s_ave = zeros(10000,1);

% % determine final fragmentation or stop criterion
%  fragmentation = (number of removed nodes)/(initial number of nodes)
%  f: initial fragmentation = 0.00
f_final = 0.5;
f = 0;   
i = 0; % counter


h = waitbar(0,'simulating...');

while f < f_final
    i = i+1;
    % create fault
%     N_new = removal(N);
    N_new = attack(N);
    [~,D(i),~,s_max(i),s_ave(i)] = properties_nw(N_new, n);
    % CAREFUL: right now using the max distance;
    % CHECK AGAINST OTHER DEFINITION (t.ex. mean distance)
    N = N_new;
    f = i/n
    
    waitbar(f/f_final);
end

close(h);
