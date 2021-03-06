import numpy as np
import matlab_style as ml
import sys
sys.path.append('/home/j1c/py/lib')
sys.path.append('/home/j1c/py/lib/noboru')
from finite_amp_diag import dfdy
import qg_transform
import matplotlib.pyplot as plt
import matplotlib
font = {'size'   : 13}
matplotlib.rc('font', **font)

linewidth1 = 1.3
linewidth2 = 0.7
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

rgb_blue = (0.0, 0.5019607843137255, 1.0)
rgb_darkblue = (0.0, 0.2980392156862745, 0.6)

def get_dPVdy_U(psic, beta):
    psic = psic.squeeze()
    vorc = qg_transform.get_vorticity(psic)
    dvorcdy = qg_transform.partial_y(vorc)
    uc   = qg_transform.get_velocities(psic)[0]
    dvorgdy = qg_transform.spec2grid(dvorcdy)
    ug   = qg_transform.spec2grid(uc)
    return np.mean(dvorgdy, 1)+beta, np.mean(ug, 1)

fig = plt.figure(figsize=[6, 6])    

# ------------------------ kf = 16 -------------------------------
save_dir = '/home/j1c/analysis/2015/qg_model/%s/' %filename_set[-1]
ml.load(save_dir + 'lang_mean_PV')
ml.load(save_dir + 'mean_psic')
dPVdy, Ug = get_dPVdy_U(mean_psic, beta)
dlangPVdy = dfdy(lang_PV)

ax1 = fig.add_subplot(311)
ax1.plot(y, dPVdy/beta, label=r'$d\bar{q}/dy$', linewidth=linewidth1, color=rgb_blue)
#ax1.plot(y, dlangPVdy/beta, label=r'$dq(y_e)/dy_e$', linewidth=linewidth2, color=rgb_darkblue)
ax1.plot(y, np.zeros_like(y), '--', linewidth=linewidth2, color=rgb_blue)
for tl in ax1.get_yticklabels():
    tl.set_color(rgb_blue)
ax1.set_xlim(-np.pi, np.pi)
ax1.set_ylim(-2, 14)
ax1.xaxis.set_ticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi])
ax1.xaxis.set_ticklabels([])
ax1.legend(loc='upper left',frameon=False,fontsize=fontsize2)
ax1.set_ylabel(r'$\beta^{-1} dq/dy$')

ax2 = ax1.twinx()
ax2.plot(y, Ug, 'r-', label='$U$', linewidth=linewidth1)
for tl in ax2.get_yticklabels():
    tl.set_color('r')
ax2.legend(loc='upper right',frameon=False,fontsize=fontsize2)
for tl in ax2.get_yticklabels():
    tl.set_color('r')
ax2.set_ylabel('$U$')
ax2.set_ylim([-1.5, 3.0])

# ------------------------ kf=32 ----------------------------------------
save_dir = '/home/j1c/analysis/2015/qg_model/%s/' %filename_set[-2]
ml.load(save_dir + 'lang_mean_PV')
ml.load(save_dir + 'mean_psic')
dPVdy, Ug = get_dPVdy_U(mean_psic, beta)
dlangPVdy = dfdy(lang_PV)

ax1 = fig.add_subplot(312)
ax1.plot(y, dPVdy/beta, label=r'$d\bar{q}/dy$', linewidth=linewidth1, color=rgb_blue)
#ax1.plot(y, dlangPVdy/beta, label=r'$dq(y_e)/dy_e$', linewidth=linewidth2, color=rgb_darkblue)
ax1.plot(y, np.zeros_like(y), '--', linewidth=linewidth2, color=rgb_blue)
for tl in ax1.get_yticklabels():
    tl.set_color(rgb_blue)
ax1.set_xlim(-np.pi, np.pi)
ax1.set_ylim(-2, 14)
ax1.xaxis.set_ticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi])
ax1.xaxis.set_ticklabels([])
ax1.set_ylabel(r'$\beta^{-1} dq/dy$')

ax2 = ax1.twinx()
ax2.plot(y, Ug, 'r-', label='$U$', linewidth=linewidth1)
for tl in ax2.get_yticklabels():
    tl.set_color('r')
#ax2.legend(loc='upper right',frameon=False,fontsize=fontsize2)
for tl in ax2.get_yticklabels():
    tl.set_color('r')
ax2.set_ylabel('$U$')
ax2.set_ylim([-1.5, 3.0])

# ---------------------- kf = 16 ----------------------------------
save_dir = '/home/j1c/analysis/2015/qg_model/%s/' %filename_set[-3]
ml.load(save_dir + 'lang_mean_PV')
ml.load(save_dir + 'mean_psic')
dPVdy, Ug = get_dPVdy_U(mean_psic, beta)
dlangPVdy = dfdy(lang_PV)

ax1 = fig.add_subplot(313)
ax1.plot(y, dPVdy/beta, label=r'$d\bar{q}/dy$', linewidth=linewidth1, color=rgb_blue)
#ax1.plot(y, dlangPVdy/beta, label=r'$dq(y_e)/dy_e$', linewidth=linewidth2, color=rgb_darkblue)
ax1.plot(y, np.zeros_like(y), '--', linewidth=linewidth2, color=rgb_blue)
for tl in ax1.get_yticklabels():
    tl.set_color(rgb_blue)
ax1.set_xlim(-np.pi, np.pi)
ax1.set_ylim(-2, 14)
ax1.xaxis.set_ticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi])
ax1.xaxis.set_ticklabels(['$-\pi$', '$-\pi/2$', '$0$', '$\pi/2$', '$\pi$'])
#ax1.legend(loc='upper left',frameon=False,fontsize=fontsize2)
ax1.annotate('',xy=(-0.53, -0.8), xytext=(-0.53, -2.5), 
    arrowprops=dict(facecolor='green',width=2))
ax1.annotate('',xy=(2.156, -0.65), xytext=(2.156, -2.5), 
    arrowprops=dict(facecolor='green',width=2))
ax1.set_xlabel('$y$')
ax1.set_ylabel(r'$\beta^{-1} dq/dy$')

ax2 = ax1.twinx()
ax2.plot(y, Ug, 'r-', label='$U$', linewidth=linewidth1)
for tl in ax2.get_yticklabels():
    tl.set_color('r')
#ax2.legend(loc='upper right',frameon=False,fontsize=fontsize2)
for tl in ax2.get_yticklabels():
    tl.set_color('r')
ax2.set_ylabel('$U$')
ax2.set_ylim([-1.5, 3.0])

fig.tight_layout()
plt.show()