% Description: uses horizontal and vertical local gradient estimates (from
% a call to imgradientxy() or your own my_imgradientxy() implementation) to
% compute maximum rate of increase information at each pixel
%
% Inputs: 
% Gx an array of horizontal local gradient estimates in double precision 
% Gy an array of vertical local gradient estimates in double precision
% 
% Outputs:
% Gmag an array of magnitudes for the maximum rate of increase in local
% gradient
% Gdir an array of directions for the maximum rate of increase in local
% gradient (in units of degrees)
% 
% Notes: the magnitude information is easy to compute with Pythagoras'
% theorem (more in the lecture slides) and remember that calling atan2()
% (rather than the basic atan() inverse tangent function) avoids you having
% to make manual corrections to the direction information (more in the
% lecture slides again) but it will return an answer in radians; you can
% use the following relationship to convert back to degrees: π radians =
% 180 degrees; and matlab lets you write pi to get the nearest value of π
% in double precision 
% 
function [Gmag, Gdir] = my_imgradient(Gx, Gy)
    
     
    
    Gmag = sqrt (abs(Gx).^2 + abs(Gy).^2);
    %finds the magnitude of the maximum rate of increase vectors at every
    %pixel
    %Pythagoras theorem (a2 + b2 = c2)
    
    Gdir = atan2(-Gy, Gx) * 180 / pi;
    %gets directions of the maximum rate of increase at every pixel (-180
    %to +180)

   
    
    

end