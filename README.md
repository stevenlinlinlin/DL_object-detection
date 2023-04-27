# Object Detection
use Deep Learning to detect objects in a picture

## Environment
- ubuntu 20.04
- RTX 3080
- python 3.10
- pytorch 1.13.1

## Dataset
- like COCO dataset format with annotations
- 8 classes in ocean : creatures, fish, jellyfish, penguin, puffin, shark, starfish, stingray
### prepare dataset
1. need to mkdir `/data/images` and `./data/labels` for train and test
    ```
    data 
    ├── train
    │   ├── images
    │   └── labels
    ├── valid
    │   ├── images
    │   └── labels
    └── test
        └── images
    ```
2. transform annotation format(.json) from COCO to YOLO (.txt)
    ```
    python coco2yolo.py [json file path(annotations)] [output folder path]
    ```


## YOLOv7 (You Only Look Once)
This is a simple implementation of YOLOv7 in PyTorch for object detection. (CNN-based model)
### data input
- change the path in ./yolov7/data/custom.yaml
### install my weight or ignore this step for training

```
bash download_weights.sh
```
- also can download official weights from [here](https://github.com/WongKinYiu/yolov7)
### train
- training steps is in ./runs/train/exp
```
python train.py --workers 8 --device 0 --batch-size 8 --data data/custom.yaml --cfg cfg/training/yolov7.yaml --weights [training_weights] --name yolov73 --hyp data/hyp.scratch.p5.yaml
```
- training_weights (pretrained weights) : ./weights/yolov7.pt
### test
- image prediction is in ./runs/detect/exp
```
python ./yolov7/detect.py --weights [model_weights_path] --conf 0.25 --img-size 640 --nosave --no-trace --save-json --source [test images path] --save_json_path [output json path] \
```
- test images path : ./data/test/images
- output json path : ./data/test/labels

## Evaluation
- mAP (mean Average Precision)
- IoU (Intersection over Union)
```
python check_your_prediction_valid.py [prediction folder path] [ground truth folder path]
```

## Reference
https://github.com/WongKinYiu/yolov7

