% clear all;
% M=5000;
% T=50;
% x=linspace(0,2,T);
% u=rand(1,M);
% v=zeros(1,M);
% w=rand(1,M);
% for i=1:T
%     for j=1:M
%       %  N(i,j)=1/(1+exp(-x(i)*u(j)-w(j)));
%         N(i,j)=tanh(-x(i)*u(j)-w(j));
%              end
% end
% for i=1:T
%     for j=1:M 
%         mat(i,j)=-u(j)*(sech(-x(i)*u(j)-w(j)))^2-N(i,j);
%     end
% end
% for j=1:M
%     mat(T+1,j)=tanh(-w(j));
%     mat(13,j)=u(j)*exp(-w(j)-u(j))/(exp(-u(j)-w(j))+1)^2;
% end
% rhs=zeros(1,T+1);
% for i=1:T
%     rhs(i)=1-x(i)*x(i);
% end
% rhs(T+1)=0.5;
%     matt=pinv(mat);
% v=rhs*(matt');
rms=0;
yy=linspace(0,2,400);
error=zeros(1,400);
act=zeros(1,400);
error=zeros(1,400);
    answ=zeros(1,400);
    for i=1:400
    for j=1:M
%        if mod(j,2)==0
%            answ(i)=answ(i)+v(j)/(1+exp(-(u(j)*yy(i)+w(j))));
%        else
%            answ(i)=answ(i)+v(j)/(1+exp(-(u(j)*yy(i)+w(j))));
%        end
%        answ(i)=yy(i)*answ(i);
answ(i)=answ(i)+v(j)*tanh(-(u(j)*yy(i)+w(j)));
    end
      act(i)=(yy(i)+1)^2-0.5*exp(yy(i));
error(i)=act(i)-answ(i);
rms=rms+sqrt(error(i)^2);
 rms=rms/400;
    end
% plot(yy,error)
% 
% % % 
% %  yy=1;
% %  while yy>0
% %      answ=0;
% %      yy=input('enter x\n');
% %  for j=1:M
% % %        if mod(j,2)==0
% % %            answ=answ+v(j)/(1+exp(-(u(j)*yy+w(j))));
% % %        else
% %             answ=answ+v(j)*tanh(-u(j)*yy-w(j));
% % %        end
% % %        
% %  end
% %      act=(yy+1)^2-0.5*exp(yy);
% % % %       act=cos(yy)+(1-cos(1))/sin(1)*sin(yy)-1;
% %  error=answ-act;
% % % % act
% % % answ
% % fprintf('error=%e\n answ=%.15f\n',error,answ)
% %      end
