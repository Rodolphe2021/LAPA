set(0,'DefaultFigureWindowStyle','docked')

BCL = 1; %voltage at the left side of the Boundary Condition
BCR = 0; %voltage at the right side of the Boundary Condition
%nx = randi([10 100],1);
%ny = randi([10 100],1);


a = 1;
b = 1;
nx =100;
ny = 100;

ni = 10000;
dx= a/nx;                    
dy=b/ny;                     

x=0:dx:a;                        
y=0:dy:b;                        

V = zeros(nx,ny);
SidesToZero = 0;
for k = 1:ni
  for i = 1:ny+1
      for j = 1:nx+1   
           
         V(i,j) =1/sin(x(j))./sin(a).*cosh(y(j))./cosh(b);
       
    
      end

   end
    


    if mod(k,50)== 0
       surf(V);
       pause(0.05);
    end
end

[Ex,Ey] = gradient(V);
figure
quiver(-Ey',Ex')
