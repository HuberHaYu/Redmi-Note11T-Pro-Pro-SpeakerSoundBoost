#!/system/bin/sh
setprop mic.volume 7
cp_conf(){
modpath="/data/adb/modules"
conf="/data/data/com.miui.misound/shared_prefs/mi_sound_preference.xml"
cp -f $modpath/XagaSoundBoostTest/config/normal.xml $conf
}
cp_conf
