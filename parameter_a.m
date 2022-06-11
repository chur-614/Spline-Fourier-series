# Author: Ruichen Z. 
# Creating time: 2022.06.11

a=zeros(mm,nn);  % mm and nn are truncation orders
asin1=linspace(0,0,Zo); % Zo is the number of modeling points of x or y direction. 
asin2=linspace(0,0,Zo)'; % £¨when there is the same number of modeling points in x and y direction£©
for m=0:(mm-1)
    for n=0:(nn-1)
        for i=1:Zo
             uuu=m*pi/(Zo-1);
             www=n* pi/(Zo-1);
             if (m~=0)&&(n~=0)
                 msinc=(sin(uuu)/uuu)*(sin(uuu)/uuu);
                 nsinc=(sin(www)/www)*(sin(www)/www);
                 asin1(i)=sin(m*w1*X(i))*msinc; % normalized horizontal coordinates
                 asin2(i)=sin(n*w2*Y(i))*nsinc; % normalized vertical coordinates
             elseif (m==0)&&(n~=0)
                 nsinc=(sin(www)/www)*(sin(www)/www);
                 asin1(i)=0;
                 asin2(i)=sin(n*w2*X(i))*nsinc;
             elseif (m~=0)&&(n==0)
                 msinc=(sin(uuu)/uuu)*(sin(uuu)/uuu);
                 asin1(i)=sin(m*w1*Y(i))*msinc;
                 asin2(i)=0;
             else
                 asin1(i)=0;
                 asin2(i)=0;
             end
        end
        a(m+1,n+1)=asin1*h*asin2;
        if (m==0)&&(n==0)
            a(m+1,n+1)=a(m+1,n+1)/(4*T1*T2); % normalized coordinate range
        elseif (m~=0)&&(n~=0)
            a(m+1,n+1)=a(m+1,n+1)/(T1*T2);
        else
            a(m+1,n+1)=a(m+1,n+1)/(2*T1*T2);
        end
    end
end
