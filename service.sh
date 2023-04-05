#!/system/bin/sh
MODDIR=${0%/*}
a=$(getprop ro.system.build.version.release)
b=$(getprop ro.system.build.version.incremental)
if [ $a == "13" ]; then
    if [ $b =="V14.0.23.1.9.DEV" ]; then
	    mkdir -p $MODDIR/system/product/app/
	    cp -r "$MODDIR/system/product/app/MiSound" "$MODDIR/system/product/app/"
		pm install -r "$MODDIR/system/product/app/MiSound/MiSound.apk"
		sleep 0.5s
	    pm enable com.miui.misound
	    else
		    mkdir -p $MODDIR/system/app
	    cp -r "$MODDIR/system/product/app/MiSound" "$MODDIR/system/app/"
		pm install -r "$MODDIR/system/product/app/MiSound/MiSound.apk"
		sleep 0.5s
	    pm enable com.miui.misound
    fi
	else
	    mkdir -p $MODDIR/system/app
	cp -r "$MODDIR/system/product/app/MiSound" "$MODDIR/system/app/"
	pm install -r "$MODDIR/system/product/app/MiSound/MiSound.apk"
	sleep 0.5s
	pm enable com.miui.misound
fi

wait_until_login() {
    # in case of /data encryption is disabled
    while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep 1
    done
    # we doesn't have the permission to rw "/sdcard" before the user unlocks the screen
    local test_file="/sdcard/Android/.XAGASOUNDBOOST_PERMISSION_TEST"
    true >"$test_file"
    while [ ! -f "$test_file" ]; do
        true >"$test_file"
        sleep 1
    done
    rm "$test_file"
    sleep 0.5s
    sh "$MODDIR/config/Huber_Audio_Main.sh"
}