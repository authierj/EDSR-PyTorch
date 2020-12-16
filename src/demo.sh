#!/bin/bash
source /usr/itetnas04/data-scratch-01/dlim_04hs20/data/conda/etc/profile.d/conda.sh
conda activate DLIM_project

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --patch_size 96 --n_resblock 8 --data_test Set14 --save task3set14 --save_gt --save_results --reset --test_only --pre_train ../experiment/task3_bicubic_input_model_grcx2_8/model/model_best.pt 

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --patch_size 96 --n_resblock 8 --data_test Urban100 --save task3urban --save_gt --save_results --reset --test_only --pre_train ../experiment/task3_bicubic_input_model_grcx2_8/model/model_best.pt

python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --patch_size 96 --n_resblock 3 --data_test Urban100 --save task2urban --save_gt --save_results --reset --test_only --pre_train ../experiment/task2_bicubic_input_model_grcx2_3/model/model_best.pt

#python main.py --model BICUBIC_INPUT_MODEL --scale 2 --patch_size 96 --n_resblock 3 --data_test Urban100 --save task1urbanx2 --save_gt --save_results --reset --test_only --pre_train ../experiment/task1_bicubic_input_modelx2_3/model/model_best.pt

#python main.py --model BICUBIC_INPUT_MODEL --scale 3 --patch_size 144 --n_resblock 3 --data_test Urban100 --save task1urbanx3 --save_gt --save_results --reset --test_only --pre_train ../experiment/task1_bicubic_input_modelx3_3/model/model_best.pt

#python main.py --model BICUBIC_INPUT_MODEL --scale 4 --patch_size 192 --n_resblock 3 --data_test Urban100 --save task1urbanx4 --save_gt --save_results --reset --test_only --pre_train ../experiment/task1_bicubic_input_modelx4_3/model/model_best.pt

python main.py --model SRCNN --scale 2 --patch_size 96 --n_resblock 8 --loss 1*L1 --save task6 --save_results --reset --save_gt


#python main.py --model BICUBIC_INPUT_MODEL --scale 2 --patch_size 96 --n_resblock 3 --batch_norm false --save task1_bicubic_input_modelx2_3 --save_gt --save_results --reset

#python main.py --model BICUBIC_INPUT_MODEL --scale 3 --patch_size 144 --n_resblock 3 --batch_norm false --save task1_bicubic_input_modelx3_3 --save_gt --save_results --reset

#python main.py --model BICUBIC_INPUT_MODEL --scale 4 --patch_size 192 --n_resblock 3 --batch_norm false --save task1_bicubic_input_modelx4_3 --save_gt --save_results --reset


#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --patch_size 96 --n_resblock 3 --batch_norm false --save task2_bicubic_input_model_grcx2_3 --save_gt --save_model --save_results --reset

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 3 --patch_size 144 --n_resblock 3 --batch_norm false --save task2_bicubic_input_model_grcx3_3 --save_gt --save_results --reset

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 4 --patch_size 192 --n_resblock 3 --batch_norm false --save task2_bicubic_input_model_grcx4_3 --save_gt --save_results --reset


#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --patch_size 96 --n_resblock 8 --batch_norm false --save task3_bicubic_input_model_grcx2_8_test_only --save_gt --save_results --reset 

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 3 --patch_size 144 --n_resblock 8 --batch_norm false --save task3_bicubic_input_model_grcx3_8 --save_gt --save_results --reset

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 4 --patch_size 192 --n_resblock 8 --batch_norm false --save task3_bicubic_input_model_grcx4_8 --save_gt --save_results --reset


#	test_only

#python main.py --model BICUBIC_INPUT_MODEL --scale 2 --data_test Urban100 --patch_size 96 --n_resblock 3 --loss 1*L1 --save task1urbanx2 --save_gt --save_results --reset --test_only --pre_train ../experiment/task1_bicubic_input_modelx2_3/model/model_best.pt

#python main.py --model BICUBIC_INPUT_MODEL --scale 3 --data_test Urban100 --patch_size 144 --n_resblock 3 --loss 1*L1 --save task1urbanx3 --save_gt --save_results --reset --test_only --pre_train ../experiment/task1_bicubic_input_modelx3_3/model/model_best.pt

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --data_test Urban100 --patch_size 96 --n_resblock 3 --loss 1*L1 --save task2urban --save_gt --save_results --reset --test_only --pre_train ../experiment/task2_bicubic_input_model_grcx2_3/model/model_best.pt

#python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --data_test Set14 --patch_size 96 --n_resblock 8 --loss 1*L1 --save task3set14 --save_gt --save_results --reset --test_only --pre_train ../experiment/task3_bicubic_input_model_grcx2_8/model/model_best.pt

python main.py --model SRCNN --scale 2 --data_test Urban100 --patch_size 96 --n_resblock 8 --loss 1*L1 --save task6urban --save_gt --save_results --reset --test_only --pre_train ../experiment/task6/model/model_best.pt

python main.py --model SRCNN --scale 2 --data_test Set5 --patch_size 96 --n_resblock 8 --loss 1*L1 --save task6set5 --save_gt --save_results --reset --test_only --pre_train ../experiment/task6/model/model_best.pt

python main.py --model SRCNN --scale 2 --data_test Set14 --patch_size 96 --n_resblock 8 --loss 1*L1 --save task6set14 --save_gt --save_results --reset --test_only --pre_train ../experiment/task6/model/model_best.pt

#python main.py --model SRCNN_BASIC --scale 2 --data_test Urban100 --patch_size 96 --n_resblock 8 --loss 1*L1 --n_feats 128 --save task8urban128 --save_gt --save_results --reset --test_only --pre_train ../experiment/task8_srcnn_basicx2_8_128/modelcopy/model_best.pt

#python main.py --model SRCNN_BASIC --scale 2 --data_test Urban100 --patch_size 96 --n_resblock 8 --loss 1*MSE --save task9urban --save_gt --save_results --reset --test_only --pre_train ../experiment/task9_srcnn_basicx2_mse/modelcopy/model_best.pt

#python main.py --model SRCNN_BASIC --scale 2 --data_test Urban100 --patch_size 96 --n_resblock 8 --loss 1*VGG54 --save task11urban --save_gt --save_results --reset --test_only --pre_train ../experiment/task11_srcnn_basicx2_vgg/model/model_best.pt


#python main.py --model BICUBIC_INPUT_MODEL --scale 4 --data_test Set5 --patch_size 192 --n_resblock 3 --batch_norm false --save task1_bicubic_input_modelx4_3_set5 --save_gt --save_results --reset --test_only --pre_train ../experiment/task1_bicubic_input_modelx4_3/model/model_best.pt

#python main.py --model BICUBIC_INPUT_MODEL --scale 3 --data_test Set14 --patch_size 144 --n_resblock 3 --batch_norm false --save task1_bicubic_input_modelx3_3_set14 --save_gt --save_results --reset --test_only --pre_train ../experiment/task1_bicubic_input_modelx3_3/model/model_best.pt



###############################################################################################################################


# EDSR baseline model (x2) + JPEG augmentation

#python main.py --model EDSR  --scale 2 --patch_size 96 --save edsr_baseline_x2 --reset

python main.py --model BICUBIC_INPUT_MODEL_GRC --scale 2 --patch_size 96 --n_resblock 3 --save bicubic_input_model_grcx2 --save_gt --save_results --reset

# EDSR baseline model (x3) - from EDSR baseline model (x2)
#python main.py --model EDSR --scale 3 --patch_size 144 --save edsr_baseline_x3 --reset --pre_train [pre-trained EDSR_baseline_x2 model dir]

# EDSR baseline model (x4) - from EDSR baseline model (x2)
#python main.py --model EDSR --scale 4 --save edsr_baseline_x4 --reset --pre_train [pre-trained EDSR_baseline_x2 model dir]

# EDSR in the paper (x2)
#python main.py --model EDSR --scale 2 --save edsr_x2 --n_resblocks 32 --n_feats 256 --res_scale 0.1 --reset

# EDSR in the paper (x3) - from EDSR (x2)
#python main.py --model EDSR --scale 3 --save edsr_x3 --n_resblocks 32 --n_feats 256 --res_scale 0.1 --reset --pre_train [pre-trained EDSR model dir]

# EDSR in the paper (x4) - from EDSR (x2)
#python main.py --model EDSR --scale 4 --save edsr_x4 --n_resblocks 32 --n_feats 256 --res_scale 0.1 --reset --pre_train [pre-trained EDSR_x2 model dir]

# MDSR baseline model
#python main.py --template MDSR --model MDSR --scale 2+3+4 --save MDSR_baseline --reset --save_models

# MDSR in the paper
#python main.py --template MDSR --model MDSR --scale 2+3+4 --n_resblocks 80 --save MDSR --reset --save_models

# Standard benchmarks (Ex. EDSR_baseline_x4)
#python main.py --data_test Set5 --data_range 801-900 --scale 4 --pre_train download --test_only --self_ensemble

#python main.py --data_test Set5+Set14+B100+Urban100+DIV2K --data_range 801-900 --scale 4 --n_resblocks 32 --n_feats 256 --res_scale 0.1 --pre_train download --test_only --self_ensemble

# Test your own images
#python main.py --data_test Demo --scale 4 --pre_train download --test_only --save_results

# Advanced - Test with JPEG images 
#python main.py --model MDSR --data_test Demo --scale 2+3+4 --pre_train download --test_only --save_results

# Advanced - Training with adversarial loss
#python main.py --template GAN --scale 4 --save edsr_gan --reset --patch_size 96 --loss 5*VGG54+0.15*GAN --pre_train download

# RDN BI model (x2)
#python3.6 main.py --scale 2 --save RDN_D16C8G64_BIx2 --model RDN --epochs 200 --batch_size 16 --data_range 801-805 --patch_size 64 --reset
# RDN BI model (x3)
#python3.6 main.py --scale 3 --save RDN_D16C8G64_BIx3 --model RDN --epochs 200 --batch_size 16 --data_range 801-805 --patch_size 96 --reset
# RDN BI model (x4)
#python3.6 main.py --scale 4 --save RDN_D16C8G64_BIx4 --model RDN --epochs 200 --batch_size 16 --data_range 801-805 --patch_size 128 --reset

# RCAN_BIX2_G10R20P48, input=48x48, output=96x96
# pretrained model can be downloaded from https://www.dropbox.com/s/mjbcqkd4nwhr6nu/models_ECCV2018RCAN.zip?dl=0
#python main.py --template RCAN --save RCAN_BIX2_G10R20P48 --scale 2 --reset --save_results --patch_size 96
# RCAN_BIX3_G10R20P48, input=48x48, output=144x144
#python main.py --template RCAN --save RCAN_BIX3_G10R20P48 --scale 3 --reset --save_results --patch_size 144 --pre_train ../experiment/model/RCAN_BIX2.pt
# RCAN_BIX4_G10R20P48, input=48x48, output=192x192
#python main.py --template RCAN --save RCAN_BIX4_G10R20P48 --scale 4 --reset --save_results --patch_size 192 --pre_train ../experiment/model/RCAN_BIX2.pt
# RCAN_BIX8_G10R20P48, input=48x48, output=384x384
#python main.py --template RCAN --save RCAN_BIX8_G10R20P48 --scale 8 --reset --save_results --patch_size 384 --pre_train ../experiment/model/RCAN_BIX2.pt


