import sys
sys.path.append('/home/j1c/py/lib')
import qg_transform
import nc_tools
import matplotlib.pyplot as plt
import numpy as np
import matlab_style

beta = 16*np.pi
beta1d = beta*np.linspace(-np.pi, np.pi, 1024)[:,np.newaxis]

which_layer = 0
filename_prefix = 'Dec12_kf16_drag8e-4'
filedir  = '/archive/Junyi.Chai/QG_exp/2015/%s' %filename_prefix
filename = r'%s_seg700' %filename_prefix
psif = nc_tools.ncread(filedir, filename,'psi')
psi = psif[-1,:,:,:]
psic = qg_transform.real2complex(psi)[...,0]
vors = qg_transform.filter(qg_transform.get_vorticity(psic), 
    None, None, False)
vorg_kf16 = qg_transform.spec2grid(vors)

which_layer = 0
filename_prefix = 'Dec12_kf128_drag8e-4'
filedir  = '/archive/Junyi.Chai/QG_exp/2015/%s' %filename_prefix
filename = r'%s_seg250' %filename_prefix
psif = nc_tools.ncread(filedir, filename,'psi')
psi = psif[-1,:,:,:]
psic = qg_transform.real2complex(psi)[...,0]
vors = qg_transform.filter(qg_transform.get_vorticity(psic), 
    None, None, False)
vorg_kf128 = qg_transform.spec2grid(vors)
##
x1d = np.linspace(-np.pi, np.pi, 1024)
y1d = np.linspace(-np.pi, np.pi, 1024)
plt.subplot(211)
plt.contour(x1d, y1d[600:900], (vorg_kf16+beta1d)[600:900], 5, linewidths=0.5)
plt.xticks([])
plt.ylabel('$y$')
plt.subplot(212)
plt.contour(x1d, y1d[600:900], (vorg_kf128+beta1d)[600:900], 5, linewidths=0.5)
plt.ylabel('$y$')
plt.xlabel('$x$')
plt.show()