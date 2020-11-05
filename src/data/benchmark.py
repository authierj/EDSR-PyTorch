import os

from data import common
from data import srdata

import glob
import numpy as np

import torch
import torch.utils.data as data

class Benchmark(srdata.SRData):
    def __init__(self, args, name='', train=True, benchmark=True):
        super(Benchmark, self).__init__(
            args, name=name, train=train, benchmark=True
        )

    def _scan(self):
        list_hr = []
        list_lr = []
        for s in self.scale:
            list_hr.append(sorted(glob.glob(self.dir_hr + '/*.png')))
            list_lr.append(sorted(glob.glob(self.dir_lr + '/X{}/*.png'.format(s))))

        return list_hr, list_lr

    def _set_filesystem(self, dir_data):
        print(dir_data, type(dir_data))
        print(self.args.data_test, type(self.args.data_test))
        self.apath = os.path.join(dir_data, 'super_resolution_aws/benchmark', self.args.data_test[0])
        self.dir_hr = os.path.join(self.apath, 'HR')
        self.dir_lr = os.path.join(self.apath, 'LR_bicubic')
        print(self.dir_hr)
        print(self.dir_lr)
        self.ext = ('', '.png')
