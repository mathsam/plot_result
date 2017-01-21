import matplotlib.pyplot as plt
import matplotlib
import numpy as np
font = {'size'   : 13}
matplotlib.rc('font', **font)
linewidth1 = 1.3
linewidth2 = 0.9
fontsize1 = 14
fontsize2 = 12
fontsize3 = 12


LR = 2*np.pi/500
Sc = np.array([1.4, 1.6, 1.8])
drag = np.array([5e-1, 5e-2, 5e-3, 5e-4, 5e-5]) #non-dimensional drag
# epsilon is energy dissipation by friction
epsilon = np.array(
   [[33.41, 26.42, 12.64, 1.50, 0.170],
    [44.85, 57.13, 17.63, 3.79, 0.499],
    [60.89, 97.82, 36.29, 8.86, 1.690]])*LR

for i, i_Sc in enumerate(Sc):
    plt.loglog(drag, epsilon[i,:],'-o', label=r'$\xi=%.1f$' %i_Sc,
    linewidth=linewidth1)

plt.loglog(drag[1:], 400*drag[1:], '--k', linewidth=1, 
    label=r'$\tilde{\varepsilon}\propto\tilde{r}$')
plt.loglog(drag[:3], 0.7*(drag**0.5)[:3], '-.k', linewidth=linewidth2, 
    label=r'$\tilde{\varepsilon}\propto\tilde{r}^{1/2}$')
plt.legend(loc='best', frameon=False, fontsize=fontsize2)
plt.xlabel(r'$\tilde{r}$')
plt.ylabel(r'$\tilde{D}$')
plt.ylim(1e-3, 1e1)
plt.gcf().set_size_inches(5, 5, forward=True)
plt.tight_layout()
plt.show()