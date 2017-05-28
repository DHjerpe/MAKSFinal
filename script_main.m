%  Script to simulate and visualise repeated failure and attacks
%  onto a network of either randomly distributed nodes or power law
%  distributed nodes
clear all
close all
clc

% create network
n = 1000;    % number of nodes
% random
rho = 0.005;  % link probability
% N = random_network(n, rho);
[N, distr] = undirectedNetwork(n,rho);
Na=N;
Nf = N;

%N = N_create;
% scale-free
%[~,N_create] = create_pref(n);

% [N, ~] = preferentialNetwork(4,n,4); 

%N = N_create;

Da = zeros(n/2,1);
s_maxa = zeros(n/2,1);
s_avea = zeros(n/2,1);
Df = zeros(n/2,1);
s_maxf = zeros(n/2,1);
s_avef = zeros(n/2,1);
 
% % determine final fragmentation or stop criterion
%  fragmentation = (number of removed nodes)/(initial number of nodes)
%  f: initial fragmentation = 0.00
f_final = 0.5;
f = 0;   
i = 0; % counter


h = waitbar(0,'attack and failure...');

while f < f_final
    i = i+1;
    % create fault
%     N_new = removal(N);
    Na = attack(Na);
    [~,Da(i),~,s_maxa(i),s_avea(i)] = properties_nw(Na, n);
    % CAREFUL: right now using the max distance;
    % CHECK AGAINST OTHER DEFINITION (t.ex. mean distance)
    Nf = failure(Nf);
    [~,Df(i),~,s_maxf(i),s_avef(i)] = properties_nw(Nf, n);

    f = i/n
    
    waitbar(f/f_final);
end

close(h);


figure 
plot((1:500)/1000,s_maxa(1:500),'*','MarkerSize',3)
hold on
plot((1:500)/1000,s_avea(1:500),'*','MarkerSize',3)

hold on
plot((1:500)/1000,s_avef(1:500),'o','MarkerSize',3)
hold on
plot((1:500)/1000,s_maxf(1:500),'o','MarkerSize',3)
xlabel('Percentage of removed nodes');
ylabel('S and <s>');

set(gcf,'color','white')
set(gca,'FontSize',16)



legend('S attack','<s> attack','S failure','<s> failure','location','northwest')
