import matplotlib
font = {'size'   : 13}
matplotlib.rc('font', **font)
linewidth1 = 1.3
linewidth2 = 0.9
fontsize1 = 14
fontsize2 = 12
fontsize3 = 12


LR = 2*np.pi/500
Sc = np.array([1.4, 1.6, 1.8])
beta_set = np.array([4523.26712689, 3957.85873603, 3518.09665425]).reshape(3,1)
drag_set = 1/LR*np.array([5e-1, 5e-2, 5e-3, 5e-4, 5e-5]).reshape(1,5)
drag  = np.array([5e-1, 5e-2, 5e-3, 5e-4, 5e-5])
epsilon = np.array(
   [[33.41, 26.42, 12.64, 1.50, 0.170],
    [44.85, 57.13, 17.63, 3.79, 0.499],
    [60.89, 97.82, 36.29, 8.86, 1.690]])
kf = np.array(
    [[ 56.2642331 ,  45.87839473,  46.41277811,    np.nan,
         np.nan],
       [ 56.50099033,  49.8328601 ,  39.3897725 ,  35.16135203,
         35.53080903],
       [ 57.29975399,  50.68212986,  47.43035589,  55.95873713,
         61.16698602]])

k_epsilon = 0.6*beta_set**0.6*epsilon**-0.2
Z  = 0.85*beta_set**0.1*epsilon**0.05*drag_set**-0.25
PI = kf/k_epsilon

plt.figure(figsize=(8,4))
plt.subplot(121)
for i, i_Sc in enumerate(Sc):
    plt.semilogx(drag, Z[i,:],'-o', label=r'$\xi=%.1f$' %i_Sc,
    linewidth=linewidth1)

plt.legend(loc='best', frameon=False, fontsize=fontsize2)
plt.xlabel(r'$\tilde{r}$')
plt.ylabel(r'$Z$')

plt.subplot(122)
for i, i_Sc in enumerate(Sc):
    plt.semilogx(drag, PI[i,:],'-o', label=r'$\xi=%.1f$' %i_Sc,
    linewidth=linewidth1)

plt.legend(loc='best', frameon=False, fontsize=fontsize2)
plt.xlabel(r'$\tilde{r}$')
plt.ylabel(r'$\Pi$')

plt.tight_layout()
#plt.gcf().set_size_inches(8, 4, forward=True)

plt.show()