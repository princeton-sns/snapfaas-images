#!/usr/bin/env bash

/usr/bin/setup-eth0.sh
/usr/bin/ioctl
java -cp ".:/bin/*" -Djava.library.path=/bin bin.workload
