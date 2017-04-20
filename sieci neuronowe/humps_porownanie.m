%obliczanie wartosci funkcji (dane treningowe)
P = linspace(0, 1.5, 75); 
T = humps(P); 

%parametry sieci
net = newff(P,T);
hiddenSizes = 20;
net = fitnet(hiddenSizes);
net.trainFcn = 'trainbr';   %Bayesian regulation backpropagation
net.trainParam.show = 50;
net.trainParam.lr = 0.05;   %Learning rate
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
%uczenie sieci
[net,tr] = train(net,P,T); 
%dane testowe (wiecej punktow niz przy danych treningowych)
x = linspace(0, 1.5, 250);
%aproksymacja funkcji przy pomocy sieci
y = sim(net,x);

%parametry sieci RBF
eg = 0.00; 
sc = 0.05;  

%newrb - aproksymacja za pomoc¹ newrb 
net1 = newrb(P,T,eg,sc);
x1 = linspace(0, 1.5, 250); 
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