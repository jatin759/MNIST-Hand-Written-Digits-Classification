X =  dlmread('data.txt');
xmean = mean(X);
[n d] = size(X);
for i=1:n
    xn(i,:) = X(i,:) - xmean;
end
size(xn);

sig = (1/n).*(xn')*(xn);
size(sig);
% sig = cov(xn);
[u,s,v] = svd(sig);
figure,scatter3(u(:,1),u(:,3),u(:,5))
size(u)
u1 = vec2mat(u(:,1),20);
figure, imshow(u1);
u2 = vec2mat(u(:,3),20);
figure, imshow(u2);
u3 = vec2mat(u(:,5),20);
figure, imshow(u3);

% for k=1:d
%     ured = u(:,1:k);
%     z = xn*ured;
%     xrec = z*(ured');
%     for i=1:n
%        xrec(i,:) = xrec(i,:) + xmean;  
%     end
%     err = 0;
%     for i=1:n
%        err = err + norm(X(i,:) - xrec(i,:))^2;
%     end
%     err = (1/n)*err;
%     if err < 0.1
%         break;
%     end
%     k;
%     err;
% end
% k
% err
% save('z.mat','z');



