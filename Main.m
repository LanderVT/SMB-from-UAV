
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            %% SMB FROM UAV %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This model calculates the ice flux divergence based on velocity and ice thickness
% data and infers the surface mass balance (SMB) via the continuity
% equation method.
                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code written by Lander Van Tricht @ University of Brussels
% Contact via lander.van.tricht@vub.be
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Formula: SMB = dh/dt + iceflux



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %% Clear all previous loadings %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all
clc
close all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   %% Calculate surface velocities %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Calc_velocities


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %% Load input data %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Load input data
icethick = ...
% Surface elevation changes:
dhdt = ...
% Surface velocity:
velx = ...
vely = ...


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                          %% Flux Divergence %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Additional settings:

% Ratio vertically averaged velocity
parameter_F = 0.9;      


%% OPTION 1: Raw flux divergence without applying any filter

[term1, term2, term3, term4, flux_div_raw] = calc_fluxdiv(icethick, -velx1920, -vely1920, parameter_F, 0,0,0,0);


%% OPTION 2: Flux divergence with a mean box filter

% Filter gradients
[term1, term2, term3, term4, flux_div_smo] = calc_fluxdiv(icethick, -velx1920, -vely1920, parameter_F, 2, 2, icethick, 1);
% Filter ensuing ice flux divergence
flux_div_smo = smooth_dhdt(flux_div_smo, icethick .* 2, 'mean');
% Conservation of mass
flux_div_smo = flux_div_smo ./ (nansum(nansum(flux_div_smo)) / nansum(nansum(flux_div_raw)));


%% OPTION 3: Gaussian filtering

% Filter gradients
[term1, term2, term3, term4, flux_div_smo] = calc_fluxdiv(icethick, -velx1920, -vely1920, parameter_F, 4, 4, icethick, 3);
% Filter ensuing ice flux divergence
flux_div_smo = gaus_smooth(flux_div_smo1, 25, 2 .* icethick, 100);
% Conservation of mass
flux_div_smo = flux_div_smo ./ (nansum(nansum(flux_div_smo)) / nansum(nansum(flux_div_raw)));


%% OPTION 4: Exponential filtering

% Filter gradients
[term1, term2, term3, term4, flux_div_smo] = calc_fluxdiv(icethick, -velx1920, -vely1920, parameter_F, 4, 4, icethick, 2);
% Filter ensuing ice flux divergence
flux_div_smo = exp_smooth(flux_div_smo, 25, 1, 1 .* icethick, 100);
% Conservation of mass
flux_div_smo = flux_div_smo ./ (nansum(nansum(flux_div_smo)) / nansum(nansum(flux_div_raw)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        %% Estimate of the SMB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
SMB = dhdt + flux_div;

% Show the result
imagesc(flux_div_smo);colormap(whitejet);shading flat;caxis([-5 5])
set(gca,  'fontsize', 20); title('Flux divergence (m i.e. yr^{-1})', 'fontsize', 30);

