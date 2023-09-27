#!/bin/bash

python3 
-m torch.distributed.launch 
--nproc_per_node 4 
--master_port 9527 train.py 
--workers 8 
--device 0,1,2,3 
--sync-bn 
--batch-size 32 
--data data/threat_NIA.yaml
--img-size-train 1050 1680 
--cfg cfg/training/yolov7.yaml 
--weights '' 
--name threat_NIA1 
--hyp data/hyp.scratch.p5.yaml


python3 -m torch.distributed.launch --nproc_per_node 4 --master_port 9527 train.py --workers 8 --device 0,1,2,3 --sync-bn --batch-size 4 --data data/threat_NIA.yaml --img-size-train 1050 1680 --cfg cfg/training/yolov7.yaml --weights '' --name threat_NIA1 --hyp data/hyp.scratch.p5.yaml