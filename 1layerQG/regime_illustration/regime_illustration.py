import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, ticker, cm
import matplotlib
font = {'size'   : 16}
matplotlib.rc('font', **font)
fontsize1 = 16

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
Z[np.isnan(epsilon)] = np.nan
PI[np.isnan(epsilon)] = np.nan

xs = np.linspace(0.1, 10, 1e3)
ys = np.linspace(0.1, 11, 1e3)
regime = np.zeros((ys.size, xs.size))
for i, x in enumerate(xs):
    for j, y in enumerate(ys):
        iso_boundary_left = 3.3/(1+(y/3.5)**-0.5)
        iso_boundary_right = 3.9/(1+(y/3.5)**-0.5)
        if x*y<1:
            regime[j,i] = np.nan
        elif x < iso_boundary_left:
            regime[j,i] = 1.0
        elif iso_boundary_left < x < iso_boundary_right:
            if y > 4:
                transit_to = 2.0
            elif 1<y<4:
                transit_to = 2.0 + (3.0-2.0)*(4-y)/(4-1)
            elif y<1:
                transit_to = 3.0
            regime[j,i] = 1.0 + (transit_to-1.0)*(
                x-iso_boundary_left)/(iso_boundary_right-iso_boundary_left)
        elif x > iso_boundary_right and y > 4:
            regime[j, i] = 2.0
        elif x > iso_boundary_right and y < 4 and y > 1:
            regime[j, i] = 2.0 + (3.0-2.0)*(4-y)/(4-1)
        elif x > iso_boundary_right and y < 1:
            regime[j, i] = 3.0
##        
plt.contourf(xs, ys, regime, 100, cmap=cm.ocean)
ax = plt.gca()

x_smallZ = np.linspace(1.4, 9.0, 20)
ax.fill_between(x_smallZ, 1/x_smallZ, np.ones_like(x_smallZ), color='none',
    hatch=r'/', edgecolor='gray', alpha=0.5)

x_staircase = np.linspace(7.0, 9.0, 10)
y_u = np.ones_like(x_staircase)*0.7
y_down = 1/x_staircase

ax.fill_between(x_staircase, y_down, y_u, color=(1.0, 0.6, 0.8), alpha=0.5)


plt.scatter(Z[jet_formation].flatten(), PI[jet_formation].flatten(),c='k')
plt.scatter(Z[~jet_formation].flatten(), PI[~jet_formation].flatten(),c='gray',marker='<')
x_diag = np.linspace(0.1, 10, 100)
plt.plot(x_diag, 1/x_diag, '--k',linewidth=1.5)
plt.plot(x_diag, np.ones_like(x_diag), '--r', linewidth=1.5)

plt.text(7.3, 0.2, 'PV Staircase', fontsize=10)
plt.text(5, 0.4, 'Quasi-linear', fontsize=12)
plt.text(3, 5, 'Zonostrophic', color='white', fontsize=14)
plt.text(0.35, 5.0, 'Isotropic',color='white', fontsize=14)

# y1 = np.linspace(0.7, 10, 30)
# ax = plt.gca()
# x_l = 3.4/(1+(x1/3.5)**(-2./4))
# x_r = 3.8/(1+(x1/3.5)**(-2./4))
# ax.fill_betweenx(y1, x_l, x_r, alpha=0.5, facecolor='gray')
# #plt.plot(3.8/(1+(x1/3.5)**(-2./4)), x1)




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
plt.xlim([0, 9])
plt.ylim([0, 10])

plt.gcf().set_size_inches(5, 5, forward=True)
plt.tight_layout()
plt.show()