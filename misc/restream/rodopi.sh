#!/bin/bash

ffmpeg -re -i 'udp://@10.90.0.1:2600?overrun_nonfatal=1&buffer_size=81921024&fifo_size=178481' -c:v libx264 -s 1280x720 -profile:v baseline -level 3.1 -preset ultrafast -filter:v yadif -g 60 -b:v 1000k -acodec aac -ar 44100 -ac 2 -strict -2 -threads 2 -f flv "rtmp://bsdcon.getclouder.com/strm/rodopi"
