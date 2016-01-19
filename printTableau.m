function [ output_args ] = printTableau( pi, z, Binv, Binv_b, RCs,Binv_As  )
%printTableau2 This function prints current iteration tableau 
%   
%
%   @author: Vinay B Gavirangaswamy
%   @email:  mail2vinaybabu@gmail.com
%

fprintf('\n');


[pi_m pi_n] = size(pi);

for i=1:pi_n+2    
    fprintf('--------');
end
fprintf('\t\t\t');
fprintf('-------------');
fprintf('\n');

row_mat = horzcat(pi, z, RCs);
fprintf('|\t');
fprintf([repmat('%2.2f\t', 1, size(row_mat(1:pi_n), 2)) '|\t'], row_mat(1:pi_n)');
fprintf([repmat('%2.2f\t', 1, size(row_mat(pi_n+1), 2)) '|\t\t\t'], row_mat(pi_n+1)');
fprintf('|\t');
fprintf([repmat('%2.2f\t', 1, size(row_mat(pi_n+2), 2)) '|\n'], row_mat(pi_n+2)');

for i=1:pi_n+2    
    fprintf('--------');
end
fprintf('\t\t\t');
fprintf('-------------');
fprintf('\n');

[Binv_m Binv_n] = size(Binv);

for row=1:Binv_m
    row_mat = horzcat(Binv(row,:), Binv_b(row), Binv_As(row));
    fprintf('|\t');
    fprintf([repmat('%2.2f\t', 1, size(row_mat(1:pi_n), 2)) '|\t'], row_mat(1:pi_n)');
    fprintf([repmat('%2.2f\t', 1, size(row_mat(pi_n+1), 2)) '|\t\t\t'], row_mat(pi_n+1)');
    fprintf('|\t');
    fprintf([repmat('%2.2f\t', 1, size(row_mat(pi_n+2), 2)) '|\n'], row_mat(pi_n+2)');
end

for i=1:pi_n+2    
    fprintf('--------');
end
fprintf('\t\t\t');
fprintf('-------------');
fprintf('\n');


end

