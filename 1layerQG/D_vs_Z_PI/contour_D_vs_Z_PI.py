import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors, ticker, cm
import matplotlib
font = {'size'   : 16}
matplotlib.rc('font', **font)
fontsize1 = 16

D_dimensional = np.array([[1.62e-02, 5.85e-3, 1.49E-003, 4.10E-004, 2.70E-005, 3.565e-06],
                          [2.394e-2, 1.17e-2, 3.89E-003, 1.08E-003, 1.20E-004, 1.953e-05],
                          [2.486e-2, 1.68e-2, 6.62E-003, 2.19E-003, 3.38E-004, 4.717e-05],
                          [2.009e-2, 1.91e-2, 8.71E-003, 3.17e-03, 7.64e-04,    np.nan]])
epsilon = np.array([[2.526e-01, 6.309e-02, 1.576e-02, 3.935e-03, 4.920e-04, 6.15e-05],
                    [2.521e-01, 6.286e-02, 1.567e-02, 3.910e-03, 4.876e-04, 6.095e-05],
                    [2.489e-01, 6.179e-02, 1.535e-02, 3.820e-03, 4.618e-04, 5.773e-05],
                    [2.320e-01, 5.687e-02, 1.403e-02, 3.503e-03, 4.235e-04,    np.nan]])
kf = np.array([16, 32, 64, 128]).reshape(4,1)
drag = np.array([4096e-4, 1024e-4, 256e-4, 64e-4, 8e-4, 1e-4]).reshape((1,6))
#epsilon = (np.pi/4)**2 * drag
beta = 16*np.pi
#D_classic = np.tile(epsilon**0.6 * beta**-0.8, (4, 1))
D_classic = epsilon**0.6 * beta**-0.8
D_mine    = beta**-2 * kf**2 * epsilon
D_fplane = epsilon * drag**-2/72.6

#
Z = np.zeros((4, 6))
PI = np.zeros((4, 6))
for i in range(0, 4):
    for j in range(0, 6):
        Z[i,j] = 0.8*beta**0.1 * drag[0,j]**-0.25 * epsilon[i,j]**0.05
        PI[i,j] = kf[i,0]/(0.58*beta**0.6 * epsilon[i,j]**-0.2)
Z[np.isnan(D_dimensional)] = np.nan
PI[np.isnan(D_dimensional)] = np.nan
D_nondimensional = D_dimensional/D_classic#/f_PI(PI)

#
levs = np.power(10, np.linspace(-2, 1, 10))
plt.contourf(Z, PI, D_nondimensional, levs, norm=colors.LogNorm())
plt.colorbar()
plt.scatter(Z.flatten(), PI.flatten(),c='k')
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
plt.title(r'$D/(\varepsilon^{3/5}\beta^{-4/5})$',fontsize=fontsize1)
#
newax = plt.gcf().add_axes([0.45, 0.5, 0.3, 0.3], anchor='NE')
newax.contourf(Z, PI, D_nondimensional, levs, norm=colors.LogNorm())
newax.scatter(Z.flatten(), PI.flatten(),c='k')
newax.plot(x_diag, np.ones_like(x_diag), '--r', linewidth=1.5)
newax.set_xlim([0, 8])
newax.set_ylim([0, 2])
plt.gcf().set_size_inches(5, 5, forward=True)
plt.tight_layout()
plt.show()
##
legend_size = 10
markers = ['o','s','*','d','x','<']
fig = plt.figure()
ax = fig.add_subplot(111)
for i in range(0, Z.shape[1]):
    ax.plot(D_classic[:,i], D_dimensional[:,i],markers[i]+'b',
    label=r'$Z=%.2f$' %Z[0,i])
    ax.plot(D_classic[:,i]*f_PI(PI)[:,i], D_dimensional[:,i],markers[i]+'r')
ax.annotate(s=r'$\epsilon^{3/5}\beta^{-4/5}$',
            xy=(D_classic[0,3],D_dimensional[0,3]),color='b')
ax.annotate(s=r'$\epsilon^{3/5}\beta^{-4/5}$'+formula_tex,
            xy=((D_classic*f_PI(PI))[0,5],D_dimensional[0,5]),color='r')
x = np.linspace(1e-7, 0.05, 200)
ax.plot(x, x, '--', label='slope=1')
ax.set_xscale('log')
ax.set_yscale('log')
ax.set_xlabel('Prediction')
ax.set_ylabel('Experiment')
plt.legend(loc='best',fontsize=legend_size)
plt.show()
## fit nondimensional D's dependency on Pi 

formula_tex = r'$2.5(1+12\Pi^{-2})^{-1}$'
f_PI = lambda x: 2.5*(1+12*x**-2)**-1
#formula_tex = r'$2.1\tanh(0.65x)^2$'
#f_PI = lambda x: 2.1*np.tanh(0.65*x)**2
fig = plt.figure()
ax0 = fig.add_subplot(131)
for i in range(0, Z.shape[1]):
    ax0.plot(PI[:,i], (D_dimensional/D_classic)[:,i],markers[i],
    label=r'$Z=%.2f$' %Z[0,i])
x = np.linspace(0.04, 10, 200)
ax0.plot(x, f_PI(x), label=formula_tex)
ax0.legend(loc='lower right',fontsize=legend_size)
ax0.set_xlabel(r'$\Pi$')
ax0.set_ylabel(r'$D\epsilon^{-3/5}\beta^{4/5}$')
ax1 = fig.add_subplot(132)
for i in range(0, Z.shape[1]):
    ax1.plot(PI[:,i], (D_dimensional/D_classic)[:,i],markers[i])
x = np.linspace(0.04, 10, 200)
ax1.plot(x, f_PI(x), label=formula_tex)
ax1.legend(loc='lower right')
ax1.set_xlabel(r'$\Pi$')
ax1.set_xscale('log')
ax1.set_yscale('log')
ax1.legend(loc='lower right',fontsize=legend_size)
ax1.set_xlabel(r'$\Pi$')
ax1.set_ylabel(r'D$\epsilon^{-3/5}\beta^{4/5}$')
ax2 = fig.add_subplot(133)
for i in range(0, Z.shape[1]):
    ax2.plot(PI[:,i], (D_dimensional/D_classic/f_PI(PI))[:,i],markers[i])
#ax3.set_title(r'$D\epsilon^{-3/5}\beta^{4/5}$'+r'$\times$'+formula_tex)
#ax3.plot(PI.flatten(), (D_dimensional/D_classic).flatten(), 'o', label=r'D$\epsilon^{-3/5}\beta^{4/5}$')
ax2.set_ylabel('Ratio of simulation/pred')
ax2.set_xlabel(r'$\Pi$')
ax2.set_yscale('log')
ax2.set_xscale('log')
ax2.legend(loc='lower right',fontsize=legend_size)
plt.show()
##

f_PI_AB = lambda x, A, B: A*(1+B*x**-2)**-1
#f_PI_AB = lambda x, A, B: A*np.tanh(B*x)**2
A_set = np.linspace(1, 5, 200)
B_set = np.linspace(5, 20, 200)
residual_2d = np.zeros((A_set.size, B_set.size))
for i, a in enumerate(A_set):
    for j, b in enumerate(B_set):
        residual_2d[i,j] = np.nansum(
            np.abs(D_dimensional/D_classic/f_PI_AB(PI, a, b)-1))
#
plt.contourf(B_set, A_set, np.log(residual_2d))
plt.xlabel('B')
plt.ylabel('A')
plt.colorbar()
plt.show()