#!/bin/bash
#Rapi
python detect.py --device 0 --source /tf/storage/nrcdbox/data/Xray/Train_Smith/orig/images/test/ --weights ./runs/train/Xray_Rapi_orig_multiGPU_rect/weights/best.pt --conf 0.25 --name Xray_Rapi2Smith_orig_not_pretrained_multiGPU_val --img-size-h 1050 --img-size-w 1680 --project /tf/storage/result/xray/rapi/detect_230308

#Smith
#python detect.py --device 7 --source /tf/storage/nrcdbox/data/Xray/Train_Smith/orig/images/test/ --weights ./runs/train/Xray_Smith_orig_multiGPU_rect/weights/best.pt --conf 0.25 --name Xray_Smith_orig_not_pretrained_multiGPU_val --img-size-h 1050 --img-size-w 1680 --project /tf/storage/result/xray/smith/detect_230308
