import numpy as np
import matlab_style as ml
import sys
sys.path.append('/home/j1c/py/lib')
import qg_transform
import matplotlib.pyplot as plt
import matplotlib
font = {'size'   : 13}
matplotlib.rc('font', **font)

linewidth1 = 1.3
linewidth2 = 0.9
fontsize1 = 14
fontsize2 = 12
fontsize3 = 12

filename_set = ['Dec12_kf16_drag8e-4', 
                'Dec12_kf32_drag8e-4',
                'Dec12_kf64_drag8e-4',
                'Dec12_kf128_drag8e-4']
beta = 16*np.pi
epsilon =  np.array([4.920e-04, 4.876e-04, 4.618e-04, 4.235e-04])
kfs = np.array([16., 32., 64., 128.])
PI_set = [ 0.57322233,  1.14438672,  2.2640231 ,  4.45031494]
drag   = 8e-4

fig = plt.figure(figsize=[8, 8])

#--------------------------- kf = 128 EKE ------------------------
ax = fig.add_subplot(2,2,1)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/spec_diag/' %filename_set[-1]
ml.load(save_dir + 'spectral_EKE_budget')
ml.load('/home/j1c/analysis/2015/qg_model/%s/Ek' %filename_set[-1])
eps = epsilon[-1]
Pi = PI_set[-1]
kf = kfs[-1]
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.set_title('EKE budget', fontsize=fontsize2)
ax.semilogx(k, k*eddy_eddy.squeeze(), linewidth=linewidth1, label=r'$T_{EE}$')
ax.semilogx(k, k*eddy_mean.squeeze(), linewidth=linewidth1, label=r'$-T_{EM}^e$')
ax.semilogx(k, -2*k*drag*EKEk,'k', linewidth=linewidth2, label='frictional dissipation')
ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([k_epsilon, k_epsilon], 
        [0, -5e-4],
        '--k', linewidth=linewidth2)
ax.text(k_epsilon, -5e-4, r'$k_\varepsilon$')
ax.plot([kf, kf], 
        [0, 8e-4],
        '--k', linewidth=linewidth2)
ax.text(kf, 8e-4, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-1e-3, 1e-3)
ax.ticklabel_format(axis='y', style='sci', scilimits=(-2,2))
ax.xaxis.set_ticklabels([])
ax.set_ylabel(r'$kd\mathcal{E}(k)/dt$')


#--------------------------- kf = 128 ZKE ------------------------
ax = fig.add_subplot(2,2,2)
ax.set_title('ZKE budget', fontsize=fontsize2)
ax.semilogx(k, k*(total-eddy_eddy-eddy_mean).squeeze(), linewidth=linewidth1, label=r'$T_{EM}^m$')
ax.semilogx(k, -2*drag*(Ek-EKEk)*k,'k', linewidth=linewidth2, label='frictional dissipation')
ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([kf, kf], 
        [0, 8e-4],
        '--k', linewidth=linewidth2)
ax.text(kf, 8e-4, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-1e-3, 1e-3)
#ax.set_ylim(-1.2, 0.4)
ax.yaxis.set_ticklabels([])
ax.xaxis.set_ticklabels([])


#--------------------------- kf = 16 EKE ------------------------
ax = fig.add_subplot(2,2,3)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/spec_diag/' %filename_set[-4]
ml.load(save_dir + 'spectral_EKE_budget')
ml.load('/home/j1c/analysis/2015/qg_model/%s/Ek' %filename_set[-4])
eps = epsilon[-4]
Pi = PI_set[-4]
kf = kfs[-4]
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
# ax.set_title('EKE budget')
ax.semilogx(k, k*eddy_eddy.squeeze(), linewidth=linewidth1, label=r'$T_{EE}$')
ax.semilogx(k, k*eddy_mean.squeeze(), linewidth=linewidth1, label=r'$-T_{EM}^E$')
ax.semilogx(k, -2*drag*EKEk*k, 'k', linewidth=linewidth2, label='frictional dissipation')
#ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([k_eta, k_eta], 
        [0, -5e-4],
        '--k', linewidth=linewidth2)
ax.text(k_eta, -5e-4, r'$k_\eta$')
ax.plot([kf, kf], 
        [0, 8e-4],
        '--k', linewidth=linewidth2)
ax.text(kf, 8e-4, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-2e-3, 2e-3)
ax.ticklabel_format(axis='y', style='sci', scilimits=(-2,2))
#ax.xaxis.set_ticklabels([])
ax.set_xlabel('$k$')
ax.set_ylabel(r'$kd\mathcal{E}(k)/dt$')


#--------------------------- kf = 16 ZKE ------------------------
ax = fig.add_subplot(2,2,4)
# ax.set_title('ZKE budget')
ax.semilogx(k, k*(total-eddy_eddy-eddy_mean).squeeze(), linewidth=linewidth1, label=r'$T_{EM}^M$')
ax.semilogx(k, -2*drag*(Ek-EKEk)*k, 'k', linewidth=linewidth2, label='frictional dissipation')
#ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([kf, kf], 
        [0, 8e-4],
        '--k', linewidth=linewidth2)
ax.text(kf, 8e-4, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-2e-3, 2e-3)
#ax.set_ylim(-1.2, 0.4)

ax.yaxis.set_ticklabels([])
ax.set_xlabel('$k$')

fig.subplots_adjust(wspace=0.05, hspace=0.13)
plt.show()