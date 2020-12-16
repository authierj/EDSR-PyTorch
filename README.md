## Contents
1. [Installation](#installation)
2. [Datasets](#datasets)
3. [Pre-trained models](#pre-trained-models)
4. [Demo](#demo)
5. [Introduction](#introduction)
6. [Baseline](#baseline)
7. [Method and experiments](#method-and-experiments)
8. [Conclusion](#conclusion)
9. [References](#references)




# Code Documentation

## Installation
Clone this repository into any place you want.
```bash
git clone https://github.com/authierj/EDSR-PyTorch
cd EDSR-PyTorch
```
**Dependencies**
* Python 3.8.5
* PyTorch >= 1.0.0
* numpy
* skimage
* imageio
* matplotlib
* tqdm
* cv2 >= 3.xx (Only if you want to use video input/output)

## Datasets
We used the [DIV2K](https://data.vision.ee.ethz.ch/cvl/DIV2K/) dataset  to train our models and the wildely used benchmark datasets Set5, Set14, B100 and Urban100 to test the models.

## Pre-trained models
The models used for the experiments can be found in [experiment](/experiment) under <name_model>/model_best.pt

## Demo
To test all our models on the Urban100 dataset, run the ```run_networks.sh``` file.

You can test the SR resolution alogrithms with your images. Place your image in the ```test```folder. The network supports .png and .jpeg files
Run the following line in ```src```

```bash
python main.py --data_test Demo --scale 4 --pre_train ../experiment/task4x2/model/model_best.pt --test_only --save_results
```
You can find the results in ```experiment/test```

If you want to train a network on the DIV2K dataset and test it on the Urban100 benchmark run the follwing lines in your terminal
```bash
cd src       # You are now in */EDSR-PyTorch/src
python main.py --model <MODEL_NAME> --scale 2 --n_resblock 8 --data_test Urban100 --save <...> --save_results --reset
```
If you wish you can change the scale, scales 2, 3 and 4 are mainly used, as well as the n_resblock to have deeper network, many other options are possible and are listed in ```option.py```

To test the performance of a pre-trained network run the following lines in your terminal
```bash
cd src       # You are now in */EDSR-PyTorch/src
python main.py --test_only --pre_train ../experiment/<name_network>/model/model_best.pt --data_test <benchmark dataset> --save <...> --save_results --reset
```

# Project Documentation

## Introduction

Due to the rise of mobile devices like drones and smartphones, camera sensors must be made smaller and more lightweight. This leads to a decrease in image resolution and quality. This is where single image super resolution, which aims at recovering a high resolution (HR) images from the degraded low resolution (LR) images, comes in handy. In this work we look at the performance of super resolution convolutional networks (SRCNN) which are trained on a large dataset of paired LR and HR images and aims to minimize a loss function that grades the performance of the super resolution (SR) images, the outputs of the network, compared to the HR images and then test them on different datasets. The resulting networks can then be used in mobile devices to increase the quality of the LR images.


## Baseline

Our project is based on the [EDSR-PyTorch](https://github.com/thstkdgus35/EDSR-PyTorch) repository which allready includes Loss-functions, some basic blocks, dataloaders and training and testing functions. In addition we use a [function](https://github.com/ofsoundof/dhp/blob/master/restoration/data/div2ksub.py) from an other repository which transforms the images into .pt files. We added some new simpler models to the repository.


## Background

There are two general aproaches for solving the super resolution problem. First you can interpolate your low resolution image using for example bicubic interpolation, and then run a convolutional neural network (CNN) on the interpolated images. Or you can add an upsampling block at the end of the CNN, which makes the network smaller and therefore faster. The EDSR model, which we also tested to see how the dataloaoding, training, testing, etc. works, uses the second approach. In this project both approches are tested, while using the first approach only for the simpler networks.


## Method and experiments

For the training of the networks we use HR images, which we degrade with a simplified model including blurring, downsampling with bicubic interpolation and noise, to get paired training data (LR, HR). Then we train our network on a large datasets of images to try do the inverse process and reconstituing a HR image. In fact the network is trained to exctract high frequencies information from a low-frequency input.

In the next lines we will look at the results of different networks on the benchmark datasets. Different techniques such as global residual connection, residual blocks or channel attention were used to try to improve the performance of the networks. We will also look at the importance of the network depth and width for the performance.

We use 64 feature maps, activation-function ReLu, L1 loss, no batch normalization, scaling factor 2 and a patchsize of 96 for all Networks unless stated different. 


**Scale**

We also tested some networks for other scales and patchsize combinations: (scale 3, patchsize 144) and (scale 4, patchsize 192). We show the results of these settings exemplary for the first task and omit them for the rest of the networks.
![](/figs/task1_comparison_augmentation.png)
As expected for bigger scales the performance is worse. This is due to the fact that with bigger scales less details (also generally less information) is stored in the LR images. This also holds for all other networks in this project but is only exemplary shown for the smallest and most simple network from task 1 which consists of 3 convolutional layers only.


**Networks with a bicubic interpolated input**

![](/figs/basic_blocks.png)

For tasks 1-3 the input of the network is a bicubic intepolated LR image, the image is interpolated to have the same number of pixels as the HR image.

In task 1 we implemented a simple 3 layers CNN network.
In task 2 we add a global residual connection (grc) to the network of task 1, the result looks like the one in the picture above.
In task 3 we increase the depth of the network of task 2, we have now a 8 layers SRCNN

![](/figs/task1_3_comparison.png)

We see that the global residual connection increases a little the performance of the network, but it is mainly the increase of the depth of the network that causes a ~1.5 dB increase in the peak signal to noise ratio (PSNR). 


 **Upsampling block added at the end of the network**
 
In task 4 we do not interpolate the LR input image, but instead we add an upsampling block at the end of the network of task 4. We still have 8 layers and a grc as in task 3. This does not improve the quality of the SR images, but this reduce significantly the computational complexity of the problem thank to the smaller size of the input data. 
 
From this point, all our networks add functionalities to the 8-layers SRCNN network with an upsampling block, the one of task 4, thus we will always compare our results with this network.


 **Batch normalization and residual connection block**
 
 In this part, we analyse the influence on performance of batch normalization, which we added in task 5, and the use of residual blocks added in task 6. 
 ![](/figs/task4_6_comparison.png)
 
 Adding batch normalization to the network, that means normalizing the data of the batches after each convolutional layer. We noticed a significant increase of the PSNR but the visual results are not a lot better. Indeed the benefit of batch normalization for SRCNN is not that clear yet. 
 
 On the other hand, replacing our blocks constituted of a convolutional layer followed by an actctivation function by residual blocks described in the picture below increase the PSNR a little less than the batch normalization, but the  visual result is more satisfying for the human eye.
 
 ![](/figs/resblock_v2.png)
 

 **Leaky ReLU and PreLU**
 
In task 7 we look at the effects of the activation function. As default activation function we used ReLU(x) = max(x,0) and we compare the performance of of RelU with LeakyReLU and the parametric ReLu, PReLU. 
 
![alt-text-1](/figs/leakyrelu.png)![alt-text-2](/figs/prelu.png)

The parameter 'a' in the PReLU activation is a learnable parameter for each feature map.
LeakyReLU and PReLU are used to solve the problem of the "dying ReLU", due to the zero value and thus zero slope of the negative side of ReLU, so once a neuron gets negative it "dies" and does not contribute anymore to the improvement of the network. LeakyReLU and PReLU try to solve this problem by having a small positiv gradient on the negative side and thus neurons will not be "killed".
 
 ![](/figs/leakyvsprelu.png)
 
 First of all, notice that the results here are not as good as in the others experiments. This can be easily explained, due to an unfortunate error the patch size in this experiment is 196 and not 96 as in the other experiment, thus the parameters of the network are not updated as often as usual resulting in a less optimized network and therefore results not as good as in the other experiments.
 
 But we can still compare the performance of the networks and we clearly see that the results for leakyReLU and PReLU are better than for a classic ReLU activation function. The visual result is better too, however we would have expected the PReLU achieve better results than the leakyReLU due to the additional learing parameter 'a' but this does not seem to be the case.


 **Effect of deeper and wider network**
 
In task8, we explore the effect of the network size on the performance. We separatly double and quadruple the number of layers(depth) and the number of feature maps(width) of our network.
 
 ![](/figs/task8_comparison.png)
The enlargement of the depth and width can improve the performance of the SRCNN significantly (See change from (8,64) to (16,64) and (8,96)). But for even bigger widths the performance stagnates (8,128). And for even bigger depth the performance gets even worse. If we look at the training performance we see that at epoch 280 the networks performance seems to suddenly get better both in loss and PSNR. This is a strange behavior which we found no explanation for, it could be that the networks overfits the training data but this would be unexpected. This behavior is probably the main reason for the bad performance of this network.
 ![](/figs/task8_32_64.PNG)

 **loss functions: L1 vs L2 vs perceptual loss**
 
 In task 9 we change the loss function to L2 (mean squared error).
 In task 11 we use visual geometry group network-based perceptual loss (VGG perceptual loss) with 54 layers (VGG54).
 While L1 and L2 loss are pixelwise losses, perceptual loss looks at the conservation of structures and therefore acts in the low frequency range. This is achieved with an additional CNN which extracts structures and is then applied to both the HR and SR images. The outputs are then compared.
 ![](/figs/task9_11_comparison.png)
 The L2 loss improves the performances significantly compared to the L1 loss. With perceptual loss the performance gets worse. This can be explained with the fact that the structures stay the same in the low resolution images even if they are only interpolated. In other words the perceptual loss looks more at the lower frequencies, where the goal of a SRCNN is to reproduce the high frequencies. Also noise majorly acts in the higher frequency range and therefore gets "ignored" by the perceptual loss.


**Results in a table** 

| Model | task | description |  SET5 PSNR | Set14 PSNR | Urban100 PSNR | B100 PSNR |
|  ---  |  ---  | ---       | ---  | ---        | ---  | ---        |
| **Bicubic** | 1 | 3 layers scale 2 | 36.504 dB | 32.346 dB | 29.275 dB | 31.212 dB
| | | 3 layers scale 3  | 32.366 dB | 29.053 dB | 25.858 dB | 28.186 dB
| | |  3 layers scale 4 | 30.041 dB | 27.263 dB | 24.126 dB | 26.682 dB
| | 2 | 3 layers with grc | 36.722 dB | 32.475 dB | 29.536 dB | 31.318 dB
| | 3 | 8 layers with grc | 37.432 dB | 33.049 dB | 30.752 dB | 31.809 dB
| **SRCNN** | 4 | upsampling | 37.335 dB | 32.933 dB | 30.383 dB | 31.697 dB |
| | 5 | batch normalisation | 37.636 dB | 33.175 dB | 31.119 dB | 31.929 dB
| | 6 | residual connections | 37.629 dB | 33.208 dB | 31.083 dB |  31.938 dB |
| | 7 | leakyReLU | 28.151 dB | 26.931 dB | 25.078 dB | 31.945 dB |
| | | PreLU | 27.652 dB | 26.728 dB | 24.922 dB | 31.944 dB |
| | 8 | 16 layers | 37.686 dB | 33.256 dB | 31.348 dB | 32.012 dB |
| | | 32 layers | 36.918 dB | 32.615 dB | 29.682 dB | 31.478 dB |
| | | n_channels 96 | 37.712 dB | 33.273 dB | 31.333 dB | 31.997 dB |
| | | n_channels 128 | 37.760 dB | 33.331 dB | 31.478 dB | 32.023 dB |
| | 9 | L2(mse) | 37.533 dB | 33.160 dB | 31.054 dB | 31.902 dB |
| | 11 | perceptual loss |  34.653 dB | 31.025 dB | 28.457 dB | 29.958 dB |

Notice that the Task 10 is not in the table, the results of task 10 are in '''experiment/task10'''. The network stoped trainning after 70 epochs probably due to time limitations or a technical problem. As it makes no sense to compare a network after 70 epochs with the other networks we did not put the intemediate results in the table. Unfortunately we did not have the time to solve this issue.

## Conclusion

We see that we can already achieve some fairly good results with a very simple and small CNN with only 3 layers. Using an upsamling block at the end of the network instead of interpolation at the beginning the network improves the computational performance of the network. Increasing the depth of the network increase drastically the performance but for very deep network it seems that the performance is stagnating, thus we imagine that it could be benefitial to use residual blocks and to add global residual connections to activate the deeper networks properly. With activation functions and batch normalisation you can tune your network, but they don't seem to have a major effect. Further one could try to combine L1 or L2 loss with perceptual loss to increase the PSNR score while still maintaining details in the SR image.

## References
1. Chao Dong, Chen Change Loy, Kaiming He, and Xiaoou Tang. Image super- resolution using deep convolutional networks.
2. Jiwon Kim, Jung Kwon Lee, and Kyoung Mu Lee. Accurate image super- resolution using very deep convolutional networks.
3. Christian Ledig, Lucas Theis, Ferenc Husz ́ar, Jose Caballero, Andrew Cun- ningham, Alejandro Acosta, Andrew Aitken, Alykhan Tejani, Johannes Totz, Zehan Wang, et al. Photo-realistic single image super-resolution using a generative adversarial network.
4. Brandon Yang, Gabriel Bender, Quoc V Le, and Jiquan Ngiam. Condconv: Conditionally parameterized convolutions for efficient inference.
5. Yulun Zhang, Kunpeng Li, Kai Li, Lichen Wang, Bineng Zhong, and Yun Fu. Image super-resolution using very deep residual channel attention networks.
