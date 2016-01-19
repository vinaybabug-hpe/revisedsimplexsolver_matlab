function [ z ] = doRevisedSimplexMethod( C, A, b )
%doRevisedSimplexMethod This function performs revised simplex method
%   Input: standard form Max z = Ct x, Ax <= b, xi > 0
%   C       Matrix C
%   A       Matrix A
%   b       Matrix b
%   Output:
%   z       max z after optimization.
%
%   @author: Vinay B Gavirangaswamy
%   @email:  mail2vinaybabu@gmail.com
%

disp('-----------');
disp('Given Input');
disp('-----------');
disp('Matrix C:');
disp(C);
disp('-----------');
disp('Matrix A:');
disp(A);
disp('-----------');
disp('Matrix b:');
disp(b);


z = 0;

NBV = find(C);

BV = find(~C);

Binv = A(:,BV);

X_b = Binv * b;

E= cell(1);
E{1} = Binv;
iteration = 1;

soln_found = false;

while ~soln_found
  
fprintf('\nIteration %d:',iteration);

% % % % % % % % % % % % % % 
% STEP 1: Compute pi
% % % % % % % % % % % % % % 


C_BV = C(:, BV);

pi = C_BV*Binv;



% % % % % % % % % % % % % % 
% STEP 2: Compute Reduced Costs
% % % % % % % % % % % % % % 

C_NBV = C(:, NBV);
N = A(:, NBV);

reduced_costs=pi*N - C_NBV;

[min_rc min_nbv_idx]= min(reduced_costs);

entering_bv = NBV(min_nbv_idx);
% a = a{k} in text book

a = A(:,entering_bv);
a = Binv * a;

% % % % % % % % % % % % % % % % % %
% PRINT CURRENT ITERATION TABLEAU 
% % % % % % % % % % % % % % % % % %

printTableau(pi, (C_BV * X_b),Binv, (Binv*b),min_rc, a);

% % % % % % % % % % % % % % 
% Check if we found optimized solution and if 
% so STOP.
% % % % % % % % % % % % % % 
if(isempty(find(reduced_costs < 0)))
    
fprintf('\nSolution found: ');
soln_found = true;

z = C_BV * X_b;

if(isnan(z))
    fprintf('Max Z is NaN, hance problem is infeasible...\n');
elseif(any(X_b<0))
        
    fprintf('One of the Basic Variable is <= 0, hance problem is infeasible...\n');
    
else
    print_str = sprintf(' Max z = %.5f\n', z);
    disp(print_str);
end
else


% % % % % % % % % % % % % % 
% STEP 3: Do Min Ratio Test
% % % % % % % % % % % % % % 

min_ratio_test = X_b ./ a ;
min_ratio_test(min_ratio_test<=0) = NaN;

% min_ratio_test = min_ratio_test( find(~(min_ratio_test<=0)), :);
[min_ratio min_bv_idx]= min(min_ratio_test);

leaving_bv = BV(min_bv_idx);

NBV(min_nbv_idx) = leaving_bv;
BV(min_bv_idx) = entering_bv;

% % % % % % % % % % % % % % 
% STEP 4: Compute Binv
% % % % % % %
 % % % % % % % 
E{iteration+1} = product_inv(E{1}, a, min_bv_idx);

Binv = computeBinv(E);

X_b = Binv * b;


iteration = iteration + 1;
end

end


end

