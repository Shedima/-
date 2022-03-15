clear;clc;
h = 0.1;
x = 0 : h : 20;
N = length(x);
x1p=zeros(1,N);
x2p=zeros(1,N);
x1=zeros(1,N);
x2=zeros(1,N);
x1(1)=0;
x2(1)=1;
func_1=@(x2)x2;
func_2=@(x_1,x_2) -2*x_1-x_2+5;

for i =2:N
    x1_p=x1(i-1)+h*func_1(x2(i-1));
    x2_p=x2(i-1)+h*func_2(x1(i-1),x2(i-1));
    string_ola=['欧拉法=',num2str(x1_p),'   ',num2str(x2_p)];
    disp(string_ola);
    x1(i)=x1(i-1)+h/2*(func_1(x2(i-1))+func_1(x2_p)); 
    x2(i)=x2(i-1)+h/2*(func_2(x1(i-1),x2(i-1))+func_2(x1_p,x2_p));
    string=['梯形法=',num2str(x1(i)),'   ',num2str(x2(i))];
    disp(string);
end
plot(x, x1, 'o', x, x2, '*');
legend('位移', '速度');