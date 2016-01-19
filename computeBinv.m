function [ Binv ] = computeBinv( E )
%computeBinv This function computes the B inverse
%   B inverse is calculation using product inverse form
%   Binv = Ei+1 * Ei
%
%   @author: Vinay B Gavirangaswamy
%   @email:  mail2vinaybabu@gmail.com
%

    [m n] = size(E);
    
    Binv = E{n};
    
    n = n -1;
    
    for i = n : -1 : 1
       
        Binv  = Binv * E{i};
        
    end

end

