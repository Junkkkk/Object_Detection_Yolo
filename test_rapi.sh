#!/bin/bash
#Rapi
#python detect.py --device 0 --source /tf/storage/nrcdbox/data/Xray/Train_Rapi/orig/images/test/ --weights ./runs/train/Xray_Rapi_orig_multiGPU_rect/weights/best.pt --conf 0.25 --name Xray_Rapi_orig_not_pretrained_multiGPU_val --img-size-h 1050 --img-size-w 1680 --project /tf/storage/result/xray/rapi/detect_230308

#Smith
python test.py --conf-thres 0.001 --iou-thre 0.65 --task test --device 7 --data data/hyp.Xray.Rapi_orig.yaml --weights ./runs/train/Xray_Rapi_orig_multiGPU_rect/weights/best.pt --conf 0.25 --name Xray_Rapi_orig_not_pretrained_multiGPU_val --img-size-h 1050 --img-size-w 1680 --project /tf/storage/result/xray/rapi/test_230308