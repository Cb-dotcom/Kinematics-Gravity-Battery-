L0=7;
L1=3;
L2=7.5;
L3=4.5;


A = [L0,L1,L2,L3];
Max = max(A);
disp("Maximum Value is " + Max);
ind1 = find(A==Max);
A(ind1) = [];
Min = min(A);
disp("Minimum value is " + Min);
ind2 = find(A==Min);
A(ind2) = [];
int1 = A(1);
int2 = A(2);
disp("The other values are: "+int1+" and "+int2);

Test = (Max+Min)-(int1+int2);

if Test<0
    h=msgbox('This is Grashof Type 1');
end

if Test>0
    h=msgbox('This is Grashof Type 2');
end

if Test==0
    h=msgbox('This is Grashof Type 3');
end
