#!/usr/bin/python

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt



def main():
    data = pd.read_csv('./datasets/simple.csv')
    data_w = pd.read_csv('./datasets/simple_weights.csv')
    #print(data['x1'])
    print(data['dx'].unique())

    for y in data['dx'].unique():
        plt.plot(data[data['dx'] == y]['x1'], data[data['dx'] == y]['x2'], 'o')

    for index,row in data_w.iterrows():
        print(row)
        plt.plot([-1, 2], [row[1] + -1*row[0], row[1]+ 2*row[0]])
    plt.grid()
    plt.show()

if __name__ == '__main__':
    main()
