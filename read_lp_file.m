function [ C, A, b] = read_lp_file( file_name )
%read_lp_file Function reads lp from a text file which is written in the 
%             following format:
%             C <-- Matrix B
%             5 1 3 4 0 0 0 
%             b <-- Matrix B
%             20 40 50 
%             A 3 7 <-- Dimensions of Matrix A
%             1 -2 4 3 1 0 0 
%             -4 6 5 -4 0 1 0
%             2 -3 3 8 0 0 1 
%
%   @author: Vinay B Gavirangaswamy
%   @email:  mail2vinaybabu@gmail.com
%

fileID = fopen(file_name,'r');


sizeA = [1 1];
mat_type = fscanf(fileID, '%s', sizeA);

% print_str = sprintf('Read mat(%s)=',mat_type);
% disp(print_str);

sizeA = [1 Inf];
C = fscanf(fileID, '%f', sizeA);

% disp(C);

sizeA = [1 1];
mat_type = fscanf(fileID, '%s', sizeA);

% print_str = sprintf('Read mat(%s)=',mat_type);
% disp(print_str);

sizeA = [1 Inf];
b = fscanf(fileID, '%f', sizeA);
b=b';

% disp(b);

sizeA = [1 3];
mat_type = fscanf(fileID, '%s %d %d', sizeA);

% print_str = sprintf('Read mat(%s)=',mat_type(1));
% disp(print_str);


sizeA = [mat_type(3) Inf];

% sizeA = [3 6];

A = fscanf(fileID, '%f', sizeA);
A = A';

%disp(A);
end

