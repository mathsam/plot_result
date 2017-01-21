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

fig = plt.figure(figsize=[8, 8])

#--------------------------- kf = 128 ------------------------
ax = fig.add_subplot(2,2,1)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/spec_diag/' %filename_set[-1]
ml.load(save_dir + 'spectral_EKE_budget')
Pi = PI_set[-1]
kf = kfs[-1]
eta = epsilon[-1]*kf**2.0
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.semilogx(k, -np.cumsum(eddy_eddy.flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-eddy')
ax.semilogx(k, -np.cumsum((eddy_mean).flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-mean')
ax.semilogx(k, -np.cumsum((eddy_eddy+eddy_mean).flatten()*k**2.0)/eta, linewidth=linewidth1, label='Total')
ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([k_epsilon, k_epsilon], 
        [-0.2, 0.1],
        '--k', linewidth=linewidth2)
ax.text(k_eta, -0.2, r'$k_\varepsilon$')
ax.plot([kf, kf], 
        [-0.2, 0.2],
        '--k', linewidth=linewidth2)
ax.text(kf, -0.2, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-0.4, 1.2)
ax.xaxis.set_ticklabels([])
ax.set_ylabel(r'$\mathcal{F}(k)/\eta$')



#--------------------------- kf = 64 ------------------------
ax = fig.add_subplot(2,2,2)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/spec_diag/' %filename_set[-2]
ml.load(save_dir + 'spectral_EKE_budget')
Pi = PI_set[-2]
kf = kfs[-2]
eta = epsilon[-2]*kf**2.0
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.semilogx(k, -np.cumsum(eddy_eddy.flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-eddy')
ax.semilogx(k, -np.cumsum((total-eddy_eddy).flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-mean')
ax.semilogx(k, -np.cumsum(total.flatten()*k**2.0)/eta, linewidth=linewidth1, label='Total')
#ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([k_epsilon, k_epsilon], 
        [-0.2, 0.1],
        '--k', linewidth=linewidth2)
ax.text(k_eta, -0.2, r'$k_\varepsilon$')
ax.plot([kf, kf], 
        [-0.2, 0.2],
        '--k', linewidth=linewidth2)
ax.text(kf, -0.2, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-0.4, 1.2)
ax.xaxis.set_ticklabels([])
ax.yaxis.set_ticklabels([])


#--------------------------- kf = 32 ------------------------
ax = fig.add_subplot(2,2,3)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/spec_diag/' %filename_set[-3]
ml.load(save_dir + 'spectral_EKE_budget')
Pi = PI_set[-3]
kf = kfs[-3]
eta = epsilon[-3]*kf**2.0
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.semilogx(k, -np.cumsum(eddy_eddy.flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-eddy')
ax.semilogx(k, -np.cumsum((total-eddy_eddy).flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-mean')
ax.semilogx(k, -np.cumsum(total.flatten()*k**2.0)/eta, linewidth=linewidth1, label='Total')
#ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([k_epsilon, k_epsilon], 
        [-0.2, 0.1],
        '--k', linewidth=linewidth2)
ax.text(k_eta, -0.2, r'$k_\varepsilon$')
ax.plot([kf, kf], 
        [-0.2, 0.2],
        '--k', linewidth=linewidth2)
ax.text(kf, -0.2, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-0.4, 1.2)
#ax.yaxis.set_ticklabels([])
ax.set_ylabel(r'$\mathcal{F}(k)/\eta$')
ax.set_xlabel('$k$')

#--------------------------- kf = 16 ------------------------
ax = fig.add_subplot(2,2,4)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/spec_diag/' %filename_set[-4]
ml.load(save_dir + 'spectral_EKE_budget')
Pi = PI_set[-4]
kf = kfs[-4]
eta = epsilon[-4]*kf**2.0
k_epsilon = 0.5*beta**0.6*eps**-0.2
k_eta = k_epsilon* Pi**(-2./3)
ax.set_title(r'$\Pi=%.1f$' %Pi, fontsize=fontsize3)
ax.semilogx(k, -np.cumsum(eddy_eddy.flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-eddy')
ax.semilogx(k, -np.cumsum((eddy_mean).flatten()*k**2.0)/eta, linewidth=linewidth1, label='Eddy-mean')
ax.semilogx(k, -np.cumsum((eddy_eddy+eddy_mean).flatten()*k**2.0)/eta, linewidth=linewidth1, label='Total')
#ax.legend(loc='best',frameon=False,fontsize=fontsize3)

ax.plot([k_eta, k_eta], 
        [-0.2, 0.1],
        '--k', linewidth=linewidth2)
ax.text(k_eta, -0.2, r'$k_\eta$')
ax.plot([kf, kf], 
        [-0.2, 0.2],
        '--k', linewidth=linewidth2)
ax.text(kf, -0.2, r'$k_f$')
ax.set_xlim(1, 511)
ax.set_ylim(-0.4, 1.2)
ax.yaxis.set_ticklabels([])
ax.set_xlabel('$k$')

fig.subplots_adjust(wspace=0.05, hspace=0.13)
plt.show()