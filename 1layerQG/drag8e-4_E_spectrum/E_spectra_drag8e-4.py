import qg_transform
import nc_tools
import matplotlib.pyplot as plt
import numpy as np
import matlab_style as mlab
import matplotlib
font = {'size'   : 12}

matplotlib.rc('font', **font)

C_Komogorov = 6.0
C_Komogorov_ens = 1.6
C_beta = 0.5
beta = 16*np.pi
linewidth1 = 1.3
linewidth2 = 0.9
fontsize1 = 14
fontsize2 = 12
fontsize3 = 12

epsilon =  np.array([4.920e-04, 4.876e-04, 4.618e-04, 4.235e-04])
kfs = np.array([16., 32., 64., 128.])
PI_set = [ 0.57322233,  1.14438672,  2.2640231 ,  4.45031494]

fig = plt.figure(figsize=[8, 8])

#--------------------------- kf = 128 ------------------------
ax = fig.add_subplot(2,2,1)
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf128_drag8e-4/Ek')
Pi = PI_set[-1]
eps = epsilon[-1]
kf = kfs[-1]
eta = eps*kf**2
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, Ek, 'k', label=r'$\mathcal{E}(k)$',linewidth=linewidth1)
ax.loglog(k, Ek-EKEk, ':k', label='$\mathcal{E_Z}(k)$',linewidth=linewidth2)
ax.loglog(k, EKEk, 'k', label='$\mathcal{E}_{eddy}(k)$',linewidth=linewidth2)
x_epsilon  = np.arange(4,kf)
x_eta = np.arange(kf, 200)
x_s   = np.arange(4, 30)
p5  = C_beta*beta**2*x_s**(-5.0)
p53 = C_Komogorov*eps**(2./3)*x_epsilon**(-5.0/3.0)
p3 = C_Komogorov_ens*eta**(2./3)*x_eta**(-3.0)
#p4  = Ek[most_energetic_k]*x**(-4.0)/(x[most_energetic_k]**(-4.0))/100.0
ax.loglog(x_s, p5, '--g', label=r'$C_Z\beta^2k^{-5}$', linewidth=linewidth2)
ax.loglog(x_epsilon, p53, '--r', label=r'$\mathcal{C_K}\varepsilon^{2/3}k^{-5/3}$', linewidth=linewidth2)
ax.loglog(x_eta, p3, '--b', label=r"$\mathcal{C_K'}\eta^{2/3}k^{-3}$", linewidth=linewidth2)
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.plot([k_epsilon, k_epsilon], 
        [EKEk[np.floor(k_epsilon)]*10, EKEk[np.floor(k_epsilon)]/10],
        '--k', linewidth=linewidth2)
ax.text(k_epsilon, EKEk[np.floor(k_epsilon)]*40, r'$k_\varepsilon$')
# ax.plot([k_eta, k_eta], 
#         [EKEk[np.floor(k_eta)]*4, EKEk[np.floor(k_eta)]/40],
#         '--k', linewidth=linewidth2)
# ax.text(k_eta, EKEk[np.floor(k_eta)]/60, r'$k_\eta$')
ax.plot([kf, kf], [EKEk[kf-1]*10, EKEk[kf-1]/10], '--k', linewidth=linewidth2)
ax.text(kf, EKEk[kf-1]*40, r'$k_f$')
ax.set_ylabel(r'$\mathcal{E}(k)$')
ax.yaxis.set_ticks(np.power(10.0, np.arange(-12, 1, 3)))
ax.xaxis.set_ticklabels([])
ax.set_xlim(1, 511)
ax.set_ylim(5e-13, 2e-1)
ax.legend(loc='best',frameon=False,fontsize=fontsize3)


#------------------------ kf = 64 -------------------------
ax = fig.add_subplot(2,2,2)
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf64_drag8e-4/Ek')
Pi = PI_set[-2]
eps = epsilon[-2]
kf = kfs[-2]
eta = eps*kf**2
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, Ek, 'k', label=r'$KE$',linewidth=linewidth1)
ax.loglog(k, Ek-EKEk, ':k', label='$ZKE$',linewidth=linewidth2)
ax.loglog(k, EKEk, 'k', label='$EKE$',linewidth=linewidth2)
x_epsilon  = np.arange(4,kf)
x_eta = np.arange(kf, 200)
x_s   = np.arange(4, 30)
p5  = C_beta*beta**2*x_s**(-5.0)
p53 = C_Komogorov*eps**(2./3)*x_epsilon**(-5.0/3.0)
p3 = C_Komogorov_ens*eta**(2./3)*x_eta**(-3.0)
#p4  = Ek[most_energetic_k]*x**(-4.0)/(x[most_energetic_k]**(-4.0))/100.0
ax.loglog(x_s, p5, '--g', label=r'$C_Z\beta^2k^{-5}$', linewidth=linewidth2)
ax.loglog(x_epsilon, p53, '--r', label=r'$\mathcal{C_K}\varepsilon^{2/3}k^{-5/3}$', linewidth=linewidth2)
ax.loglog(x_eta, p3, '--b', label=r"$\mathcal{C_K'}\eta^{2/3}k^{-3}$", linewidth=linewidth2)
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.plot([k_epsilon, k_epsilon], 
        [EKEk[np.floor(k_epsilon)]*10, EKEk[np.floor(k_epsilon)]/10],
        '--k', linewidth=linewidth2)
ax.text(k_epsilon, EKEk[np.floor(k_epsilon)]*40, r'$k_\varepsilon$')
# ax.plot([k_eta, k_eta], 
#         [EKEk[np.floor(k_eta)]*4, EKEk[np.floor(k_eta)]/40],
#         '--k', linewidth=linewidth2)
# ax.text(k_eta, EKEk[np.floor(k_eta)]/60, r'$k_\eta$')
ax.plot([kf, kf], [EKEk[kf-1]*10, EKEk[kf-1]/10], '--k', linewidth=linewidth2)
ax.text(kf, EKEk[kf-1]*40, r'$k_f$')
# ax.set_ylabel(r'$\mathcal{E}(k)$')
ax.yaxis.set_ticks(np.power(10.0, np.arange(-12, 1, 3)))
ax.yaxis.set_ticklabels([])
ax.xaxis.set_ticklabels([])
ax.set_xlim(1, 511)
ax.set_ylim(5e-13, 2e-1)
#ax.legend(loc='best',frameon=False,fontsize=fontsize3)


#------------------------- kf = 32 ----------------------
ax = fig.add_subplot(2,2,3)
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf32_drag8e-4/Ek')
Pi = PI_set[-3]
eps = epsilon[-3]
kf = kfs[-3]
eta = eps*kf**2
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, Ek, 'k',linewidth=linewidth1)
ax.loglog(k, Ek-EKEk, ':k',linewidth=linewidth2)
ax.loglog(k, EKEk, 'k',linewidth=linewidth2)
x_epsilon  = np.arange(4,kf)
x_eta = np.arange(kf, 200)
x_s   = np.arange(4, 30)
p5  = C_beta*beta**2*x_s**(-5.0)
p53 = C_Komogorov*eps**(2./3)*x_epsilon**(-5.0/3.0)
p3 = C_Komogorov_ens*eta**(2./3)*x_eta**(-3.0)
#p4  = Ek[most_energetic_k]*x**(-4.0)/(x[most_energetic_k]**(-4.0))/100.0
ax.loglog(x_s, p5, '--g', label=r'$C_Z\beta^2k^{-5}$', linewidth=linewidth2)
ax.loglog(x_epsilon, p53, '--r', label=r'$\mathcal{C_K}\varepsilon^{2/3}k^{-5/3}$', linewidth=linewidth2)
ax.loglog(x_eta, p3, '--b', label=r"$\mathcal{C_K'}\eta^{2/3}k^{-3}$", linewidth=linewidth2)
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.plot([k_epsilon, k_epsilon], 
        [EKEk[np.floor(k_epsilon)]*10, EKEk[np.floor(k_epsilon)]/10],
        '--k', linewidth=linewidth2)
ax.text(k_epsilon, EKEk[np.floor(k_epsilon)]*40, r'$k_\varepsilon$')
# ax.plot([k_eta, k_eta], 
#         [EKEk[np.floor(k_eta)]*4, EKEk[np.floor(k_eta)]/40],
#         '--k', linewidth=linewidth2)
# ax.text(k_eta, EKEk[np.floor(k_eta)]/60, r'$k_\eta$')
ax.plot([kf, kf], [EKEk[kf-1]*10, EKEk[kf-1]/10], '--k', linewidth=linewidth2)
ax.text(kf, EKEk[kf-1]*40, r'$k_f$')
ax.set_ylabel(r'$\mathcal{E}(k)$')
ax.set_xlabel(r'$k$')
ax.yaxis.set_ticks(np.power(10.0, np.arange(-12, 1, 3)))
ax.set_xlim(1, 511)
ax.set_ylim(5e-13, 2e-1)


#------------------------ kf = 16 -------------------------
ax = fig.add_subplot(2,2,4)
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf16_drag8e-4/Ek')
Pi = PI_set[-4]
eps = epsilon[-4]
kf = kfs[-4]
eta = eps*kf**2
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, Ek, 'k', label=r'$KE$',linewidth=linewidth1)
ax.loglog(k, Ek-EKEk, ':k', label='$ZKE$',linewidth=linewidth2)
ax.loglog(k, EKEk, 'k', label='$EKE$',linewidth=linewidth2)
x_epsilon  = np.arange(4,kf)
x_eta = np.arange(kf, 200)
x_s   = np.arange(4, 30)
p5  = C_beta*beta**2*x_s**(-5.0)
p53 = C_Komogorov*eps**(2./3)*x_epsilon**(-5.0/3.0)
p3 = C_Komogorov_ens*eta**(2./3)*x_eta**(-3.0)
#p4  = Ek[most_energetic_k]*x**(-4.0)/(x[most_energetic_k]**(-4.0))/100.0
ax.loglog(x_s, p5, '--g', label=r'$C_Z\beta^2k^{-5}$', linewidth=linewidth2)
ax.loglog(x_epsilon, p53, '--r', label=r'$\mathcal{C_K}\varepsilon^{2/3}k^{-5/3}$', linewidth=linewidth2)
ax.loglog(x_eta, p3, '--b', label=r"$\mathcal{C_K'}\eta^{2/3}k^{-3}$", linewidth=linewidth2)
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
# ax.plot([k_epsilon, k_epsilon], 
#         [EKEk[np.floor(k_epsilon)]*4, EKEk[np.floor(k_epsilon)]/40],
#         '--k', linewidth=linewidth2)
# ax.text(k_epsilon, EKEk[np.floor(k_epsilon)]/60, r'$k_\varepsilon$')
ax.plot([k_eta, k_eta], 
        [EKEk[np.floor(k_eta)]*10, EKEk[np.floor(k_eta)]/10],
        '--k', linewidth=linewidth2)
ax.text(k_eta, EKEk[np.floor(k_eta)]*40, r'$k_{\eta}$')
ax.plot([kf, kf], [EKEk[kf-1]*10, EKEk[kf-1]/10], '--k', linewidth=linewidth2)
ax.text(kf, EKEk[kf-1]*40, r'$k_f$')
# ax.set_ylabel(r'$\mathcal{E}(k)$')
ax.yaxis.set_ticks(np.power(10.0, np.arange(-12, 1, 3)))
ax.yaxis.set_ticklabels([])
ax.set_xlim(1, 511)
ax.set_ylim(5e-13, 2e-1)
ax.set_xlabel(r'$k$')
#ax.legend(loc='best',frameon=False,fontsize=fontsize3)

fig.subplots_adjust(wspace=0.05, hspace=0.13)
plt.show()