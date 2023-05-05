clear all;
x=linspace(0,1,11);
y=linspace(0,1,11);
u1=rand(1,200);
u2=rand(1,200);
w=rand(1,200);
v=zeros(1,200);
l=1;
for i=1:11
    for j=1:11
        for k=1:200
        N(k,l)=tanh(-x(i)*u1(k)-y(j)*u2(k)-w(k));
        end
        l=l+1;
    end
end
l=1;
for i=1:11
    for j=1:11
        for k=1:200
            mat(k,l)=-2*u1(k)^2*tanh(w(k)+u1(k)*x(i)+u2(k)*y(j))*(tanh(w(k)+u1(k)*x(i)+u2(k)*y(j))^2-1)-2*u2(k)^2*tanh(w(k)+u1(k)*x(i)+u2(k)*y(j))*(tanh(w(k)+u1(k)*x(i)+u2(k)*y(j))^2-1);
        end
    l=l+1;    
    end
end
for j=1:200
    mat(j,122)=tanh(-0.1*u2(j)-w(j));
    mat(j,123)=tanh(-0.2*u2(j)-w(j));
    mat(j,124)=tanh(-0.3*u2(j)-w(j));
    mat(j,125)=tanh(-0.4*u2(j)-w(j));
    mat(j,126)=tanh(-0.5*u2(j)-w(j));
    mat(j,127)=tanh(-0.6*u2(j)-w(j));
    mat(j,128)=tanh(-0.7*u2(j)-w(j));
    mat(j,129)=tanh(-0.8*u2(j)-w(j));
    mat(j,130)=tanh(-0.9*u2(j)-w(j));
    mat(j,131)=tanh(-1*u2(j)-w(j));

    mat(j,132)=tanh(-0.1*u1(j)-w(j));
    mat(j,133)=tanh(-0.2*u1(j)-w(j));
    mat(j,134)=tanh(-0.3*u1(j)-w(j));
    mat(j,135)=tanh(-0.4*u1(j)-w(j));
    mat(j,136)=tanh(-0.5*u1(j)-w(j));
    mat(j,137)=tanh(-0.6*u1(j)-w(j));
    mat(j,138)=tanh(-0.7*u1(j)-w(j));
    mat(j,139)=tanh(-0.8*u1(j)-w(j));
    mat(j,140)=tanh(-0.9*u1(j)-w(j));
    mat(j,141)=tanh(-1*u1(j)-w(j));
      
mat(j,142)=tanh(-u1(j)-0.1*u2(j)-w(j));
mat(j,143)=tanh(-u1(j)-0.2*u2(j)-w(j));
mat(j,144)=tanh(-u1(j)-0.3*u2(j)-w(j));
mat(j,145)=tanh(-u1(j)-0.4*u2(j)-w(j));
mat(j,146)=tanh(-u1(j)-0.5*u2(j)-w(j));
mat(j,147)=tanh(-u1(j)-0.6*u2(j)-w(j));
mat(j,148)=tanh(-u1(j)-0.7*u2(j)-w(j));
mat(j,149)=tanh(-u1(j)-0.8*u2(j)-w(j));
mat(j,150)=tanh(-u1(j)-0.9*u2(j)-w(j));
mat(j,151)=tanh(-u1(j)-1.0*u2(j)-w(j));
 
mat(j,152)=tanh(-u2(j)-0.1*u1(j)-w(j));
mat(j,153)=tanh(-u2(j)-0.2*u1(j)-w(j));
mat(j,154)=tanh(-u2(j)-0.3*u1(j)-w(j));
mat(j,155)=tanh(-u2(j)-0.4*u1(j)-w(j));
mat(j,156)=tanh(-u2(j)-0.5*u1(j)-w(j));
mat(j,157)=tanh(-u2(j)-0.6*u1(j)-w(j));
mat(j,158)=tanh(-u2(j)-0.7*u1(j)-w(j));
mat(j,159)=tanh(-u2(j)-0.8*u1(j)-w(j));
mat(j,160)=tanh(-u2(j)-0.9*u1(j)-w(j));
mat(j,161)=tanh(-u2(j)-1.0*u1(j)-w(j));

end
l=1;
for i=1:11
    for j=1:11
        rhs(l)=exp(-x(i))*(x(i)-2+y(j)^3+6*y(j));
        l=l+1;
    end
end
l=1;
for i=122:131
    rhs(i)=y(l+1)^3;

l=l+1;
end
l=1;
for i=132:141
    rhs(i)=x(l+1)*exp(-x(l+1));
l=l+1;
end
l=1;
for i=142:151
    rhs(i)=(1+y(l+1)^3)*exp(-1);
l=l+1;
end
l=1;
for i=152:161
        rhs(i)=(x(l+1)+1)*exp(-x(l+1));
    l=l+1;
end

matt=pinv(mat);
v=rhs*matt;
% y1=1;
% while y1>-1
%     y1=input('enter x\n');
%     y2=input('enter y\n');
%     answ=0;
%     for j=1:200
%         answ=answ+v(j)*tanh(-y1*u1(j)-y2*u2(j)-w(j));
%     end
%     fprintf('%.15f\n',answ);
%  end
% % 
% % % 
y1=linspace(0,1,100);
y2=linspace(0,1,100);
answ=zeros(100,100);
for i=1:100
    for j=1:100
        for k=1:200
            answ(i,j)=answ(i,j)+v(k)*tanh(-y1(i)*u1(k)-y2(j)*u2(k)-w(k));
        end
        act(i,j)=-1/(2*pi*pi)*sin(pi*y1(i))*sin(pi*y2(j));
        error(i,j)=act(i,j)-answ(i,j);
    end
end
% % % mesh(y1,y2,error)
% y1=[0,.2174,.587,.3971,.7193,.8752,.9471,.4521,.298,.632];
% y2=[0.2318,0.7490,0.3285,0.6481,0.2871,0.5380,0.4691,0.8241,0.9153,0.1834];
% for i=1:10
%     answ(i)=0;
%         for k=1:200
%             answ(i)=answ(i)+v(k)*tanh(-y1(i)*u1(k)-y2(i)*u2(k)-w(k));
%         end
%         act=[0.012454901432000,0.513009852104651,0.346077236496052,0.449964154569349 ,0.361892942424939 ,0.429665815073745,0.407384517762609,0.643786002811775,.790413322406531,0.339204362555939];
% %         act(i,j)=-1/(2*pi*pi)*sin(pi*y1(i))*sin(pi*y2(i));
%         error(i)=answ(i)-act(i);
% end
%  plot(error)
% % mesh(y1,y2,error)

