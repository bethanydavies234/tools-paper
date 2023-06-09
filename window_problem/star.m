function output = star(B,C,p)
%given two ending patterns B and C and Bernoulli trials with parameter p, calculates the star product between
%them

%B and C must be of vector form, i.e. the first entry tells us in
%which timeslot the second success was generated, ..., s'th entry tells us
%when the last success was generated.

%E.G. for 10001011
%B = [2,4,8]
%B_shift = [0,1,3]

%note that here, the roles of B and C are switched from in the text, so
%that C corresponds to the string on which the gamblers are betting and B
%is the realisation of the Bernoulli trials. 

%note that both B and C should have length s-1
s = length(B)+1;

output = 1/p; %already know that the very first entry of B will be the very last entry of C 
%(as both are successes)

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
    if C_shift(1:I) == B_shift((s-1-I +1):(s-1))
        output = output + (1/p)^(I+1)*(1/(1-p))^(C(I)-(I+1));
    end
end
end

%was checking with e.g. B = [346] and C = [356] but seems to be wrong.