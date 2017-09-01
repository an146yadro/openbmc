#!/bin/sh

path="/sys/bus/i2c/drivers/w83795"


if [ -e $path ]
then
    echo 12-002f > $path/unbind
fi


i2cset -y 12 0x2f 0x0 0x82 b
i2cset -y 12 0x2f 0xc 0xff b


if [ -e $path ]
then
    echo 12-002f > $path/bind
fi
