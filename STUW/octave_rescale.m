function R = octave_rescale(A)
a = 0.0;
b = 1.0;
inputMin = min(A(:));
inputMax = max(A(:));

% Regularize constant values to return lowerbound of output range
constReg = (inputMin == inputMax);

sigma = max(min(0,inputMax),inputMin);
inputMin = inputMin - sigma;
inputMax = inputMax - sigma;

e1 = nextpow2(max(abs(inputMax), abs(inputMin)));
r1 = 2.^(e1-1);
e2 = nextpow2(max(abs(a),abs(b)));
r2 = 2.^(e2-1);
r3 = 2.^(fix((e1+e2)/2)-1);

z = ((inputMax./r1).*(a./r3) - (inputMin./r1).*(b./r3) + (a./r3).*(constReg./r1)) ...
    ./ ((inputMax./r1)-(inputMin./r1) + (constReg./r1));
slope = ((b./r2)-(a./r2))./((inputMax./r3)-(inputMin./r3) + (constReg./r3));
if ~isfloat(A)
    R = r2 .* (slope./r3 .* (double(A) - sigma) + (r3./r2).*z);
else
    R = r2 .* (slope./r3 .* (A - sigma) + (r3./r2).*z);
end

R = max(R, a);
R = min(R, b);

end
