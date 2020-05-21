#!/system/bin/sh

sh /storage/emulated/0/custom/custom.sh

MARK=/data/local/symbol_thirdpart_apks_installed
PKGS=/system/preinstall/

VLC_DIR=/data/data/org.videolan.vlc
VLC_CFG=/system/media/org.videolan.vlc_preferences.xml

if [ ! -e $MARK ]; then
echo "booting the first time, so pre-install some APKs."

sleep 10

if [ ! -e /sdcard/Download ];then
sleep 60
fi

pm grant com.liskovsoft.videomanager android.permission.READ_EXTERNAL_STORAGE
pm grant com.liskovsoft.videomanager android.permission.WRITE_EXTERNAL_STORAGE


find $PKGS -name "*\.apk" -exec sh /system/bin/pm install -g {} \;


if [ -e $VLC_DIR ];then
if [ ! -e $VLC_DIR/shared_prefs/ ];then
mkdir $VLC_DIR/shared_prefs/
chmod 777 $VLC_DIR/shared_prefs/
fi
cp -rf $VLC_CFG  $VLC_DIR/shared_prefs/
chmod 777 /data/data/org.videolan.vlc/shared_prefs/org.videolan.vlc_preferences.xml
fi

tar -zxf /system/etc/mediaclient.tar.gz -C /data/data/
chmod 777 -R /data/data/com.netflix.mediaclient

touch $MARK


echo "OK, installation complete."
fi

#am broadcast  -a com.android.PreInstall -e apk_install true


