%obliczanie wartosci funkcji (dane treningowe)
P = linspace(-1, 1, 65);
T = fun(P);
%parametry sieci RBF
eg = 0.001;  % sum-squared error goal (b�ad sredniokwadratowy)
sc = 1;   % spread constant (sta�a rozpietosc funkcji Gaussa)

%newrb - aproksymacja za pomoc� newrb 
net = newrb(P,T,eg,sc);
x = linspace(-1, 1, 250);
y = sim(net,x); 
hold on;
figure, plot(P,T,'x',x,y);
title('Aproksymacja funkcji za pomoca newrb');
legend({'Target','Output'});
hold off;

% newrbe - aproksymacja za pomoc� newrbe 
sc = 0.1; 
net1 = newrbe(P,T, sc);
y1 = sim(net1,x);
hold on;
figure, plot(P,T,'x',x,y1);
title('Aproksymacja funkcji za pomoca newrbe');
legend({'Target','Output'});
hold off;

% newgrnn - aproksymcja za pomoc� newgrnn
sc = 0.02; 
net2 = newgrnn(P,T,sc);
y2 = sim(net2,x); 
hold on;
figure, plot(P,T,'x',x,y2);
title('Aproksymacja funkcji za pomoca newgrnn');
legend({'Target','Output'});
hold off; 
