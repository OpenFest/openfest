#!/bin/bash

perl /usr/local/bin/leasecheck.pl | xargs -n 1 conntrack -D -s 2>/dev/null
