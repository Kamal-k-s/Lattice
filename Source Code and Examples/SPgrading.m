% Pogram for generating Cell grading of SP
clc;
close;
clear all;
 d=(1.35*pi);   
 d2=(2.65*pi); 
 s=pi/30; 
 
 [x,y,z]=meshgrid(-d:s:d2,-d:s:d2,-d:s:d2);
      

    Zmax = max(z(:));
    Zmin = min(z(:));
    
    m1 = 4;     % Max No of Unit cells 
    n1 = 2;     % Min no of Unit cells
    
    m = m1/2;
    n = n1/2;
    
    k1 = (m-n)/(Zmax - Zmin) ; 
    c0 = (k1*Zmin*Zmin)/2;
    c1 = -(Zmin*k1) + n;
    
    
    a= (k1*z + c1);
    b= (k1*z + c1);
    g= (((k1*z)/ 2) + c1 + (c0/z));

     u = cos(a.*x) + cos(b.*y) + cos(g.*z); 

     name = 'Schwarz Primitive (SP)'; 

     c = 0.3; % Level Set

     % Sheet 

     S = -(u+c).*(u-c);

     % Skeletal 

     SK =  u + c;

      isosurface(S,0);
      isocaps(S,0);
                  
      lighting gouraud; 
      xlabel('x');
      ylabel('y');
      zlabel('z');
      title(name);
