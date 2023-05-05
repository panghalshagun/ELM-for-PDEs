% clear all;
% L=12;
% x=linspace(0.05,1,L);
% M=10;
% u=rand(1,M);
% w=rand(1,M);
% for i=1:L
%     for j=1:M
%         N(i,j)=tanh(-x(i)*u(j)-w(j));
%     end
% end
% for i=1:L
%     for j=1:M
%         mat(i,j)=u(j)^2*(-2)*(sech(-x(i)*u(j)-w(j)))^2*N(i,j)+u(j)*(tanh(u(j)*x(i)+w(j))^2-1)/x(i);
%     end
% end
% for j=1:M
%     mat(L+1,j)=u(j)*(tanh(w(j))^2-1);
%     mat(L+2,j)=tanh(-u(j)-w(j));
% end
% rhs=zeros(L+2,1);
% for i=1:L
%     rhs(i)=-cos(x(i))-sin(x(i))/x(i);
% end
% rhs(L+1)=0;
% rhs(L+2)=cos(1);
% matt=pinv(mat);
%   v=matt*rhs;
% % y=1;
% % while y>0
% %     y=input('enter x\n');
% %     answ=0;
% %     for j=1:M
% %         answ=answ+v(j)*tanh(-y*u(j)-w(j));
% %     end
% %     answ
% %     act=cos(y)
% %     error=act-answ;
% % end
%  
% rms=0;
 yy=linspace(0,1,200);
error=zeros(1,200);
act=zeros(1,200);
error=zeros(1,200);
    answ=zeros(1,200);
    for i=1:200
    for j=1:M
        answ(i)=answ(i)+v(j)*tanh(-(u(j)*yy(i)+w(j)));
%        if mod(j,2)==0
%            answ(i)=answ(i)+v(j)/(1+exp(-(u(j)*yy(i)+w(j))));
%        else
%            answ(i)=answ(i)+v(j)/(1+exp(-(u(j)*yy(i)+w(j))));
%        end
       
%     end
      act(i)=cos(yy(i));
error(i)=answ(i)-act(i);
    end
    end
% rms=rms+sqrt(error(i)^2);
% rms=rms/200;
%      end
%  hh=plot(yy,error,'r-');
%  xlabel('x','fontweight','bold','fontsize',16);
%  ylabel('error in solution')
% set(hh,'linewidth',1.5);
%  set(gcf,'Color','w')
rms(error)