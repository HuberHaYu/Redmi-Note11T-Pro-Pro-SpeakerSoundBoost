AUTOMOUNT=true
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true
SKIPMOUNT=false
DEBUG=true

print_modname() {
  ui_print "***********************"
  ui_print "MiSoundBOOST!!!!"
  ui_print "Design By Huber_HaYu 以及团队的支持"
  ui_print "SetoSkins big_chair bug_casc（本模块协助成员）"
  ui_print "感谢各位的支持和帮助"
  ui_print "***********************"
}

set_permissions() {
  set_perm  $MODPATH/system/app/MiSound/MiSound.apk  0  0  0644
  set_perm  $MODPATH/system/priv-app/MusicFX/MusicFX.apk  0  0  0644
}

# 【本模块纯参数调音，如需引用调音文件请注明作者】
sleep 0.4s
ui_print "⚠注意⚠：【本模块为纯参数调音，如需引用调音文件请注明作者】"
sleep 0.7s
ui_print "------------------------------"
ui_print "【团队感谢：SetoSkins(代码) shadow3(代码) 灵聚、神生(代码)"
ui_print "mly墨临渊(调音、调试) 中二的番茄（辅助调音） big_chair(辅助调音) bug_casc(辅助调音)】"
ui_print "------------------------------"
sleep 0.4s
ui_print "NFC Fix Patched.."
sleep 1s
#Pangu Fix
a=$(getprop ro.system.build.version.release)
if [ $a == "13" ]; then
    ui_print "Android Version:$a"
    sleep 0.5s
    ui_print "Fixing.."
    sleep 1s
    mkdir -p $MODPATH/system/product/
    cp -r /product/pangu/system/* $MODPATH/system/product/
fi    
if [ $a == "12" ]; then
    ui_print "无需修复 已跳过"
fi