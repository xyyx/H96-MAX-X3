![Photo](https://github.com/xyyx/H96-MAX-X3/raw/master/img.jpg "Photo")
------------
How to use this driver on H96 MAX X3 or Vontar X3?

- You need to have adb or Root Explorer
- You should copy prebuilts.sh to /system/bin
- You should copy custom folder to /sdcard
- If you want to have "boot" label during booting:
  - You should copy openvfd.ko to /vendor/lib/modules and init.amlogic.rc to /vendor/etc/init/hw
- otherwise:
   - Edit custom.sh file with uncommenting #insmod /sdcard/custom/openvfd.ko
- Also you MUST flash new dtb.img
  - open adb shell or terminal on device and execute dd if=/sdcard/custom/dtb.img of=/dev/dtb
- And copy /sdcard/custom/OpenVFD.apk to /system/app/OpenVFD with permissions (755)
- OpenVFD doesn't have options but it has sources. By default it shows CPU temp for 15 sec every 5 minutes and it has night mode. Night mode turns alarm icon and changes brightness to 1 from 22.00 to 10.00. Default brightness is 5. 
- If you use KODI, you can use kodi plugin instead of OpenVFD.apk - https://github.com/xyyx/service.openvfd
  - Download it as zip and install


-------------
- OpenVFD sources - https://github.com/xyyx/OpenVFD
- dtb.img sources - https://github.com/xyyx/H96-MAX-X3/blob/master/sm1_s905x3_u215_new.dts
- OpenVFDService sources - https://github.com/xyyx/android_OpenVFDService
- openvfd module's sources - https://github.com/xyyx/linux_openvfd


