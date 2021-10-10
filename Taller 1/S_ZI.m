function S = S_ZI(Z,I)

Iconj=conj(I);
It=abs(Iconj)^2;
S =Z*It;
end