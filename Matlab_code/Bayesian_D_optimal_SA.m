function [global_best_X, global_best_D, total_time] = Bayesian_D_optimal_SA(cset, n_alt, nlevels, pts, wts, initial_temp, max_iter,annealing_cycles)

    start_time = tic;
   

    current_X = random_start(cset, n_alt, nlevels);
    current_X_code = transform_X(current_X, nlevels);
    current_D = calcObjFun_Bayesian(current_X_code, pts, wts, cset);
    global_best_X = current_X;
    global_best_D = current_D;
    temp = initial_temp;
    current_iter_start = 0;
    cycle = 0;
    total_iter = 0;
    while cycle <= annealing_cycles
        t = current_iter_start;
        while t <= max_iter
            total_iter = total_iter+1;
            new_X = random_modify_element(current_X, nlevels);
            new_X_code =transform_X(new_X, nlevels);
            new_D = calcObjFun_Bayesian(new_X_code, pts, wts, cset);
            prob = exp((new_D-current_D) / temp);

            if new_D >= current_D
               current_X = new_X;
               current_D = new_D;
            elseif rand() < prob
               current_X = new_X;
               current_D = new_D;
            end
            
            if current_D >  global_best_D
               global_best_X = current_X;
               global_best_D = current_D;
               current_time = toc(start_time);
               fprintf('cycle: %d,total_iter: %d,time: %f, DB_best: %f\n',cycle,total_iter, current_time,global_best_D);
            end

       
        t = t + 1;
        temp = initial_temp / t;
        end
    r = rand();
    current_iter_start = max_iter-max_iter / 10000 * 10^(2 + 2*r);
    cycle = cycle + 1;
    end
    total_time = toc(start_time);

end
