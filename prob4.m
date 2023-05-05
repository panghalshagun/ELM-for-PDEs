% clear all;
% M=10;
% x=linspace(0,1,20);
% u=rand(1,M);
% v=zeros(1,M);
% w=rand(1,M);
% for i=1:20
%     for j=1:M
%         N(i,j)=1/(1+exp(-x(i)*u(j)-w(j)));
% N(i,j)=tanh(-x(i)*u(j)-w(j));
%     end
% end
% for i=1:20
%     for j=1:M
%         mat(i,j)=u(j)*u(j)*N(i,j)*(1-N(i,j))*(1-2*N(i,j))+N(i,j);
% mat(i,j)=u(j)^2*(-2)*(sech(-x(i)*u(j)-w(j)))^2*N(i,j)+N(i,j);
%     end
% end
% for i=1:30
%    mat(i,9)=mat(i,1)+1-x(i);
% end
%  for j=1:M
%     mat(31,j)=1/(1+exp(-w(j)));
% mat(21,j)=tanh(-w(j));
% mat(22,j)=tanh(-u(j)-w(j));
%     mat(32,j)=1/(1+exp(-u(j)-w(j)));
%  end
% rhs=zeros(22,1);
% for i=1:20
%     rhs(i)=2;
% end
% rhs(21)=1;
% rhs(22)=0;
%     matt=pinv(mat);
% v=matt*rhs;
rms=0;
yy=linspace(0,1,100);
error=zeros(1,100);
act=zeros(1,100);
error=zeros(1,100);
M=10;
    answ=zeros(1,100);
    for i=1:100
     for j=1:10
%        if mod(j,2)==0
%            answ(i)=answ(i)+v(j)/(1+exp(-(u(j)*yy(i)+w(j))));
%        else
%            answ(i)=answ(i)+v(j)/(1+exp(-(u(j)*yy(i)+w(j))));
%        end
answ(i)=answ(i)+v(j)*tanh(-(u(j)*yy(i)+w(j)));
%        answ(i)=1-yy(i)+yy(i)*(1-yy(i))*answ(i);
    end
      act(i)=-cos(yy(i))+(cos(1)-2)*sin(yy(i))*csc(1)+2;
error(i)=answ(i)-act(i);
   rms=rms+sqrt(error(i)^2);
 rms=rms/100;
    end
   
% plot(yy,error,'r-')
% 

% yy=1;
% while yy>0
%     answ=0;
%     yy=input('enter x\n');
% for j=1:M
% %        if mod(j,2)==0
%            answ=answ+v(j)*tanh(-(u(j)*yy+w(j)));
% %        else
% %            answ=answ+v(j)/(1+exp(-(u(j)*yy+w(j))));
%        end
%       act=-cos(yy)+(cos(1)-2)*sin(yy)*csc(1)+2; 
% fprintf('answ=%.15f\n',answ);
% error=act-answ
% end
% %       act=cos(yy)+(1-cos(1))/sin(1)*sin(yy)-1;
% % error=answ-act;
% % act
