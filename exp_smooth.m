% Performs an exponential smoothing on an input array. 
% @param array:     The input array to be smoothed
% @param res:       The resolution of the input array (e.g. 25 m)
% @param length_sc: The length scaling to perform the smoothing with
% @param length (optional): Cell-specific smoothing length (same unit as res). 
%                           If not provided then 1 everywhere.
% @param dis (optional):    determines the maximum distance in cell index 
%                           (normalized by smoothing length/res) to be used for smoothing.
%                           higher = better but slower. Should be at least 2 for decent results.
%                           If not provided then 5.
% @ret smoothed:    A smoothed version of the input array
function [smoothed] = exp_smooth(fluxer, res, length_sc, length, dis)
% Checking the input parameters, the first 3 parameters are obligatory
% If no cell specific length is provided, then a smoothing will be performed using a
% uniform smoothing length.
% If no dis is provided then we set a smoothing distance of 5.
if nargin < 3
    disp('Not enough function parameters set')
    return
else
    if nargin < 4
        length = ones(size(fluxer));
    end
    if nargin < 5
        dis = 5;
    end
end

% Initialize smoothed array to NaN
[nx,ny] = size(fluxer);
smoothed = zeros(nx,ny) * NaN;

for glac = 1:2
    if glac == 1
        array = fluxer; array(:,109:end) = nan;
    else
        array = fluxer; array(:,1:108) = nan;
    end
    
    for i=1:nx
        for j=1:ny
            % Skip if NaN
            if isnan(array(i,j))
                continue
            end
            tot = 0.0;
            tot_weight = 0.0;
        
            % Calculate cell-specific smth_len    
            smth_len = length(i,j)*length_sc;
        
            % Iterate over surrounding cells
            for k=ceil(max(1,i-dis*smth_len/res)):floor(min(nx,i+dis*smth_len/res))
                for l=ceil(max(1,j-dis*smth_len/res)):floor(min(ny,j+dis*smth_len/res))
                    % Skip if NaN
                    if isnan(array(k,l))
                        continue 
                    end
                    % Calculate the weight
                    weight = exp(-(sqrt((i-k)^2+(j-l)^2))/(smth_len/res));
                    % Add value multiplied by weight to total
                    tot = tot + weight*array(k,l);
                    % Add weight to total weight
                    tot_weight = tot_weight + weight;
                end
            end
            % If the weight is more than 0, determine the value. 
            if tot_weight > 0
                smoothed(i,j) = tot/tot_weight;
            end
        end
    end
end
end

