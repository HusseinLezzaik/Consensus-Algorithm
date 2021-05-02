function simulate(initial_pos, gain_matrix, target_gains, adj_m, type)
    % Function that takes control system parameters and plots the response
    % analysis
    %
    % Input:
    %    initial_pos: A 2n-vector of in the form of [x1 y1 x2 y2...] representing
    %                 initial positions of the robots.
    %    gain_matrix: A 2n-by-2n matrix representing the gains of
    %                 communication between each pair of robots. (n being
    %                 the number of robots in the system)
    %    target_gains: A 2n-vector representing gains associated with targets
    %    adj_m: adjacency matrix of the system. Ignored when type
    %           is "full" or "simplified"
    %    type: "full" for fully connected, "simplified for the simplified
    %          system.
    %
    % Output:
    %    no output. Plots the trajectoried of the robots, and the distances
    %    from origin vs time.
    %
    %
    
    n_robots = floor(size(initial_pos,1)/2);
    if type == "full"
        adj_matrix = ones(n_robots)-eye(n_robots);
        
    elseif type == "simplified"
        adj_matrix =[
                    zeros(1,n_robots-1),1;
                    eye(n_robots-1),zeros(n_robots-1,1)
                    ];
                
    else
            adj_matrix = adj_m;
    end
        
            

%     initial_pos = [0 8 -2 -4 3 -1 6 4 -4 7]';
%    gain_matrix = 2*ones(n_robots);
    
    A = zeros(2*n_robots);

    for i=1:2:2*n_robots
        s1 = 0;
        s2 = 0;
        for j=1:2:2*n_robots
            A(i,j) = A(i,j) + gain_matrix(floor((i+1)/2),floor((j+1)/2))*...
                adj_matrix(floor((i+1)/2),floor((j+1)/2));
            A(i+1,j+1) = A(i+1,j+1) + gain_matrix(floor(i/2+1),floor(j/2+1))*...
                adj_matrix(floor(i/2+1),floor(j/2+1));

            s1 = s1+gain_matrix(floor((i+1)/2),floor((j+1)/2))*...
                adj_matrix(floor((i+1)/2),floor((j+1)/2));
            s2 = s2+gain_matrix(floor(i/2+1),floor(j/2+1))*...
                adj_matrix(floor(i/2+1),floor(j/2+1));
        end
        A(i,i) = A(i,i) - s1 - target_gains(i);
        A(i+1,i+1) = A(i+1,i+1) - s2 - target_gains(i+1);

    end
    disp("The eigen values of the closed loop system:\n")
    disp(eig(A))
    tt = 0:0.001:5;
    [y,t,x] = initial(ss(A,zeros(2*n_robots,2)...
        ,eye(2*n_robots),zeros(2*n_robots,2)),initial_pos,tt);

    figure(1)
    hold on
    for i = 1:n_robots
        plot(t,sqrt(x(:,i).^2+x(:,i+1).^2))
    end
    legend("Robot_1", "Robot_2", "Robot_3", "Robot_4", "Robot_5")
    xlabel("Time (s)")
    ylabel("Distance to Origin")
    title(sprintf("Distances from Robots to Origin vs Time for kf = %d, k = %.2f",...
        target_gains(1),gain_matrix(1,1)))


    figure(2)
    hold on
    grid on
    for j=1:2:2*n_robots
        scatter(x(:,j),x(:,j+1),'.');
    end
    legend("Robot_1", "Robot_2", "Robot_3", "Robot_4", "Robot_5")
    xlabel("x-axis")
    ylabel("y-axis")
    title(sprintf("Trajectories of the Robots for kf = %d, k = %.2f",...
        target_gains(1),gain_matrix(1,1)))
end
