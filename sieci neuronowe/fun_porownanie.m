%obliczanie wartosci funkcji (dane treningowe)
P = linspace(-1, 1, 65); 
T = fun(P); 

%parametry sieci
net = newff(P,T);
hiddenSizes = 10;
net = fitnet(hiddenSizes);
net.trainFcn = 'trainlm';   %Levenberg-Marquardt backpropagation
net.trainParam.show = 50;
net.trainParam.lr = 0.1;    %Learning rate
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
%uczenie sieci
[net,tr] = train(net,P,T); 
%dane testowe (wiecej punktow niz przy danych treningowych)
x = linspace(-1, 1, 250);
%aproksymacja funkcji przy pomocy sieci
y = sim(net,x);

%parametry sieci RBF
sc = 0.1;

% newrbe - aproksymacja za pomoc¹ newrbe  
net1 = newrbe(P,T, sc);
x1 = linspace(-1, 1, 250); 
y1 = sim(net1,x1);

figure;
plot(P,T,'x');
hold on;
plot(x,y,'r','LineWidth', 2);
hold on;
plot(x1,y1,'b','LineWidth', 1);
hold on;
legend({'Target','MLP','RBF'});
hold on;
title('Porównanie -  RBF i MLP');
grid;
hold off;