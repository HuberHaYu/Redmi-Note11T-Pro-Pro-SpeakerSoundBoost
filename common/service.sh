#!/system/bin/sh
BASEDIR="$(dirname "$0")"
BIN_PATH="$BASEDIR/config/bin"
MODDIR=${0%/*}

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
}
#pangu fix
mkdir -p $MODPATH/system/product/
cp -r /product/pangu/system/* $MODPATH/system/product/
wait_until_login
chmod a+x $MODDIR/mly
nohup $MODDIR/mly > /dev/null 2>&1 &