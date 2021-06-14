function matrix_smooth = meanmed_smooth(matrix, icethick, type)

matrix_smooth = nan(size(matrix));

        
for glac = 1:2
    if glac == 1
        fluxer = matrix; fluxer(:,109:end) = nan;
        fluxer_smooth = fluxer;
    else
        fluxer = matrix; fluxer(:,1:108) = nan;
        fluxer_smooth = fluxer; 
    end
    for i = 1:size(fluxer, 1)
        for j = 1:size(fluxer, 2)
            if isnan(fluxer(i, j))
                fluxer_smooth(i, j) = nan;
            else
                dist = round(icethick(i,j)/25);
                wind = max(0, dist);
                count = 0;
                list = [];
                for q = -wind:wind
                    for r = -wind:wind
                        if (i+q) >1 && (i+q) < 220 && (j+r) > 1 && (j+r) < 273
                            count = count + 1;
                            list(count) = fluxer(i + q, j + r);
                        end
                    end
                end
                if type == "median"
                    new_val = nanmedian(list);
                elseif type == "mean"
                    new_val = nanmean(list);
                end
                fluxer_smooth(i, j) = new_val;
            end
        end
        matrix_smooth(~isnan(fluxer_smooth)) = fluxer_smooth(~isnan(fluxer_smooth));

    end
end



