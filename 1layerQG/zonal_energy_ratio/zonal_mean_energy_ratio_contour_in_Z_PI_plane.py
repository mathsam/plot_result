import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, ticker, cm
import matplotlib
font = {'size'   : 16}
matplotlib.rc('font', **font)
fontsize1 = 16

zonal_energy_ratio = np.array(
    [[ 0.51643862,  0.50479556,  0.50178831,  0.50280935],
     [ 0.6434232 ,  0.57293582,  0.53934704,  0.50805254],
     [ 0.84817178,  0.80660581,  0.71988425,  0.69775664],
     [ 0.92805472,  0.92546661,  0.91492095,  0.8906016 ],
     [ 0.99095932,  0.98509412,  0.95216779,  0.95659625],
     [ 0.9945216 ,  0.9932349 ,  0.99577002,  np.nan    ]]).T
epsilon = np.array([[2.526e-01, 6.309e-02, 1.576e-02, 3.935e-03, 4.920e-04, 6.15e-05],
                    [2.521e-01, 6.286e-02, 1.567e-02, 3.910e-03, 4.876e-04, 6.095e-05],
                    [2.489e-01, 6.179e-02, 1.535e-02, 3.820e-03, 4.618e-04, 5.773e-05],
                    [2.320e-01, 5.687e-02, 1.403e-02, 3.503e-03, 4.235e-04,    np.nan]])
kf = np.array([16, 32, 64, 128]).reshape(4,1)
drag = np.array([4096e-4, 1024e-4, 256e-4, 64e-4, 8e-4, 1e-4]).reshape((1,6))
beta = 16*np.pi

jet_formation = np.array(
    [[False, True, True, True, True, True],
     [False, False, True, True, True, True],
     [False, False, True, True, True, True],
     [False, False,  True, True, True, True]])

#
Z = np.zeros((4, 6))
PI = np.zeros((4, 6))
for i in range(0, 4):
    for j in range(0, 6):
        Z[i,j] = 0.8*beta**0.1 * drag[0,j]**-0.25 * epsilon[i,j]**0.05
        PI[i,j] = kf[i,0]/(0.58*beta**0.6 * epsilon[i,j]**-0.2)
Z[np.isnan(zonal_energy_ratio)] = np.nan
PI[np.isnan(zonal_energy_ratio)] = np.nan
D_nondimensional = zonal_energy_ratio

#
levs = np.linspace(0.5, 1, 10) #np.power(10, np.linspace(-0.3, 2.5, 10))
plt.contourf(Z, PI, D_nondimensional, levs)
cbar = plt.colorbar(format='%.2f')
plt.scatter(Z[jet_formation].flatten(), PI[jet_formation].flatten(),c='k')
plt.scatter(Z[~jet_formation].flatten(), PI[~jet_formation].flatten(),c='gray',marker='<')
x_diag = np.linspace(0.1, 10, 100)
plt.plot(x_diag, 1/x_diag, '--k',linewidth=1.5)
plt.plot(x_diag, np.ones_like(x_diag), '--r', linewidth=1.5)
plt.xlim([0, 9])
plt.ylim([0, 19])
yticks_set = np.arange(0,19,1)
yticks_label = []
for y in yticks_set:
    if y%5 == 0:
        yticks_label.append(str(y))
    else:
        yticks_label.append('')
plt.yticks(np.arange(0,19,1), yticks_label)
plt.xlabel(r'$Z$',fontsize=fontsize1)
plt.ylabel(r"$\Pi$",fontsize=fontsize1)
#
newax = plt.gcf().add_axes([0.4, 0.5, 0.3, 0.3], anchor='NE')
newax.contourf(Z, PI, D_nondimensional, levs,)
newax.scatter(Z[jet_formation].flatten(), PI[jet_formation].flatten(),c='k')
newax.scatter(Z[~jet_formation].flatten(), PI[~jet_formation].flatten(),c='gray',marker='<')
newax.plot(x_diag, np.ones_like(x_diag), '--r', linewidth=1.5)
newax.set_xlim([1.3, 2.5])
newax.set_xticks([1.3, 1.6, 1.9, 2.2, 2.5])
newax.set_yticks([0, 4, 8, 12])
newax.set_ylim([0, 13])
plt.gcf().set_size_inches(5, 5, forward=True)
plt.tight_layout()
plt.show()