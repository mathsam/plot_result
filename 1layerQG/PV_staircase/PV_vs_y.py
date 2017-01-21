import numpy as np
import matlab_style as ml
import sys
sys.path.append('/home/j1c/py/lib')
import qg_transform
import matplotlib.pyplot as plt
import matplotlib
font = {'size'   : 13}
matplotlib.rc('font', **font)

linewidth1 = 0.8
linewidth2 = 0.8
fontsize1 = 14
fontsize2 = 12
fontsize3 = 12

filename_set = ['Dec12_kf16_drag1e-4', 
                'Dec12_kf32_drag1e-4',
                'Dec12_kf64_drag1e-4']
beta = 16*np.pi
epsilon =  np.array([6.15e-05,   6.095e-05,   5.773e-05])
kfs = np.array([16., 32., 64.])
PI_set = [0.3781857 ,  0.75501367,  1.49372407]
drag   = 1e-4

y = np.linspace(-np.pi, np.pi, 1024)
beta1d = beta*y

rgb_gray = (0.5019607843137255, 0.5019607843137255, 0.5019607843137255)

def get_U(psic):
    psic = psic.squeeze()
    uc   = qg_transform.get_velocities(psic)[0]
    ug   = qg_transform.spec2grid(uc)
    return np.mean(ug, 1)

fig = plt.figure(figsize=[3.2, 8])

#--------------------------- kf = 64 ------------------------
ax = fig.add_subplot(3,1,1)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/' %filename_set[-1]
ml.load(save_dir + 'lang_mean_PV')
ml.load(save_dir + 'mean_psic')

# ax.plot(lang_PV/beta/np.pi-1, y, 'k', linewidth=linewidth1)
vorg1d = np.mean(qg_transform.spec2grid(
    qg_transform.get_vorticity(mean_psic)), 1).squeeze() + beta1d
ax.plot(vorg1d/beta/np.pi, y, 'k', linewidth=linewidth2)

ax.set_xlim(-1.1, 1.1)
ax.set_ylim(-np.pi, np.pi)
ax.yaxis.set_ticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi])
ax.yaxis.set_ticklabels(['$-\pi$', '', '$0$', '', '$\pi$'])
ax.xaxis.set_ticklabels([])
ax.set_ylabel(r'$y$', fontsize=fontsize2)

ax1 = ax.twiny()
ug1d = get_U(mean_psic)
ax1.plot(ug1d, y, linewidth=linewidth2, color=rgb_gray)
ax1.set_xlim(-1.5, 1.5)
ax1.set_xticks([-1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5])
ax1.set_xticklabels(['-1.5', '','','0', '','','1.5'], fontsize=fontsize2)
for tl in ax1.get_xticklabels():
    tl.set_color(rgb_gray)
ax1.set_xlabel('$U$',fontsize=fontsize2, color=rgb_gray)

#--------------------------- kf = 32 ------------------------
ax = fig.add_subplot(3,1,2)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/' %filename_set[-2]
ml.load(save_dir + 'lang_mean_PV')
ml.load(save_dir + 'mean_psic')

# ax.plot(lang_PV/beta/np.pi-1, y, 'k', linewidth=linewidth1)
vorg1d = np.mean(qg_transform.spec2grid(
    qg_transform.get_vorticity(mean_psic)), 1).squeeze() + beta1d
ax.plot(vorg1d/beta/np.pi, y, 'k', linewidth=linewidth2)

ax.set_xlim(-1.1, 1.1)
ax.set_ylim(-np.pi, np.pi)
ax.yaxis.set_ticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi])
ax.yaxis.set_ticklabels(['$-\pi$', '', '$0$', '', '$\pi$'])
ax.xaxis.set_ticklabels([])
ax.set_ylabel(r'$y$', fontsize=fontsize2)

ax1 = ax.twiny()
ug1d = get_U(mean_psic)
ax1.plot(ug1d, y, linewidth=linewidth2, color=rgb_gray)
ax1.set_xlim(-1.5, 1.5)
ax1.set_xticks([-1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5])
ax1.set_xticklabels([], fontsize=fontsize2)
for tl in ax1.get_xticklabels():
    tl.set_color(rgb_gray)

#--------------------------- kf = 16 ------------------------
ax = fig.add_subplot(3,1,3)
save_dir = '/home/j1c/analysis/2015/qg_model/%s/' %filename_set[-3]
ml.load(save_dir + 'lang_mean_PV')
ml.load(save_dir + 'mean_psic')

# ax.plot(lang_PV/beta/np.pi-1, y, 'k', linewidth=linewidth1)
vorg1d = np.mean(qg_transform.spec2grid(
    qg_transform.get_vorticity(mean_psic)), 1).squeeze() + beta1d
ax.plot(vorg1d/beta/np.pi, y, 'k', linewidth=linewidth2)

ax.set_xlim(-1.1, 1.1)
ax.set_ylim(-np.pi, np.pi)
ax.yaxis.set_ticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi])
ax.yaxis.set_ticklabels(['$-\pi$', '', '$0$', '', '$\pi$'])
ax.xaxis.set_tick_params(labelsize=fontsize2)
#ax.xaxis.set_ticklabels([])
ax.set_ylabel(r'$y$', fontsize=fontsize2)
ax.set_xlabel(r'$q/\beta\pi$', fontsize=fontsize2)

ax1 = ax.twiny()
ug1d = get_U(mean_psic)
ax1.plot(ug1d, y, linewidth=linewidth2, color=rgb_gray)
ax1.set_xlim(-1.5, 1.5)
ax1.set_xticks([-1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5])
ax1.set_xticklabels([], fontsize=fontsize2)
for tl in ax1.get_xticklabels():
    tl.set_color(rgb_gray)

fig.subplots_adjust(wspace=0.05, hspace=0.13)
fig.tight_layout()
plt.show()