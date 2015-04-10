wifis="10.0.1.10 10.0.1.11 10.0.1.12 10.0.1.13 10.0.1.16 10.0.1.19 10.0.1.20"
for wifi in $wifis; do
  ssh $wifi 'wifi up';
 # ssh $wifi 'uname -a; iwinfo wlan0 a | grep '..\:..\:' | wc -l; iwinfo wlan1 a | grep '..\:..\:' | wc -l';
done
