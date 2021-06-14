# SMB from UAV
Model code to estimate the surface mass balance (SMB) of a glacier's ablation zone from UAV data and ice thickness. This repository contains and presents a method to determine the SMB in the entire ablation zone of two glaciers by combining UAV acquired 3D data and ice thickness measurements through the continuity-equation.
Study area concerns Vadret da Morteratsch and Vadret Pers glaciers in the southeastern part of Switzerland (Engadin - Bernina - Graubünden). 


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
