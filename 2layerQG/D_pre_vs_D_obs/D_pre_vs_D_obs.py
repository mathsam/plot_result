from scipy.stats import linregress

LR = 2*np.pi/500
beta_set = np.array([4523.26712689, 3957.85873603, 3518.09665425]).reshape(3,1)
epsilon = np.array(
   [[33.41, 26.42, 12.64, 1.50, 0.170],
    [44.85, 57.13, 17.63, 3.79, 0.499],
    [60.89, 97.82, 36.29, 8.86, 1.690]])
epsilon_bt = np.array(
      [[  1.99687969e+01,   9.91585179e+00,   4.64804764e+00,
          2.31185903e-01,   3.24456446e-02],
       [  2.93280117e+01,   2.56795706e+01,   5.65609020e+00,
          7.29148877e-01,   8.42058938e-02],
       [  4.26131479e+01,   4.91080170e+01,   1.33510054e+01,
          2.75639625e+00,   4.51729724e-01]])
enstrophy_bt = np.array(
      [[  6.32145000e+04,   2.08711536e+04,   1.00125731e+04,
         -4.86732158e+02,  -5.46240569e+01],
       [  9.36256274e+04,   6.37704358e+04,   8.77573038e+03,
          9.01461833e+02,   1.06304753e+02],
       [  1.39910121e+05,   1.26142697e+05,   3.00349379e+04,
          8.63132481e+03,   1.69010167e+03]])
D_obs = (epsilon*LR).flatten() #non-dimensional diffusivity
D_pre_ql   = (enstrophy_bt/beta_set**2/LR).flatten()
D_pre_zono = (epsilon_bt**0.6 * beta_set**-0.8 /LR).flatten()

a, b = linregress(np.log(D_pre_zono), np.log(D_obs))[:2]
zono_exp = a; zono_factor = np.exp(b)
mask = D_pre_ql>0
a, b = linregress(np.log(D_pre_ql[mask]), np.log(D_obs[mask]))[:2]
ql_exp = a; ql_factor = np.exp(b)

x = np.linspace(1e-2, 4, 10)

fig = plt.figure(figsize=(5,5))
ax = fig.add_subplot(111)
ax.scatter(D_pre_zono, D_obs.flatten(), c='b')
ax.plot(x, x**zono_exp * zono_factor, 'b', 
    label=r'$y=%.1fx^{%.1f}$' %(zono_factor, zono_exp))
ax.scatter(D_pre_ql,   D_obs.flatten(), c='r')
ax.plot(x, x**ql_exp * ql_factor, 'r', 
    label=r'$y=%.1fx^{%.1f}$' %(ql_factor, ql_exp))
ax.set_xscale('log')
ax.set_yscale('log')
ax.legend(loc='best')
ax.set_xlabel(r'$\tilde{D}_{pred}$')
ax.set_ylabel(r'$\tilde{D}_{obs}$')
plt.tight_layout()
plt.show()