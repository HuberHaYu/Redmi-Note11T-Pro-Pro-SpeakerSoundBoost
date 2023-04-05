#!/system/bin/sh

chmod +x Huber_Audio_Main.sh

# Find ID
pid=$(pidof james.dsp)
misound=$(pidof com.miui.misound)

# Volume Change Start
if [ -n "$misound" ]; then
    sleep 7s
    cp -f /data/adb/modules/N11T/sound_shared_prefs/sound_transmit_loopback_mode.xml /data/data/com.miui.misound/shared_prefs
    sleep 0.7s
    cp -f /data/adb/modules/N11T/sound_shared_prefs/dirac.xml /data/data/com.miui.misound/shared_prefs
    am force-stop com.miui.misound
    am force-stop com.android.settings
    kill "$misound"
    sleep 0.8s
    am start com.miui.misound/com.miui.misound.HeadsetSettingsActivity
    sleep 1.2s
    input keyevent KEYCODE_BACK
fi