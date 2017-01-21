D_QL = np.array([4.01e-04, 6.91e-04, 1.80e-03, 2.53e-03, 3.21e-03])
D_NL = np.array([2.13e-04, 4.10E-04, 1.08E-03, 2.19E-03, 3.17e-03])
epsilon_QL = np.array([3.872e-3, 3.872e-3, 3.825e-3, 3.464e-3, 2.992e-3])
epsilon_NL = np.array([3.865e-3, 3.935e-3, 3.910e-3, 3.820e-3, 3.503e-3])
beta = 16*np.pi
kf = np.array([8, 16, 32, 64, 128])
D_unit_QL = epsilon_QL**0.6 * beta**-0.8
D_unit_NL = epsilon_NL**0.6 * beta**-0.8

k_beta_QL = (0.5*beta**0.6 * epsilon_QL**-0.2)
k_beta_NL = (0.5*beta**0.6 * epsilon_NL**-0.2)
PI_QL = k_beta_QL/kf
PI_NL = k_beta_NL/kf

plt.loglog(PI_QL, D_QL/D_unit_QL, '--o', label='QL')
plt.loglog(PI_NL, D_NL/D_unit_NL, '--o', label='NL')

x = np.linspace(0.1, 2.0, 20)
#plt.loglog(x, x**-2, '--k')
plt.legend(loc='best')
plt.ylabel(r'$D/(\beta^{-4/5}\epsilon^{3/5})$')
plt.show()