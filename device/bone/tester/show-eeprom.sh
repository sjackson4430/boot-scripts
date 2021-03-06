#!/bin/bash -e

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

eeprom="/sys/bus/i2c/devices/0-0050/eeprom"
eeprom_header=$(hexdump -e '8/1 "%c"' ${eeprom} -n 16)
eeprom_raw=$(hexdump ${eeprom} -n 8 | grep -v 0000008)
echo "eeprom: [${eeprom_header}]"
echo "eeprom raw: [${eeprom_raw}]"
