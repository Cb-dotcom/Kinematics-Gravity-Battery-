%FOUR BAR LINKAGE MECHANISM

clear all
close all

%Writing down our inputs(In this case they are assumed and can be changed
%to test many cases of Grashof


L0 = input("Enter length of link 0: "); %7
L1 = input("Enter length of link 1: "); %3
L2 = input("Enter length of link 2: "); %7.5
L3 = input("Enter length of link 3: "); %4.5

L_AP =input("Enter length of AP: "); %4
alpha =input("Enter legnth of alpha which is the angle between AP and AB: "); %35

theta2 = 0:2:720; %Theta2 will go from 0 to 720 degrees with a step of 2
figure(1); 
for i = 1:length(theta2)   %We want this loop to keep running as long as i goes from 1 to 720
    
  if theta2(i) > 360
   theta2(i) = theta2(i)-360;
  end
  
  %We are giving values for different variables at each instant i 

   AC(i) = sqrt(L0^2 + L1^2 - 2*L0*L1*cosd(theta2(i)));
   beta(i) = acosd((L0^2 + AC(i)^2 - L1^2) / (2*L0*AC(i)));
   psi(i) = acosd((L2^2 + AC(i)^2 - L3^2) / (2*L2*AC(i)));
   lamda(i) = acosd((L3^2 + AC(i)^2 - L2^2) / (2*L3*AC(i)));
   
   theta3(i) = psi(i) - beta(i);
   theta4(i) = 180 - lamda(i) - beta(i);
   
   %NB the angles of theta3 and theta4 will actually change when theta2>180
   %so we just adjusted these values here
   if theta2(i) > 180
       theta3(i) = psi(i) + beta(i);
       theta4(i) = 180 - lamda(i) + beta(i);
   end
   
   %Define the joints position like any regular vector using x and y 

   Ox(i) = 0;
   Oy(i) = 0;
   
   Ax(i) = Ox(i) + L1*cosd(theta2(i));
   Ay(i) = Oy(i) + L1*sind(theta2(i));
   
   Bx(i) = Ox(i) + Ax(i) + L2*cosd(theta3(i));
   By(i) = Oy(i) + Ay(i) + L2*sind(theta3(i));
   
   Cx(i) = L0;
   Cy(i) = 0;
   
   Px(i) = Ox(i) + Ax(i) + L_AP*cosd(alpha+theta3(i));
   Py(i) = Oy(i) + Ay(i) + L_AP*sind(alpha+theta3(i));
   
   
   r = [ L2*cosd(theta3(i)), -L3*cosd(theta4(i));...
         L2*sind(theta3(i)), -L3*sind(theta4(i)) ];
    
   v = [ -L1*5*cosd(theta2(i)); -L1*5*sind(theta2(i))];
   
   w(i,:) = inv(r)*v; %Formula of w
   om2(i) = w(i,1); %1 represents first column
   om4(i) = w(i,2); %2 represents second column

   
   
   alpha_dot(i) = - (L1*om2(i)*cosd(theta2(i)) - L3*om4(i)*cosd(theta4(i)))/ ...
                    (L2*cosd(alpha) + L_AP*cosd(alpha));
                
   V_Px(i) = alpha_dot(i)*Px(i);
   V_Py(i) = alpha_dot(i)*Py(i);
     

   plot( [Ox(i) Ax(i)], [Oy(i) Ay(i)], [Ax(i) Bx(i)], [Ay(i) By(i)] ...
       , [Bx(i) Cx(i)], [By(i) Cy(i)], 'LineWidth',3)

   hold on; %This will retain current plot when adding new plots
   
   %Plotting the point P for having this triangular shape as Link2
   plot( [Ax(i) Px(i)], [Ay(i) Py(i)],'LineWidth',3)
   plot( [Bx(i) Px(i)], [By(i) Py(i)],'LineWidth',3)
  
   %Plot parameters
    grid; %Show grid 
    axis equal; % Equal axis
    axis([-5 15 -5 10]); %Values on graph
    drawnow; %updates figures and processes any pending callbacks, this command let us see updates on the screen immediately
    hold off; %sets the hold state to off so that new plots added to the axes clear existing plots and reset all axes properties
    
end

figure(2)
plot(theta2, om2,'LineWidth',2)
title('Angular Velocity of \theta_3')
xlabel('\theta_2')
ylabel('Joint AB')

figure(3)
plot(theta2, om4,'LineWidth',2)
title('Angular Velocity of \theta_4')
xlabel('\theta_2')
ylabel('Joint AB')

%Creating a function to know which case of Grashof the mechanism is
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
    h=msgbox('This 4 bar mechanism is Grashof Type 1');
    
end

if Test>0
    h=msgbox('This 4 bar mechanism is Grashof Type 2');
    
end

if Test==0
    h=msgbox('This 4 bar mechanism  is Grashof Type 3');
end





figure(4)
plot(theta2,  V_Px,'LineWidth',2)
title('x-component velocity of P')
xlabel('\theta_2')
ylabel('Velocity of Point P')

figure(5)
plot(theta2,  V_Py,'LineWidth',2)
title('y-component velocity of P')
xlabel('\theta_2')
ylabel('Velocity of Point P')
