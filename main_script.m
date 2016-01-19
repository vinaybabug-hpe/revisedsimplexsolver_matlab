%   main_script This script is used to solve multiple LP problems using
%   provided code
%   
%   @author: Vinay B Gavirangaswamy
%   @email: mail2vinaybabu@gmail.com
%

diary;
diary('problem1_output.txt');

[C, A, b] = read_lp_file('problem1.txt');

z = doRevisedSimplexMethod(C, A, b);

diary off;
diary on;
diary 'problem2_output.txt';
[C, A, b] = read_lp_file('problem2.txt');

z = doRevisedSimplexMethod(C, A, b);
diary off;
diary on;
diary 'problem3_output.txt';
 [C, A, b] = read_lp_file('problem3.txt');
 
 z = doRevisedSimplexMethod(C, A, b);
diary off;
diary on;
diary 'problem4_output.txt';
[C, A, b] = read_lp_file('problem4.txt');

z = doRevisedSimplexMethod(C, A, b);
diary off;