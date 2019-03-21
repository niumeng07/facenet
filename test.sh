#!/bin/sh
export PYTHONPATH=/Users/liuda/Local/code/facenet/src

for N in {1..4}; do \
python src/align/align_dataset_mtcnn.py \
./datasets/lfw-mini/raw2/ \
./datasets/lfw-mini/lfw_mtcnnpy_160 \
--image_size 160 \
--margin 32 \
--random_order \
--gpu_memory_fraction 0 \
& done

python src/compare.py models/20180408-102900 datasets/lfw-mini/lfw_mtcnnpy_160/Xiaochu/* --gpu_memory_fraction=0.0

exit 0

python src/validate_on_lfw.py \
./datasets/lfw-mini/lfw_mtcnnpy_160 \
./models/20180402-114759 \
--distance_metric 1 \
--lfw_pairs data/pairs2.txt \
--use_flipped_images \
--subtract_mean \
--use_fixed_image_standardization

