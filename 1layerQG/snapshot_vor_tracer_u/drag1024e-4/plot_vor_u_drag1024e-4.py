import sys
sys.path.append('/home/j1c/py/lib')
import qg_transform
import nc_tools
import matplotlib.pyplot as plt
import numpy as np
import matlab_style
from matplotlib import ticker
import matplotlib
font = {'size'   : 12}
matplotlib.rc('font', **font)

exp_drag = 1024
exp_year = 2016
filename_set = ['Mar14_kf16_drag%de-4' %exp_drag,
    'Mar14_kf32_drag%de-4' %exp_drag,
    'Mar14_kf128_drag%de-4' %exp_drag]
# filename_set = ['Dec12_kf16_drag%de-4' %exp_drag,
#     'Dec12_kf32_drag%de-4' %exp_drag,
#     'Dec12_kf64_drag%de-4' %exp_drag,
#     'Dec12_kf128_drag%de-4' %exp_drag]
kfs = np.array([16, 32, 128])
PI_set = [1.51329007, 6.02800642, 11.85759761]
num_kf = kfs.size
which_layer = 0

def show_range(field):
    min_end = np.percentile(field.flatten(), 5)
    max_end = np.percentile(field.flatten(), 95)
    return (min_end, max_end)
    
domain_size = 1.5

for i, filename_prefix in enumerate(filename_set):
    filedir  = '/archive/Junyi.Chai/QG_exp/%d/%s' %(exp_year, filename_prefix)
    filename = r'%s_seg[0-9]+' %filename_prefix
    psic = qg_transform.real2complex(
        nc_tools.NetCDFChain(
        '/archive/Junyi.Chai/QG_exp/%d/%s' %(exp_year, filename_prefix),
        '%s_seg' %filename_prefix,'psi', last_n_files=1))
    vors = qg_transform.get_vorticity(psic[-1])
    vorg = qg_transform.spec2grid(vors)
    tracerc = qg_transform.real2complex(
        nc_tools.NetCDFChain(
        '/archive/Junyi.Chai/QG_exp/%d/%s' %(exp_year, filename_prefix),
        '%s_seg' %filename_prefix,'tracer_y', last_n_files=1)[-1])
    tracerg = qg_transform.spec2grid(tracerc)
    
    plt.subplot(num_kf, 2, 2*i+1)
    plt.ylabel(r'$\Pi=%.1f$' %PI_set[i])
    plt.yticks([])
    plt.xticks([])
    vormap = plt.imshow(vorg[...,which_layer],
        extent = [-domain_size, domain_size, -domain_size, domain_size])
    cb = plt.colorbar()
    tick_locator = ticker.MaxNLocator(nbins=5)
    cb.locator = tick_locator
    cb.update_ticks()
    plt.xlim(-domain_size, domain_size)
    plt.ylim(-domain_size, domain_size)
    vormap.set_cmap('gray')
    vormap.set_clim(*show_range(vorg))
    
    ax = plt.subplot(num_kf, 2, 2*i+2)
    if i != num_kf-1:
        plt.axis('off')
    else:
        ax.yaxis.set_visible(False)
        ax.set_xticks([-1, 0, 1])
    x = y = np.linspace(domain_size, -domain_size, 1024)
    u = qg_transform.get_velocities(psic[0])[0]
    ug = qg_transform.spec2grid(u)
    u_mean = qg_transform.get_velocities(np.mean(psic, 0))[0]
    ug_mean = np.mean(qg_transform.spec2grid(u),1).squeeze()
    vormap = plt.imshow(ug[...,which_layer],
        extent = [-domain_size, domain_size, -domain_size, domain_size])
    plt.plot(ug_mean, y, 'k')
    plt.xlim(-domain_size, domain_size)
    plt.ylim(-domain_size, domain_size)
    cb = plt.colorbar()
    tick_locator = ticker.MaxNLocator(nbins=5)
    cb.locator = tick_locator
    cb.update_ticks()
    vormap.set_cmap('coolwarm')
    vormap.set_clim(*show_range(ug))

fig = plt.gcf()
plt.gcf().set_size_inches(1, 6, forward=True)
fig.subplots_adjust(wspace=0.1, hspace=0.1)

plt.show()
