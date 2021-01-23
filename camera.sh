#!/bin/bash
DATE=$(date +"%Y-%m-%d_%H%M")
raspistill -w 1920 -h 1080 -o /home/pi/camera/$DATE.jpg
