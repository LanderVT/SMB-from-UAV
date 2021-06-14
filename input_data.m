

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                   %% LOAD INPUT DATA %%
                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code written by Lander Van Tricht @ University of Brussels
% Contact via lander.van.tricht@vub.be
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %% Location of files %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                    
%Location of all input files = "Input_Data"



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %% The origin %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                        
%The origin of the data we use is 789402, 145254 (dhdt1920)

%First number -> moving along y-axis, which is 145...
%Second number -> moving along x-axis, which is 789...



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Load DH/DT, the main product from the UAV %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
% 2019-2020
dhdt1920 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/dhdt1920_v2');
dhdt1920(dhdt1920<-50) = nan;
dhdt1920(dhdt1920>50) = nan;

% 2018-2019 
dhdt1819 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/dhdt1819_v2');
dhdt1819(dhdt1819<-50) = nan;
dhdt1819(dhdt1819>50) = nan;


% 2017-2018
dhdt1718 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/dhdt1718_v2');
dhdt1718(dhdt1718<-50) = nan;
dhdt1718(dhdt1718>50) = nan;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %% Load Ice thickness for the different years %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
% Langhammer dataset 2018 (THIL)
icethick_lang_2018 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_lang2018');
icethick_lang_2018(icethick_lang_2018 < -50) = nan;
icethick_lang_2018(icethick_lang_2018 < 5) = 5;

% Langhammer dataset 2019 (THIL)
icethick_lang_2019 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_lang2019');
icethick_lang_2019(icethick_lang_2019 < -50) = nan;
icethick_lang_2019(icethick_lang_2019 < 5) = 5;

% Langhammer dataset 2020 (THIL)
icethick_lang_2020 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_lang2020');
icethick_lang_2020(icethick_lang_2020 < -50) = nan;
icethick_lang_2020(icethick_lang_2020 < 5) = 5;

% Zekollari dataset 2018 (THIZ)
icethick_zeko_2018 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_zeko2018');
icethick_zeko_2018(icethick_zeko_2018 < -50) = nan;
icethick_zeko_2018(icethick_zeko_2018 < 5) = 5;

% Zekollari dataset 2019 (THIZ)
icethick_zeko_2019 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_zeko2019');
icethick_zeko_2019(icethick_zeko_2019 < -50) = nan;
icethick_zeko_2019(icethick_zeko_2019 < 5) = 5;

% Zekollari dataset 2020 (THIZ)
icethick_zeko_2020 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_zeko2020');
icethick_zeko_2020(icethick_zeko_2020 < -50) = nan;
icethick_zeko_2020(icethick_zeko_2020 < 5) = 5;

% Concensus dataset 2018
icethick_cons_2018 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_cons2018');
icethick_cons_2018(icethick_cons_2018 < -50) = nan;
icethick_cons_2018(icethick_cons_2018 < 5) = 5;

% Concensus dataset 2019 
icethick_cons_2019 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_cons2019');
icethick_cons_2019(icethick_cons_2019 < -50) = nan;
icethick_cons_2019(icethick_cons_2019 < 5) = 5;

% Concensus dataset 2020
icethick_cons_2020 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_cons2020');
icethick_cons_2020(icethick_cons_2020 < -50) = nan;
icethick_cons_2020(icethick_cons_2020 < 5) = 5;

% Icethick grabb
icethick_grabb_2020 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icethick_grabb2020');
icethick_grabb_2020(icethick_grabb_2020 < -50) = nan;
icethick_grabb_2020(icethick_grabb_2020 < 5) = 5;

% Average ice thickness (THIA)
icethick_aver_2018 = (icethick_zeko_2018 + icethick_lang_2018) / 2;
icethick_aver_2019 = (icethick_zeko_2019 + icethick_lang_2019) / 2;
icethick_aver_2020 = (icethick_zeko_2020 + icethick_lang_2020) / 2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %% Load velocity data %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 2017-2018
icevel1718 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icevel1718');
velx1718 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/velx1718');
vely1718 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/vely1718');
icevel1718(icevel1718 < -100) = nan;
icevel1718(icevel1718 > 150) = nan;
velx1718(velx1718 < -100) = nan;
velx1718(velx1718 > 150) = nan;
vely1718(vely1718 < -100) = nan;  
vely1718(vely1718 > 150) = nan;                
   
% 2018-2019
icevel1819 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icevel1819');
velx1819 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/velx1819');
vely1819 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/vely1819');
icevel1819(icevel1819 < -100) = nan;
icevel1819(icevel1819 > 150) = nan;
velx1819(velx1819 < -100) = nan;
velx1819(velx1819 > 150) = nan;
vely1819(vely1819 < -100) = nan;
vely1819(vely1819 > 150) = nan;                 
                                      
% 2019-2020
icevel1920 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/icevel1920');
velx1920 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/velx1920');
vely1920 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/vely1920');
icevel1920(icevel1920 < -100) = nan;
icevel1920(icevel1920 > 150) = nan;
velx1920(velx1920 > 150) = nan;
velx1920(velx1920 < -100) = nan;
vely1920(vely1920 > 150) = nan;
vely1920(vely1920 < -100) = nan;

% Apply slight smoothing (box method constant size of 5x5 centred
velx1920 = smooth_flux_tot(velx1920, 2, 'mean');
vely1920 = smooth_flux_tot(vely1920, 2, 'mean');
icevel1920 = smooth_flux_tot(icevel1920, 2, 'mean');
velx1819 = smooth_flux_tot(velx1819, 2, 'mean');
vely1819 = smooth_flux_tot(vely1819, 2, 'mean');
icevel1819 = smooth_flux_tot(icevel1819, 2, 'mean');
velx1718 = smooth_flux_tot(velx1718, 2, 'mean');
vely1718 = smooth_flux_tot(vely1718, 2, 'mean');
icevel1718 = smooth_flux_tot(icevel1718, 2, 'mean');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %% Grid coordinates (25x25 m) %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


                    
info = geotiffinfo('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/dhdt1920');
[x_as,y_as]=pixcenters(info);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                %% MASKS %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    

% 2017-2018
mask_2018 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/mask2018');
icevel1718(mask_2018 ~= 1) = nan;
velx1718(mask_2018 ~= 1) = nan;
vely1718(mask_2018 ~= 1) = nan;
dhdt1718(mask_2018 ~= 1) = nan;
icethick_lang_2018(mask_2018 ~= 1) = nan;
icethick_zeko_2018(mask_2018 ~= 1) = nan;
icethick_aver_2018(mask_2018 ~= 1) = nan;

% 2018-2019
mask_2019 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/mask2019');
icevel1819(mask_2019 ~= 1) = nan;
velx1819(mask_2019 ~= 1) = nan;
vely1819(mask_2019 ~= 1) = nan;
dhdt1819(mask_2019 ~= 1) = nan;
icethick_lang_2019(mask_2019 ~= 1) = nan;
icethick_zeko_2019(mask_2019 ~= 1) = nan;
icethick_aver_2019(mask_2019 ~= 1) = nan;

% 2019-2020
mask_2020 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/mask2020');
icevel1920(mask_2020 ~= 1) = nan;
velx1920(mask_2020 ~= 1) = nan;
vely1920(mask_2020 ~= 1) = nan;
dhdt1920(mask_2020 ~= 1) = nan;
icethick_lang_2020(mask_2020 ~= 1) = nan;
icethick_zeko_2020(mask_2020 ~= 1) = nan;
icethick_aver_2020(mask_2020 ~= 1) = nan;
icethick_grabb_2020(mask_2020 ~= 1) = nan;

%% DEMS
dem_2020 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/dem2020_25m.tif');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                %% MASKS %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


SMB = xlsread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/stakes/Stakes/stakes17-20.xlsx');                      



%% 7: Surface DEM

DEM2020 = geotiffread('/Users/landervantricht/Documents/Documenten/PHD/Morteratsch/SMB_from_UAV/Input_data/dem2020_25m');
% Adjust for origin -> look in QGIS how much the ofset is
% DEM2020(:, 1:end-1) = DEM2020(:, 2:end);  %ofset X = 25 m
% DEM2020(DEM2020 < 0) = nan;




