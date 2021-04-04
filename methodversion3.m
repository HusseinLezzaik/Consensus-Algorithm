clear all
clc
%%Initial position of the 5 robots:
Init = [ 0, 4; 0,2; 0,0; 0, -2; 0,-4];
%%Adjacency matrix,All robots communicate with next robots
A =[ 0, 1,0,0,0;
       0,0,1,0,0;
       0,0,0,1,0;
       0,0,0,0,1;
       1,0,0,0,0];
   figure(1)
%Connections between robots   
   gplot(A,Init);
   
x=[0,0,0,0,0,0];
y=[4,2,0,-2,-4,0];
a=[x(1),y(1)];
b=[x(2),y(2)];
c=[x(3),y(3)];
d=[x(4);y(4)];
e=[x(5),y(5)];

figure (1)
plot(x(1),y(1), 'O')
hold on
plot(x(2),y(2), 'O')
plot(x(3),y(3), 'O')
plot(x(4),y(4), 'O')
plot(x(5),y(5), 'O')
axis([-20 20 -20 20])
legend('robot1','robot2','robot3','robot4','robot5')
grid on

%Directed Graph
A =[ 0, 1,0,0,0;
       0,0,1,0,0;
       0,0,0,1,0;
       0,0,0,0,1;
       1,0,0,0,0];
Robots = {'robot1' 'robot2' 'robot3' 'robot4' 'robot5'};
G=digraph(A,Robots);
figure(2)
plot(G)
grid O
