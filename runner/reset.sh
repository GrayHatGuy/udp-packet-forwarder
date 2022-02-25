#!/usr/bin/env bash

RESET_GPIO=${RESET_GPIO:-17}
POWER_EN_GPIO=${POWER_EN_GPIO:-0}
POWER_EN_LOGIC=${POWER_EN_LOGIC:-1}

GPIOSET="gpioset -m time -u 100000 gpiochip0"

# Enable gateway
if [[ $POWER_EN_GPIO -ne 0 ]]; then
    echo "Concentrator enabled through GPIO$POWER_EN_GPIO"
    ${GPIOSET} ${POWER_EN_GPIO}=${POWER_EN_LOGIC}
fi

# Reset gateway
if [[ $RESET_GPIO -ne 0 ]]; then
    echo "Concentrator reset through GPIO$RESET_GPIO"
    ${GPIOSET} ${RESET_GPIO}=0
    ${GPIOSET} ${RESET_GPIO}=1
    ${GPIOSET} ${RESET_GPIO}=0
fi

exit 0
