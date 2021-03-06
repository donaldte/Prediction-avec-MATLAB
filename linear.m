scrm = table2array(Sacramentorealestatetransactions(:,3));
scrm(:,2)=table2array(Sacramentorealestatetransactions(:,5));
scrm(:,3)=table2array(Sacramentorealestatetransactions(:,6));
scrm(:,4)=table2array(Sacramentorealestatetransactions(:,7));
scrm(:,5)=table2array(Sacramentorealestatetransactions(:,11));
scrm(:,6)=table2array(Sacramentorealestatetransactions(:,12));
scrm(:,7)=table2array(Sacramentorealestatetransactions(:,10));
subplot(2,2,1);
plot3(scrm(:,4),scrm(:,5),scrm(:,7),'o');
ind = scrm(:,4)==0;
scrm(ind,:)=[];
index = scrm(:,5)==0;
scrm(index,:)=[];
M = max(scrm(:,4));
ind=find(scrm(:,4)==M);
scrm(ind,:)=[];
subplot(2,2,2);
plot3(scrm(:,4),scrm(:,5),scrm(:,7));
y = scrm(:,7);
z=scrm(:,5)
b = regress(y,scrm(:,1:6));
x1 = scrm(:,4)
x2 = scrm(:,5);
[X1,X2] = meshgrid(x1,x2);
yfit = b(1)+b(2)*X1 +b(3)*X2 + b(4)*X1.*X2;
subplot(2,2,3);
scatter3(scrm(:,4),z,yfit);
subplot(2,2,4);
plot3(scrm(:,4),z,y,'filled');
hold on;
mesh(X1,X2,yfit);
xlabel('sql_ft');
ylabel('bath');
zlabel('price');
