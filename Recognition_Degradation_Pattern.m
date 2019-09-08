%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                   %        Neural Network         %
                   %    Degradation Resilience     %
                   %     Single vs Multilayer      %
                   %          Perceptron           %
                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;
close all;
hold off; 
clc;


 N_i=12*13; N_h=2; N_o=26;
 w_h=rand(N_h,N_i)-0.5; w_o=rand(N_o,N_h)-0.5;
 
 
 load pattern1;
 nIn=12*13;
 r_i=reshape(pattern1', nIn, 26); 
 r_d=diag(ones(1,26));
 
 p=100; % epoch for training step

 % Updating and training network with sigmoid activation function
 
 for sweep=1:p;
   % training randomly on one pattern
     i=ceil(4*rand);
     r_h=1./(1+exp(-w_h*r_i(:,i)));
     r_o=1./(1+exp(-w_o*r_h));
     d_o=(r_o.*(1-r_o)).*(r_d(:,i)-r_o);
     d_h=(r_h.*(1-r_h)).*(w_o'*d_o);
     w_o=w_o+0.7*(r_h*d_o')';
     w_h=w_h+0.7*(r_i(:,i)*d_h')';
   % test all pattern
     r_o_test=1./(1+exp(-w_o*(1./(1+exp(-w_h*r_i)))));
     d(sweep)=0.5*sum(sum((r_d - r_o_test).^2))/26; % Sum ==> not sure // divided by 26
     

     
 end

for tata=1:100
   
 pattern2 = round(pattern1 - (tata*0.03)*rand(size(pattern1)));

 rIn_1=reshape(pattern2', nIn, 26);

     i=ceil(4*rand);
     r_h=1./(1+exp(-w_h*rIn_1(:,i)));
     r_o=1./(1+exp(-w_o*r_h));
     d_o=(r_o.*(1-r_o)).*(r_d(:,i)-r_o);
     d_h=(r_h.*(1-r_h)).*(w_o'*d_o);
   % test all pattern
     r_o_test=1./(1+exp(-w_o*(1./(1+exp(-w_h*rIn_1)))));
     d__1(tata)=0.5*sum(sum((r_d - r_o_test).^2))/26;
 
 
end


 

 nIn=12*13; nOut=26;
 wOut=rand(nOut,nIn)-0.5; 
 
% training vectors 
 load pattern1;
 rIn=reshape(pattern1', nIn, 26); 
 rDes=diag(ones(1,26));

% Updating and training network 
 for training_step=1:p;
     % test all pattern
      rOut=(wOut*rIn)>0.5;
      distH=0.5*sum(sum((rDes-rOut).^2))/26;
      error(training_step)=distH;
     % training with delta rule
      wOut=wOut+0.1*(rDes-rOut)*rIn';  
 end
 
 
 for i=1:100

    
 pattern2 = round(pattern1 - (i*0.03)*rand(size(pattern1)));

 rIn_1=reshape(pattern2', nIn, 26);
 
  imshow(pattern2)    
    
 rOut=(wOut*rIn_1)>0.5;    
 distH=0.5*sum(sum((rDes-rOut).^2))/26;
 error_2(i)=distH;
 % training with delta rule
 
 end


 subplot(2,1,1)
 b1 = plot(d); M1 = "Multilayer perceptron";
 hold on
 b2 = plot(error); M2 = "Single Perceptron";
 legend([b1,b2], [M1, M2]);
 xlabel('Training step'); ylabel('Error');
 
 
 subplot(2,1,2)
 a1=plot(d__1);M1 = "Multilayer perceptron";
 hold on; 
 a2=plot (error_2);M2 = "Single Perceptron";
 legend([a1,a2], [M1, M2]);
 xlabel('Noise'); ylabel('Error');
 

 
 