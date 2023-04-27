#!/bin/bash

# download yolov7 weights(best.pt) from google drive
wget 'https://www.dropbox.com/s/9y6bcqu8wkpuhcd/yolov7-best.zip?dl=1' -O ./yolov7-best.zip
unzip ./yolov7-best.zip 
rm ./yolov7-best.zip