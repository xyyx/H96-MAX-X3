#!/system/bin/sh

# --- LCD ---
folder_tmp=/data/tmp

if [ ! -d "$folder_tmp" ]; then
	mkdir -p $folder_tmp
	chmod 777 /data/tmp
fi

while [ ! -d "/sdcard" ]
	do echo "Sdcard Fail" > /dev/null
done

#insmod /sdcard/custom/openvfd.ko
#insmod /sdcard/custom/openvfd.ko vfd_gpio_clk='0,65,0' vfd_gpio_dat='0,64,0' vfd_gpio_stb='0,0,0xFF' vfd_gpio0='0,0,0xFF' vfd_gpio1='0,0,0xFF' vfd_gpio2='0,0,0xFF' vfd_gpio3='0,0,0xFF' vfd_gpio_protocol='0,0' vfd_chars='0,4,3,2,1' vfd_dot_bits='0,1,3,2,4,5,6' vfd_display_type='0x00,0x00,0x00,0x06'
	
chmod 777 /sys/class/leds/openvfd/brightness
chmod 777 /sys/class/leds/openvfd/led_cmd
chmod 777 /sys/class/leds/openvfd/led_on
chmod 777 /sys/class/leds/openvfd/led_off
chmod 777 /sys/class/leds/openvfd/max_brightness

if [ ! -e "/data/tmp/OpenVFDService" ]; then
	cp /sdcard/custom/OpenVFDService /data/tmp
	chmod 777 /data/tmp/OpenVFDService
fi

/data/tmp/OpenVFDService &
if [ "$(ps -e | grep "OpenVFDService")" ]; then 
	chmod 777 /data/tmp/openvfd_service
fi
echo -n -e '\x03M\x04@\x05\x00\x00\x00' > /sys/class/leds/openvfd/led_cmd
