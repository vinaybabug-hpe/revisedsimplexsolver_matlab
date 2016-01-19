function [ E ] = product_inv( b, a, leaving_bv )
%   product_inv Function finds the product inv form's E for each iteration
%   Input:
%   b           Default Binv
%   a           aj where jth variable is leaving
%   leaving_bv  Jth leaving basic variable
%   Output:
%   E           Ei for current iteration
%
%   @author: Vinay B Gavirangaswamy
%   @email:  mail2vinaybabu@gmail.com
%
E = b;

[m n] = size(E);

for i=1:m
   if(i ~= leaving_bv)
    E(i, leaving_bv) = -(a(i)/a(leaving_bv));
   else
        E(i, leaving_bv) = 1/a(leaving_bv);
   end    
end

end

