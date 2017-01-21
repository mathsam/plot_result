import sys
sys.path.append('/home/j1c/py/lib')
import qg_transform
from scipy.io import netcdf
import matplotlib.pyplot as plt
import numpy as np
import matlab_style
from matplotlib import ticker
import matplotlib
font = {'size'   : 14}
matplotlib.rc('font', **font)

linewidth1 = 0.7
alpha1 = 0.7

exp_year = 2016
filename_prefix = 'Mar25_amp5e-2'

def show_range(field):
    min_end = np.percentile(field.flatten(), 5)
    max_end = np.percentile(field.flatten(), 95)
    return (min_end, max_end)
    
domain_size = 1.5
x = y = np.linspace(domain_size, -domain_size, 1024)

filedir  = '/archive/Junyi.Chai/QG_exp/%d/%s' %(exp_year, filename_prefix)
f = netcdf.netcdf_file(
    '/archive/Junyi.Chai/QG_exp/2016/Apr12_amp5e-2/Apr12_amp5e-2_seg1.nc')
psif = f.variables['psi']
t = f.variables['time'][:].copy()
t -= t[0]
psic = qg_transform.real2complex(psif[0])
u = qg_transform.get_velocities(psic)[0].squeeze()
ug = qg_transform.spec2grid(u)
ug_mean = np.mean(ug,1).squeeze()

##
fig = plt.figure(figsize=[2.5, 6])
ax = plt.subplot(3, 1, 1)
plt.axis('off')
psic = qg_transform.real2complex(psif[0])
vors = qg_transform.get_vorticity(psic).squeeze()
eddy_vors = qg_transform.filter(vors, None, None, True)
vorg = qg_transform.spec2grid(eddy_vors)
vormap = plt.imshow(vorg,
    extent = [-domain_size, domain_size, -domain_size, domain_size])
plt.plot(ug_mean, y, 'r', linewidth=linewidth1, alpha=alpha1)
plt.xlim(-domain_size, domain_size)
plt.ylim(-domain_size, domain_size)
vormap.set_cmap('gray')
vormap.set_clim(*show_range(vorg))


ax = plt.subplot(3, 1, 2)
plt.axis('off')
psic = qg_transform.real2complex(psif[30])
vors = qg_transform.get_vorticity(psic).squeeze()
eddy_vors = qg_transform.filter(vors, None, None, True)
vorg = qg_transform.spec2grid(eddy_vors)
vormap = plt.imshow(vorg,
    extent = [-domain_size, domain_size, -domain_size, domain_size])
plt.plot(ug_mean, y, 'r', linewidth=linewidth1, alpha=alpha1)
plt.xlim(-domain_size, domain_size)
plt.ylim(-domain_size, domain_size)
vormap.set_cmap('gray')
vormap.set_clim(*show_range(vorg))

ax = plt.subplot(3, 1, 3)
ax.yaxis.set_visible(False)
ax.set_xticks([-1, 0, 1])
psic = qg_transform.real2complex(psif[60])
vors = qg_transform.get_vorticity(psic).squeeze()
eddy_vors = qg_transform.filter(vors, None, None, True)
vorg = qg_transform.spec2grid(eddy_vors)
vormap = plt.imshow(vorg,
    extent = [-domain_size, domain_size, -domain_size, domain_size])
plt.plot(ug_mean, y, 'r', linewidth=linewidth1, alpha=alpha1)
plt.xlim(-domain_size, domain_size)
plt.ylim(-domain_size, domain_size)
vormap.set_cmap('gray')
vormap.set_clim(*show_range(vorg))


fig = plt.gcf()

fig.subplots_adjust(wspace=0.1, hspace=0.1)

plt.show()