function [ G, N ] = create_pref(n)
%CREATE SCALE-FREE NETWORK
% TODO: make more efficient! takes just too long right now
% (IF POSSIBLE)
% Output: 
% G is a graph-type
% N is a matrix
A = [0 1 0 0; 1 0 0 0; 0 0 0 1; 0 0 1 0];
%G = graph(A);

for j = 5:n
    A(j, :) = zeros(1, j-1);
    A(:, j) = zeros(j, 1);
    G = graph(A);  % update after adding new col and row
    
    for k = 1:4
        G = graph(A);   % update after adding new neighbours

        D = sum(A);     
        d = sum(D);
        P = cumsum(D ./ d);

        while(1)
            r = rand();
            i = find([-1 P]<r, 1, 'last');
            NB = [neighbors(G,j)' j] ;
            if isempty(intersect(i, NB)) == true
                A(i,j) = 1;
                A(j,i) = 1;
                break;
            end
        end
    end
    

end

K = zeros(n,1);
for i = 1:n
    K(i,1) = sum(A(i,:));
end
max(K)

% figure(3)
% histogram(K)
% title('Histogram of network')
% xlabel('Connections')
% ylabel('# of individuals')
% xlim([0,max(K)+1])
% 
% figure(4)
% histogram(K)
% ax=gca
% ax.YScale='log'
% ax.XScale='log'
% title(['Histogram of ', num2str(n), ' individuals, pref. attachment'])
% xlabel('degree k')
% ylabel('nodes of size k')

average_deg = mean(K);
N = A;