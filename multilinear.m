scrm=table2array(Sacramentorealestatetransactions(:,3));
scrm(:,2)=table2array(Sacramentorealestatetransactions(:,5));
scrm(:,3)=table2array(Sacramentorealestatetransactions(:,6));
scrm(:,4)=table2array(Sacramentorealestatetransactions(:,7));
scrm(:,5)=table2array(Sacramentorealestatetransactions(:,12));
scrm(:,6)=table2array(Sacramentorealestatetransactions(:,11));
scrm(:,7)=table2array(Sacramentorealestatetransactions(:,10));
subplot(2,2,1);
plot3(scrm(:,4),scrm(:,5),scrm(:,7),'o');
ind=scrm(:,4)==0;
scrm(ind,:)=[];
M=max(scrm(:,4));
ind=find(scrm(:,4)==M);
scrm(ind,:)=[];
subplot(2,2,2);
plot3(scrm(:,4),scrm(:,5),scrm(:,7)),
y=scrm(:,7);
b=regress(y,scrm(:,1:6));
[x1,x2]=meshgrid(scrm(:,4),scrm(:,5));
yhat=b(1)*scrm(:,1)+b(2)*scrm(:,2)+b(3)*scrm(:,3)+b(4)*x1+ b(5)*x2+b(6)*scrm(:,6);
subplot(2,2,3);
scatter3(scrm(:,4),scrm(:,5),y);
subplot(2,2,4);
scatter3(scrm(:,4),scrm(:,5),y);
 hold('on');
 mesh(x1,x2,yhat);
 xlabel('sql_ft');
 ylabel('beds');
 zlabel('price')
 grid('on');
 



