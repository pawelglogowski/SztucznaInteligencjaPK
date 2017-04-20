%obliczanie wartosci funkcji (dane treningowe)
P = linspace(0, 1.5, 75); 
T = humps(P);
%parametry sieci RBF
eg = 0.02;  % sum-squared error goal (b³ad sredniokwadratowy)
sc = 0.1;   % spread constant (sta³a rozpietosc funkcji Gaussa)

%newrb - aproksymacja za pomoc¹ newrb 
net = newrb(P,T,eg,sc);
x = linspace(0, 1.5, 250);
y = sim(net,x); 
hold on;
figure, plot(P,T,'x',x,y);
title('Aproksymacja funkcji za pomoca newrb');
legend({'Target','Output'});
hold off;

% newrbe - aproksymacja za pomoc¹ newrbe 
sc = 0.05; 
net1 = newrbe(P,T, sc);
y1 = sim(net1,x);
hold on;
figure, plot(P,T,'x',x,y1);
title('Aproksymacja funkcji za pomoca newrbe');
legend({'Target','Output'});
hold off;

% newgrnn - aproksymcja za pomoc¹ newgrnn
sc = 0.01; 
net2 = newgrnn(P,T,sc);
y2 = sim(net2,x); 
hold on;
figure, plot(P,T,'x',x,y2);
title('Aproksymacja funkcji za pomoca newgrnn');
legend({'Target','Output'});
hold off; 
