# -*- coding: utf-8 -*-
"""
Created on Thu Aug  8 15:49:42 2024

@author: tsoze
"""

import numpy as np

# Rivierengebied
Huidig = np.array([
    [666, 318, 705, 292],
    [601, 1029, 452, 159],
    [962, 1812, 949, 402],
    [369, 0, 692, 232],
    [1342, 0, 395, 482],
    [0, 2899, 0, 0],
    [35, 232, 151, 69],
    [51, 24, 162, 5],
    [3277, 2970, 1205, 239]
])

Streef = np.array([
    [4037, 795, 3324, 1204],
    [2552, 245, 414, 0],
    [2083, 4554, 2540, 488],
    [348, 1e-5, 1170, 88],
    [2075, 1e-5, 1746, 2200],
    [1e-5, 5523, 1e-5, 1e-5],
    [17, 409, 718, 478],
    [518, 2393, 747, 160],
    [3802, 1445, 645, 206]
])

Indicator = np.zeros(4)
Gewicht = np.sqrt(Streef)

# Calculate I matrix and Indicator
I = np.zeros_like(Huidig, dtype=float)
for i in range(Huidig.shape[0]):
    for j in range(Huidig.shape[1]):
        I[i, j] = (Huidig[i, j] / Streef[i, j]) * 100
        if I[i, j] > 100:
            I[i, j] = 100
        Indicator[j] += I[i, j] * Gewicht[i, j]

Indicator /= np.sum(Streef, axis=0)

# Calculate Tot_Opp and Mean_indicator
Tot_Opp = np.sqrt(np.sum(Streef, axis=0))
Mean_indicator = np.dot(Tot_Opp, Indicator) / np.sum(Tot_Opp)

# IJsselmeergebied
Huidig2 = np.array([
    [523, 149, 101, 189, 98, 308],
    [733, 227, 715, 302, 441, 92]
])

Streef2 = np.array([
    [5804, 212, 3566, 384, 236, 112],
    [5804, 212, 3566, 384, 236, 112]
])

Indicator2 = np.zeros(6)
Gewicht2 = np.sqrt(Streef2)

# Calculate I2 matrix and Indicator2
I2 = np.zeros_like(Huidig2, dtype=float)
for i in range(Huidig2.shape[0]):
    for j in range(Huidig2.shape[1]):
        I2[i, j] = (Huidig2[i, j] / Streef2[i, j]) * 100
        if I2[i, j] > 100:
            I2[i, j] = 100
        Indicator2[j] += I2[i, j] * Gewicht2[i, j]

Indicator2 /= np.sum(Gewicht2, axis=0)

# Calculate Tot_Opp2 and Mean_indicator2
Tot_Opp2 = np.sqrt(np.sum(Streef2, axis=0))
Mean_indicator2 = np.dot(Tot_Opp2, Indicator2) / np.sum(Tot_Opp2)

print("Mean indicator for Rivierengebied:", Mean_indicator)
print("Mean indicator for IJsselmeergebied:", Mean_indicator2)
