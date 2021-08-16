# SMB from UAV
Model code to estimate the surface mass balance (SMB) of a glacier's ablation zone from UAV data and ice thickness. This repository contains and presents a method to determine the SMB in the entire ablation zone of two glaciers by combining UAV acquired 3D data and ice thickness measurements through the continuity-equation. Study area concerns Vadret da Morteratsch and Vadret Pers glaciers in the southeastern part of Switzerland (Engadin - Bernina - Graubünden). 


# The content belongs to the study:
Van Tricht, L., Huybrechts, P., Van Breedam, J., Vanhulle, A., Van Oost, K., and Zekollari, H.: Estimating surface mass balance patterns from UAV measurements on the ablation area of the Morteratsch-Pers glacier complex (Switzerland), The Cryosphere Discuss. [preprint], https://doi.org/10.5194/tc-2021-94, in review, 2021.

# Input data:
* Surface elevation changes
* Surface velocity
* Ice thickness

# Main equation:

-->  Bs=∂h/∂t+ ∇.q <--      (Continuity equation, reverted to obtain the mass balance) 

where:

  Bs = surface mass balance
  ∂h/∂t = surface elevation changes
  ∇.q = ice flux divergence 

In the ablation zone, all units are in metres of ice equivalent per year (m i.e. yr^-1)
If the method is applied to any other part of the glacier, specific attention has to be paid to the unit of each quantity in the continuity equation. 


# Structure
The model structure consists of the following elemennts:

a) Main script (MAIN.m):
All submodel codes are integrated in one main script (Main.m). This serves as the main model script and has to be run to obtain model results. 

b) Calculate velocities:
Surface velocities were calculated based on the Imgraft algorithm and are not added in this repository. For the model code of Imgraft, we refer to:
https://github.com/grinsted/ImGRAFT

c) Load input data:
The different input data which are required for the model are:
* Surface elevation changes (preferably from flow corrected DEMs)
* Surface velocities (from feature tracking)
* Ice thickness dataset

d) Calc_fluxdiv.m:
This function calculates the ice flux divergence. Hence, it is the main function to be applied in the model. 
Four options are available for filtering the gradients: 
* meanmed_smooth.m = filtering using a mean/median box filter
* exp_smooth.m = filtering using an exponential filter
* gaus_smooth.m = filtering using a gaussian filter

e) Calculate SMB:
Add the elevation differences and the calculated ice flux divergence to obtain an estimate of the surface mass balance

# Input datasets
The datasets of Vadret da Morteratsch and Vadret Pers can be requested via lander.van.tricht@vub.be
