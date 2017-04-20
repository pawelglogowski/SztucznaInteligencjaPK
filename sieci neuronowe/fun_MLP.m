%obliczanie wartosci funkcji (dane treningowe)
P = linspace(-1, 1, 65); 
T = fun(P); 

%parametry sieci
net = newff(P,T);
hiddenSizes = 10;
net = fitnet(hiddenSizes);  %dopasowanie sieci
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
%rysowanie wykresu dla funkcji rzeczywistej i aproksymowanej
plotperform(tr)
figure, plot(P,T,'x',x,y)
title('Aproksymacja funkcji za pomoca MLP');
legend({'Target','mlp'});