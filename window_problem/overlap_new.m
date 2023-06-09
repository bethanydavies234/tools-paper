function output = overlap_new(B,C,p)
%compute the new function of two patterns that tells how much they overlap
%this is used to compute the variance of the waiting time.

%B and C must be of vector form, i.e. the first entry tells us in
%which timeslot the second success was generated, ..., s'th entry tells us
%when the last success was generated.

%E.G. for 10001011
%B = [2,4,8]
%B_shift = [0,1,3] tells the number of failures in between successes.

%note that both B and C should have length s-1
s = length(B)+1;

output = 0*1/p; 
%already know that the very first entry of B will be the very last entry of C 
%(as both are successes). This corresponds to the last term in the sum
%which is multiplied by a factor of 0.

%define vectors that tell us the number of zeros in between the successes
%of B and C
B_shift = []; C_shift = [];
B_shift(1) = B(1)-2; C_shift(1) = C(1) - 2;
for I = 2:s-1
    B_shift(I) = B(I) - B(I-1)-1;
    C_shift(I) = C(I) - C(I-1)-1;
end

for I = 1:(s-1)
    %check whether the corresponding entries of B_shift and C_shift match
    %and if so, add corresponding term to the sum.
    if C_shift(1:I) == B_shift((s-1-I+1):(s-1))
        c = C_shift(1:I);
        output = output + ((1/p)^(I+1)*(1/(1-p))^(C(I)-(I+1)))*(sum(c)+length(c));
    end
end
end



