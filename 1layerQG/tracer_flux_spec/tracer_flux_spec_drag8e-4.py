import qg_transform
from diag import inverse_centroid, centroid
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
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf128_drag8e-4/tflux_spec')
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf128_drag8e-4/Ek')
k_eddy = centroid(k, EKEk)
Pi = PI_set[-1]
eps = epsilon[-1]
kf = kfs[-1]
eta = eps*kf**2
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)

ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, tflux_spec, 'k',linewidth=linewidth1)
ax.plot([k_epsilon, k_epsilon], 
        [tflux_spec[np.floor(k_epsilon)]*3, tflux_spec[np.floor(k_epsilon)]/10],
        '--k', linewidth=linewidth2)
ax.text(k_epsilon, tflux_spec[np.floor(k_epsilon)]/15, r'$k_\varepsilon$')
# ax.plot([k_eta, k_eta], 
#         [EKEk[np.floor(k_eta)]*4, EKEk[np.floor(k_eta)]/40],
#         '--k', linewidth=linewidth2)
# ax.text(k_eta, EKEk[np.floor(k_eta)]/60, r'$k_\eta$')
ax.plot([kf, kf], [tflux_spec[kf-1]*3, tflux_spec[kf-1]/10], '--k', linewidth=linewidth2)
ax.text(kf, tflux_spec[kf-1]/15, r'$k_f$')
ax.plot([k_eddy, k_eddy], 
        [np.abs(tflux_spec[np.floor(k_eddy)]*3), np.abs(tflux_spec[np.floor(k_eddy)]/10)],
        '--k', linewidth=linewidth2)
ax.text(k_eddy, np.abs(tflux_spec[np.floor(k_eddy)]/15), r'$k_E$')
ax.set_ylabel(r'$F_S(k)$')
ax.set_ylim([1e-14, 1e-4])
ax.yaxis.set_ticks(np.power(10.0, np.arange(-13, -3, 2)))
ax.xaxis.set_ticklabels([])
ax.set_xlim(1, 511)
ax.legend(loc='best',frameon=False,fontsize=fontsize3)

#
#------------------------ kf = 64 -------------------------
ax = fig.add_subplot(2,2,2)
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf64_drag8e-4/tflux_spec')
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf128_drag8e-4/Ek')
k_eddy = centroid(k, EKEk)
Pi = PI_set[-2]
eps = epsilon[-2]
kf = kfs[-2]
eta = eps*kf**2

k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)

ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, tflux_spec, 'k',linewidth=linewidth1)
ax.plot([k_epsilon, k_epsilon], 
        [tflux_spec[np.floor(k_epsilon)]*3, tflux_spec[np.floor(k_epsilon)]/10],
        '--k', linewidth=linewidth2)
ax.text(k_epsilon, tflux_spec[np.floor(k_epsilon)]/15, r'$k_\varepsilon$')
# ax.plot([k_eta, k_eta], 
#         [EKEk[np.floor(k_eta)]*4, EKEk[np.floor(k_eta)]/40],
#         '--k', linewidth=linewidth2)
# ax.text(k_eta, EKEk[np.floor(k_eta)]/60, r'$k_\eta$')
ax.plot([kf, kf], [tflux_spec[kf-1]*3, tflux_spec[kf-1]/10], '--k', linewidth=linewidth2)
ax.text(kf, tflux_spec[kf-1]/15, r'$k_f$')
ax.plot([k_eddy, k_eddy], 
        [np.abs(tflux_spec[np.floor(k_eddy)]*3), np.abs(tflux_spec[np.floor(k_eddy)]/10)],
        '--k', linewidth=linewidth2)
ax.text(k_eddy, np.abs(tflux_spec[np.floor(k_eddy)]/15), r'$k_E$')
#ax.set_ylabel(r'$F_S(k)$')
ax.set_ylim([1e-14, 1e-4])
ax.yaxis.set_ticks(np.power(10.0, np.arange(-13, -3, 2)))
ax.yaxis.set_ticklabels([])
ax.xaxis.set_ticklabels([])
ax.set_xlim(1, 511)
ax.legend(loc='best',frameon=False,fontsize=fontsize3)

#
#
#------------------------- kf = 32 ----------------------
ax = fig.add_subplot(2,2,3)
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf32_drag8e-4/tflux_spec')
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf128_drag8e-4/Ek')
k_eddy = centroid(k, EKEk)
Pi = PI_set[-3]
eps = epsilon[-3]
kf = kfs[-3]
eta = eps*kf**2

k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, tflux_spec, 'k',linewidth=linewidth1)
ax.plot([k_epsilon, k_epsilon], 
        [tflux_spec[np.floor(k_epsilon)]*10, tflux_spec[np.floor(k_epsilon)]/3],
        '--k', linewidth=linewidth2)
ax.text(k_epsilon, tflux_spec[np.floor(k_epsilon)]*15, r'$k_\varepsilon$')
# ax.plot([k_eta, k_eta], 
#         [EKEk[np.floor(k_eta)]*4, EKEk[np.floor(k_eta)]/40],
#         '--k', linewidth=linewidth2)
# ax.text(k_eta, EKEk[np.floor(k_eta)]/60, r'$k_\eta$')
ax.plot([kf, kf], [tflux_spec[kf-1]*3, tflux_spec[kf-1]/10], '--k', linewidth=linewidth2)
ax.text(kf, tflux_spec[kf-1]/15, r'$k_f$')
ax.plot([k_eddy, k_eddy], 
        [tflux_spec[np.floor(k_eddy)]*2, tflux_spec[np.floor(k_eddy)]/100],
        '--k', linewidth=linewidth2)
ax.text(k_eddy, tflux_spec[np.floor(k_eddy)]/150, r'$k_E$')
ax.set_ylabel(r'$F_S(k)$')
ax.set_ylim([1e-14, 1e-4])
ax.yaxis.set_ticks(np.power(10.0, np.arange(-13, -3, 2)))
#ax.yaxis.set_ticklabels([])
# ax.xaxis.set_ticklabels([])
ax.set_xlim(1, 511)
ax.legend(loc='best',frameon=False,fontsize=fontsize3)


#
#------------------------ kf = 16 -------------------------
ax = fig.add_subplot(2,2,4)
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf16_drag8e-4/tflux_spec')
mlab.load('/home/j1c/analysis/2015/qg_model/Dec12_kf128_drag8e-4/Ek')
k_eddy = centroid(k, EKEk)
Pi = PI_set[-4]
eps = epsilon[-4]
kf = kfs[-4]
eta = eps*kf**2

k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.loglog(k, tflux_spec, 'k',linewidth=linewidth1)
# ax.plot([k_epsilon, k_epsilon], 
#         [tflux_spec[np.floor(k_epsilon)]*3, tflux_spec[np.floor(k_epsilon)]/10],
#         '--k', linewidth=linewidth2)
# ax.text(k_epsilon, tflux_spec[np.floor(k_epsilon)]/15, r'$k_\varepsilon$')
ax.plot([k_eta, k_eta], 
        [4e-7, 0.5e-9],
        '--k', linewidth=linewidth2)
ax.text(k_eta, 0.2e-9, r'$k_\eta$')
ax.plot([kf, kf], [6e-6, 1e-8], '--k', linewidth=linewidth2)
ax.text(kf, 0.5e-8, r'$k_f$')
ax.plot([k_eddy, k_eddy], 
        [6e-6, 1e-8],
        '--k', linewidth=linewidth2)
ax.text(k_eddy, 0.5e-8, r'$k_E$')
#ax.set_ylabel(r'$F_S(k)$')
ax.set_ylim([1e-14, 1e-4])
ax.yaxis.set_ticks(np.power(10.0, np.arange(-13, -3, 2)))
ax.yaxis.set_ticklabels([])
# ax.xaxis.set_ticklabels([])
ax.set_xlim(1, 511)
ax.legend(loc='best',frameon=False,fontsize=fontsize3)


fig.subplots_adjust(wspace=0.05, hspace=0.13)
plt.show()