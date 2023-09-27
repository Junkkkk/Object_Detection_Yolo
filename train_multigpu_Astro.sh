#!/bin/bash

#no pretrained (230126)
#python3 -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py --workers 64 --device 0,1,2,3,4,5,6,7 --sync-bn --batch-size 64 --data data/hyp.Xray.Astro_orig.yaml --img-size 1080 1920 --cfg cfg/training/yolov7.yaml --weights '' --name Xray_Astro_orig_not_pretrained_multiGPU --hyp data/hyp.scratch.p5.yaml &

#no pretrained + image preprocessing 640 (230128)
#python3 -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py --workers 64 --device 0,1,2,3,4,5,6,7 --sync-bn --batch-size 64 --data data/hyp.Xray.Astro_preprocessing640.yaml --img-size 640 640 --cfg cfg/training/yolov7.yaml --weights 'yolov7_training.pt' --name Xray_Astro_preprocessing_pretrained_multiGPU --hyp data/hyp.scratch.p5.yaml
#--weights 'yolov7_training.pt'

#pretrained (230131)
#python3 -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py --workers 64 --device 0,1,2,3,4,5,6,7 --sync-bn --batch-size 64 --data data/hyp.Xray.Astro_orig.yaml --img-size 1080 1920 --cfg cfg/training/yolov7.yaml --weights 'yolov7_training.pt' --name Xray_Astro_orig_pretrained_multiGPU --hyp data/hyp.scratch.p5.yaml

#pretrained (230214)
python3 -m torch.distributed.launch --nproc_per_node 8 --master_port 9527 train.py --workers 96 --device 0,1,2,3,4,5,6,7 --sync-bn --batch-size 96 --data data/hyp.Xray.Astro_orig.yaml --img-size-train 1050 1680 --cfg cfg/training/yolov7.yaml --weights ''  --name Xray_Astro_orig_multiGPU_rect --hyp data/hyp.scratch.p5.yaml