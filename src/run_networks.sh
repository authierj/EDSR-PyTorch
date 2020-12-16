#!/bin/bash
source /usr/itetnas04/data-scratch-01/dlim_04hs20/data/conda/etc/profile.d/conda.sh
conda activate DLIM_project

#	test_only

python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task1/scale2/model/model_best.pt  --save task1urbanx2--reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task1/scale3/model/model_best.pt  --save task1urbanx3--reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task1/scale4/model/model_best.pt  --save task1urbanx3--reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task2/model/model_best.pt --save task2urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task3/model/model_best.pt --save task3urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task4/model/model_best.pt --save task4urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task5/model/model_best.pt --save task5urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task6/model/model_best.pt --save task6urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task7leaky/model/model_best.pt --save task7leakyurban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task7PreLU/model/model_best.pt --save task7preluurban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task8/scale2_8_128/modelcopy/model_best.pt --save task8_8_128urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task8/scale2_8_96/modelcopy/model_best.pt --save task8_8_96urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task8/scale2_16_64/modelcopy/model_best.pt --save task8_16_646urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task8/scale2_32_64/modelcopy/model_best.pt --save task8_32_646urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task9/modelcopy/model_best.pt --save task9urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task10/model/model_best.pt --save task10urban --reset
python main.py --test_only --save_results --data_test Urban100  --pre_train ../experiment/task11/modelcopy/model_best.pt --save task11urban --reset
