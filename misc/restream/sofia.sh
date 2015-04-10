#!/bin/bash
while /bin/true; do
ffmpeg  -i rtmp://127.0.0.1/openfest/sofia-raw -c:v libx264 -s 1280x720 -profile:v high -level 4.2 -preset ultrafast -filter:v yadif -g 60 -b:v 2000k -acodec aac -ar 44100 -ac 2 -bsf:a aac_adtstoasc -flags +global_header -strict -2 -threads 2 -f tee -map 0:v -map 0:a "[f=flv]rtmp://localhost/openfest/sofia|[f=flv]rtmp://grendel.ludost.net/openfest/sofia"  -c:v libx264 -s 854x480 -profile:v high -level 4.2 -preset ultrafast -filter:v yadif -g 60 -b:v 500k -acodec aac -ar 44100 -ac 2 -bsf:a aac_adtstoasc -flags +global_header -strict -2 -threads 2 -f tee -map 0:v -map 0:a "[f=flv]rtmp://grendel.ludost.net/openfest/sofia-low|[f=flv]rtmp://localhost/openfest/sofia-low"

done

#ffmpeg -re -i 'udp://@10.4.0.1:2600?overrun_nonfatal=1&buffer_size=81921024&fifo_size=178481' -c:v libx264 -s 1280x720 -profile:v high -level 4.2 -preset ultrafast -filter:v yadif -g 60 -b:v 2000k -acodec aac -ar 44100 -ac 2 -bsf:a aac_adtstoasc -flags +global_header -strict -2 -threads 2 -f tee -map 0:v -map 0:a "[f=flv]rtmp://localhost/openfest/kur|[f=flv]rtmp://localhost/openfest/sofia"
