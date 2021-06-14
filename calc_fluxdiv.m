
% Calculates ice flux divergence
% lander.van.tricht@vub.be
% @param icethick: Ice thickness 
% @param velx:  X-component of the surface velocity
% @param vely: Y-component of the surface velocity
% @param fparameter: Vertical average velocity parameter
% @param gradvel: Multiplicator for filtering velocity gradients
% @param gradice: Multiplicator for ice thickness gradients
% @param interpfield: Array containing the distance over there needs to be
% filtered (e.g. ice thickness(
% @param val: Parameter indicating which filter must be used
% @ret term1-4: Different terms contributing to the ice flux divergence
% @ret flux_div: The ice flux divergence

function [term1, term2, term3, term4, flux_div] = calc_fluxdiv(icethick, velx, vely, fparameter, gradvel, gradit, interpfield, val)


% Gradients
[it_x, it_y] = gradient(icethick, 25);
[vel_x1, vel_y1] = gradient(velx,25);
[vel_x2, vel_y2] = gradient(vely,25);

% Filter gradients
if val == 1
        % Mean or median is possible
        it_x = meanmed_smooth(it_x,interpfield, 'mean');
        it_y = meanmed_smooth(it_y, interpfield, 'mean');
        vel_x1 = meanmed_smooth(vel_x1, interpfield, 'mean');
        vel_y2 = meanmed_smooth(vel_y2, interpfield, 'mean');
elseif val == 2
    if gradit > 0
        it_x = exp_smooth(it_x, 25, gradit, interpfield, 100);
        it_y = exp_smooth(it_y, 25, gradit, interpfield, 100);
    end
    if gradvel > 0
        vel_x1 = exp_smooth(vel_x1, 25, gradvel, interpfield, 100);
        vel_y2 = exp_smooth(vel_y2, 25, gradvel, interpfield, 100);
    end
elseif val == 3
    if gradit > 0
        it_x = gaus_smooth(it_x, 25, gradit .* interpfield, 100);
        it_y = gaus_smooth(it_y, 25, gradit .* interpfield, 100);
    end
    if gradvel > 0
        vel_x1 = gaus_smooth(vel_x1, 25, gradvel .* interpfield, 100);
        vel_y2 = gaus_smooth(vel_y2, 25, gradvel .* interpfield, 100);
    end
end
term1 = fparameter.* velx .* it_x;
term2 = fparameter.* vely .* it_y;
term3 = fparameter.* icethick .* vel_x1;
term4 = fparameter.* icethick .* vel_y2;

flux_div = term1 + term2 + term3 + term4;

return 