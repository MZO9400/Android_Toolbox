@echo off
title                                                   ANDROID TOOLBOX
mode con:cols=80 lines=40
:enter
cls
echo How do you want to connect to your phone?
echo.
echo 1] Through cable
echo.
echo 2] Through IP connection.
echo.
echo 3] Continue without connection
echo.
echo X] EXIT
echo.

set /p ipconnect=Enter your choice:  

if /i '%ipconnect%' == '1' goto first
if /i '%ipconnect%' == '2' goto second
if /i '%ipconnect%' == '3' goto start
if /i '%ipconnect%' == 'X' goto end
cls
echo Error occured, please enter a valid choice
pause>nul
goto enter


:second
files\adb start-server>nul
cls
echo Enter IP please...
echo.
set /p ip=Enter your IP address:  
files\adb connect %ip%
pause>nul
goto start


:first
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
color 0E
echo                      Connecting with device through USB
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    If this is taking longer than usual then please check if your handset is 
echo                   connected properly and USB DEBUGGING is on
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo             ------------------------------------------------
echo             --	                                          --
echo             --	             TOOL MADE BY MZO             --
echo             --	                                          --
echo             ------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                    TIME: %TIME%
echo                                                    DATE: %DATE%
echo.
files\adb wait-for-device>nul
color 07
cls
echo Device found...
echo.
echo.
echo          BY PRESSING ENTER YOU AGREE WITH REGULAR TERMS AND CONDITIONS
pause>nul
goto start











:extras
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo [T] Themes
echo.
echo [C] CREDITS
echo.
echo [X] END program
echo.
echo [N] NOTES
echo.
echo [B] Go back
echo.

set /p choice=Enter your choice:  

if /i '%choice%' == 'N' goto notes
if /i '%choice%' == 'C' goto credits
if /i '%choice%' == 'X' goto end
if /i '%choice%' == 'T' goto color
if /i '%choice%' == 'B' goto start
cls
goto extras

:notes
cls
echo.
echo.
echo 6) Would only work on phones that have insecure bootloader and support FASTBOOT commands
echo.
echo.
echo.
echo 9) Make sure the files you're trying to flash are in 
echo    "%CD%\files directory"
echo    system.img files are factory images. System.img can only be
echo    flashed if you're trying to flash a factory IMAGE
echo.
echo.
echo.
echo 10) This will not overwrite your previous boot/recovery... 
echo     It will only boot from it,
echo     if you get errors or get in bootloop/soft brick, simply restart the phone! 
echo     IT SHOULD WORK
echo.
echo.
echo.
echo 14) You must place a file named "bootanimation.zip" in %CD%\
echo.
echo.
echo.
echo 16) This will wipe your internal memory as well, make sure you have an external SDCard for zip
echo.
echo.
echo.
echo 19) This will wipe your internal memory as well!
echo.
echo.
echo.
echo If you see any Superuser prompts please accept them
echo.
pause>nul
cls
color 07
cls
echo --------------------------------------------------------------------------------------------------
echo YOU CAN USE THIS TOOL ANYWHERE BUT PLEASE MENTION ME OR MY POSTS IF YOU DO SO!
pause>nul
goto start

:credits
cls
echo             ------------------------------------------------
echo             --	                                          --
echo             --	             TOOL MADE BY MZO             --
echo             --	                                          --
echo             ------------------------------------------------
echo.
echo.
echo                                                    TIME: %TIME%
echo                                                    DATE: %DATE%
echo.
start www.facebook.com/MZ112000
start http://forum.xda-developers.com/member.php?u=6304619
start http://forum.xda-developers.com/android/software/tool-android-ultimate-toolbox-t3061525/post59618784
color f0
pause>nul
echo HIT THANKS IF YOU LIKED THIS TOOL
pause>nul
goto start

:end
adb kill-server
cls
color f4
Echo                                  Goodbye %USERNAME%
pause>nul
exit

:color
cls
echo 0 = Black
echo 1 = Blue
echo 2 = Green
echo 3 = Aqua
echo 4 = Red
echo 5 = Purple
echo 6 = Yellow
echo 7 = White
echo 8 = Gray
echo 9 = Light Blue
echo A = Light Green
echo B = Light Aqua
echo C = Light Red
echo D = Light Purple
echo E = Light Yellow
echo F = Bright White
echo.
set /p forg= Enter your color for text?  
set /p backg=Which color do you want as background?  
goto Col

:Col
if %backg%==%forg%  goto color
cls
color %backg%%forg%
echo Color set!
echo Your choice: %backg%%forg%
pause>nul
goto start





:start
cls
echo.                        [P]revious    PAGE: 1    [N]ext
echo.
echo.
echo.
echo.
echo Choices:
echo.
echo.
echo.
echo.
echo [E] Extras
echo.
echo [1] Check your device's connection
echo.
echo [2] Reboot
echo.
echo [3] Make a full BACKUP in .ab format
echo.
echo [4] Pull a nandroid (CWM/TWRP)
echo.
echo [5] Get system logcats
echo.
echo [6] Unlock/relock bootloader (SEE NOTES)
echo.
echo [7] Sideload an update.zip file
echo.
echo [8] Check your device in fastboot list
echo.
echo [9] Flash recovery/boot from fastboot (SEE NOTES)
echo.
echo [10] Boot from a recovery/boot through fastboot (SEE NOTES)
echo.
echo.
echo.

set /p choice=Enter your choice: 
cls
if /i '%choice%' == 'E' goto extras
if /i '%choice%' == '1' goto devicecheck
if /i '%choice%' == '2' goto reboot
if /i '%choice%' == '3' goto abackup
if /i '%choice%' == '4' goto pullnandroid
if /i '%choice%' == '5' goto logs
if /i '%choice%' == '6' goto bootloader
if /i '%choice%' == '7' goto sideload
if /i '%choice%' == '8' goto fastcheck
if /i '%choice%' == '9' goto fastflash
if /i '%choice%' == '10' goto fastboot
if /i '%choice%' == 'N' goto page2
cls
echo Error occured
pause>nul
goto start

---------------------------------------------------

:devicecheck
files\adb devices
echo.
@echo If you see random numbers and letters and got "device" on right side, it means that you're OK to proceed
pause>nul
goto start

---------------------------------------------------

:reboot
cls
echo 1) Simple reboot
echo.
echo 2) Reboot into recovery
echo.
echo 3) Reboot into bootloader mode
echo.
echo 4) Reboot into download mode (SEE NOTES)
echo.
echo 5) Go back
set /p reb=Enter your choice:  
if /i '%reb%'=='1' goto reb
if /i '%reb%'=='2' goto rebr
if /i '%reb%'=='3' goto rebf
if /i '%reb%'=='4' goto rebd
if /i '%reb%'=='5' goto start
echo Incorrect choice
pause>nul
cls
goto reboot

:reb
files\adb reboot
goto start

:rebr
files\adb reboot recovery
goto start

:rebf
files\adb reboot bootloader
goto start

:rebd
files\adb reboot download
goto start

---------------------------------------------------

:abackup
cls
echo MAKING A BACKUP
mkdir BACKUPS
files\adb backup –all -apk -shared –f
move backup.ab BACKUPS
goto start

---------------------------------------------------

:pullnandroid
cls
echo Please enter a choice from below
echo.
echo 1)TWRP backup
echo.
echo 2)ClockWorkMod NANDROID
echo.
echo 3)Go back

set /p nand=CHOICE:  
if '%nand%'=='1' goto twrpn
if '%nand%'=='2' goto cwmn
if '%nand%'=='3' goto start
echo Error occured, please enter correct value
pause>nul
goto pullnandroid

:twrpn
mkdir TWRP
files\adb pull /sdcard/TWRP/ TWRP
goto start

:cwmn
mkdir CWM
files\adb pull /sdcard/ClockWorkMod/ CWM
echo PULLED
pause>nul
goto start

---------------------------------------------------

:logs
cls
files\adb shell logcat > logs.log 
echo LOGS copied
pause>nul
goto start

---------------------------------------------------

:bootloader
echo Please enter a choice
echo.
echo 1) Unlock bootloader
echo.
echo 2) Lock bootloader
echo.
echo 3) Check bootloader's state
echo.
echo 4) Back to main menu
echo.
set /p bl=Chose a number:  

if /i '%bl%'=='1' goto ul
if /i '%bl%'=='2' goto bll
if /i '%bl%'=='4' goto start
if /i '%bl%'=='3' goto blcheck
cls
echo Please enter a right choice.
pause>nul
cls
goto bootloader

:blcheck
cls
echo DEVICE INFO:
echo.
echo.
fastboot oem device-info
pause>nul
goto bootloader

:ul
cls
echo Please see notes
files\adb reboot bootloader
files\fastboot oem unlock>nul
>nul
echo DONE
pause>nul
goto booloader
:bll
cls
set /p sure=ARE YOU SURE? (YES/NO):  
if /i '%sure%'=='YES' goto blln
if /i '%sure%'=='NO' goto bootloader
echo Invalid choice
pause>nul
cls
goto bootloader

:blln
cls
echo ---------------------------------------------------------------
files\adb reboot fastboot
files\fastboot oem lock>nul
echo DONE!
pause>nul
goto bootloader

---------------------------------------------------

:sideload
cls
@echo Place update.zip in the "files" subdir
echo Rebooting into recovery
files\adb reboot recovery
echo Please enter sideload mode then continue
pause>nul
files\adb sideload update.zip
@echo SIDELOADED!
files\adb reboot
goto start

---------------------------------------------------

:fastcheck
cls
@echo If you see random numbers/letters on left and FASTBOOT on right, means you're good to go
echo.
echo.
files\fastboot devices
pause>nul
goto start

---------------------------------------------------

:fastflash
cls
echo PLEASE SEE NOTES
pause>nul
cls
echo Please put the .img file in \files subdir
pause>nul
files\adb reboot bootloader

echo WHAT TO FLASH
echo.
echo 1) Recovery
echo.
echo 2) Boot
echo.
echo 3) System
echo.
echo 4) DO NOT FLASH

set /p fl=ENTER A CHOICE:  
if /i '%fl%'=='1' goto flrecovery
if /i '%fl%'=='2' goto flboot
if /i '%fl%'=='3' goto flsystem
if /i '%fl%'=='4' goto start
cls
goto fastflash

:flrecovery
cls
echo Put the recovery file in \files\recovery.img
pause>nul
echo Continuing
files\fastboot flash recovery recovery.img
goto fastflash

:flboot
cls
echo Put the Boot/KERNEL file in \files\boot.img
pause>nul
files\fastboot flash boot boot.img
goto fastflash

:flsystem
cls
echo Put the system file in \files\system.img
pause>nul
echo Flashing now..
files\fastboot flash system system.img
goto fastflash

---------------------------------------------------

:fastboot
cls
echo PLEASE SEE NOTES
pause>nul
cls
echo Boot from?
echo.
echo 1) Recovery
echo.
echo 2) Boot.img\KERNEL
echo.
echo 3) Do not (go back)
echo.
set /p bootfrom=Enter a choice:  
if /i '%bootfrom%'=='1' goto bootrecovery
if /i '%bootfrom%'=='2' goto bootboot
if /i '%bootfrom%'=='3' goto start
echo Error occured, please retry...
pause>nul
cls
goto fastboot

:bootrecovery
cls
echo Booting from recovery... (Looking for recovery in \files\recovery.img)
files\adb reboot bootloader
files\fastboot boot recovery.img
goto fastboot

:bootboot
cls Will boot into custom kernel, looking in \files\boot.img for kernel
files\adb reboot bootloader
files\fastboot boot boot.img
goto fastboot


---------------------------------------------------


---------------------------------------------------


---------------------------------------------------


:page2
cls
echo.                        [P]revious    PAGE: 2    [N]ext
echo.
echo.
echo.
echo.
echo Choices:
echo.
echo.
echo.
echo.
echo [E] Extras
echo.
echo [11] Install bulk APKs
echo.
echo [12] Remount system
echo.
echo [13] UNROOT
echo.
echo [14] Write your own command with syntax
echo.
echo [15] Insecure lockscreen
echo.
echo [16] Wipe to flash a new ROM (SEE NOTES)
echo.
echo [17] Apply update from /SDCARD/
echo.
echo [18] Flash boot animation (SEE NOTES)
echo.
echo [19] Wipe Data / Factory Reset (SEE NOTES)
echo.
echo [20] Restore ADB backup
echo.
echo.
echo.

set /p choice=Enter your choice:  
cls
if /i '%choice%' == 'P' goto start
if /i '%choice%' == 'N' goto page3
if /i '%choice%' == 'E' goto extras
if /i '%choice%' == '11' goto bulkapk
if /i '%choice%' == '12' goto remount
if /i '%choice%' == '13' goto unroot
if /i '%choice%' == '14' goto owncmd
if /i '%choice%' == '15' goto lockscreen
if /i '%choice%' == '16' goto wipe2flash
if /i '%choice%' == '17' goto applysdupdate
if /i '%choice%' == '18' goto bootanim
if /i '%choice%' == '19' goto wdfr
if /i '%choice%' == '20' goto rest
cls
echo Error occured
pause>nul
cls
goto page2

---------------------------------------------------

:bulkapk
cls
echo Installing APKs
mkdir apks
echo Put the apks in \apks directory
pause>nul
move apks\*.apk .\
FOR %%n in (*.apk) DO files\adb install %%n
echo.
move *.apk apks
echo Done
cd..
cd..
goto start

---------------------------------------------------

:remount
cls
echo Mount system:
echo.
echo 1) Read-Write
echo.
echo 2) Read-Only
echo.
echo 3) Go back
set /p mnt=Enter mount type in numbers: 
if /i '%mnt%'=='1' goto rw
if /i '%mnt%'=='2' goto ro
if /i '%mnt%'=='3' goto start
cls
goto remount

:ro
echo Mounting system in read-only mode (ACCPET ANY SUPERUSER PROMPTS)
pause>nul
files\adb shell "su -c 'mount -o remount,ro /system'"
echo DONE
pause>nul
goto start

:rw
echo Mounting system in read-write mode (ACCPET ANY SUPERUSER PROMPTS)
pause>nul
files\adb shell "su -c 'mount -o remount,rw /system'"
echo DONE
pause>nul
goto start

---------------------------------------------------

:unroot
cls
color f4
echo BY PRESSING ENTER YOU KNOW HOW CAN THIS END.
echo ...
echo.
echo.
pause>nul
echo Proceeding now...
timeout /t 01>nul
color 0E
echo.
echo UNROOTING now!
files\adb shell "su -c 'rm /system/app/Superuser.apk'">nul
files\adb shell "su -c 'rm /system/priv-app/Superuser.apk'">nul
files\adb shell "su -c 'rm /system/xbin/busybox'">nul
files\adb shell "su -c 'rm /system/bin/busybox'">nul
files\adb shell "su -c 'rm /system/xbix/su'">nul
files\adb shell "su -c 'rm /system/bin/su'">nul
echo.
echo Rebooting now...
files\adb reboot
echo.
echo Waiting for device to show up...
files\adb wait-for-device
echo.
echo Done!
pause>nul
color 07
goto start

---------------------------------------------------

:owncmd
cls
echo Please enter your own ADB/Fastboot command!
echo.
echo [1] FASTBOOT command
echo.
echo [2] ADB command
echo.
echo [3] Go back
set /p owncommand=Enter your choice:  
if /i '%owncommand%' == '1' goto fbcmd
if /i '%owncommand%' == '2' goto adbcmd
if /i '%owncommand%' == '3' goto start
echo Error occured, please retry
goto owncmd
                                               :fbcmd
set /p commandhere=Enter command:  
files\fastboot %commandhere%
pause>nul
goto owncmd
                                               :adbcmd
set /p commandhere=Enter command:  
files\adb %commandhere%
pause>nul
goto owncmd

---------------------------------------------------

:lockscreen
cls
echo Deleting lockscreens now!
echo ...
timeout /t 02 >nul
files\adb shell "su -c 'rm /data/system/*.key'">nul
timeout /t 02 >nul
echo Done!
echo.
echo Press any key to reboot
pause>nul
cls
echo Rebooting now...
files\adb reboot
echo.
echo Reboot done!
echo.
echo Waiting for device to show up again....
echo.
files\adb wait-for-device
cls
echo Done!
pause>nul
goto start

---------------------------------------------------

:wipe2flash
cls
echo Status:
echo Rebooting into fastboot mode to wipe
files\adb reboot bootloader
timeout /t 01 >nul
cls
echo Status:
echo DONE.
timeout /t 01 >nul
cls
echo Status:
echo Wiping cache userdata and internal SD
files\fastboot -w
timeout /t 01 >nul
cls
echo Status:
echo DONE
timeout /t 01 >nul
cls
echo Status:
echo Wiping system
files\fastboot erase system
timeout /t 04 >nul
cls
echo Status:
echo DONE
timeout /t 01 >nul
cls
echo ALL DONE! Please boot into recovery and flash the packages from SD

---------------------------------------------------

:applysdupdate
cls
set /p toflash=Enter zip's location in /SDCARD/:  
echo.
echo Applying update from SDCARD
echo ...
timeout /t 01 >nul
echo.
echo Rewriting commandline
echo.
files\adb shell su -c "busybox chmod 0777 '/cache/recovery/command'"
files\adb shell su -c "echo 'boot-recovery' > /cache/recovery/command"
files\adb shell su -c "echo '--update_package=/sdcard/%toflash%' > /cache/recovery/command"
echo Rebooting recovery to apply update!
files\adb reboot recovery
pause>nul
goto start

---------------------------------------------------

:bootanim
cls
echo Status:
echo        Starting flash
timeout /t 02>nul
cls
echo Status:
echo        Backing up old boot animation
files\adb pull /system/media/bootanimation.zip bootanimation-backup.zip>nul
timeout /t 01>nul
cls
echo Status:
echo        Done
timeout /t 01>nul
cls
echo Status:
echo        Flashing new boot animation...
files\adb shell "su -c 'busybox rm /sdcard/ba.zip'"
files\adb push bootanimation.zip /sdcard/ba.zip
files\adb shell "su -c 'busybox rm /system/media/bootanimation.zip'"
files\adb shell "su -c 'busybox cp /sdcard/ba.zip /system/media/bootanimation.zip'"
files\adb shell "su -c 'busybox chmod 0644 /system/media/bootanimation.zip'"
files\adb shell "su -c 'busybox rm /sdcard/ba.zip'"
timeout /t 02>nul
cls
echo Status:
echo        Done
timeout /t 01>nul
goto start

---------------------------------------------------

:wdfr
cls
color 4f
echo This will factory reset your phone, it will delete all your personal data
echo.
echo Press any key to wipe DATA, CACHE and Internal SD partition
pause>nul
cls
echo 1) PROCEED
echo.
echo 2) GO BACK

set /p wdfr=Enter a choice:  
if /i '%wdfr%'=='1' goto frnw
if /i '%wdfr%'=='2' goto start
cls
goto wdfr

:frnw
cls
files\adb reboot bootloader
cls
files\fastboot -w >nul
cls
echo Factory reset done!
echo.
pause>nul
goto start

---------------------------------------------------

:rest
cls
echo Restoring ADB backup.
move backups\backup.ab .
files\adb restore backup.ab
echo.
echo Done!
pause>nul
cls
goto start

---------------------------------------------------


---------------------------------------------------


---------------------------------------------------


:page3
cls
echo.                        [P]revious    PAGE: 3    [N]ext
echo.
echo.
echo.
echo.
echo Choices:
echo.
echo.
echo.
echo.
echo [E] Extras
echo.
echo [21] Get bug report file
echo.
echo [22] Device controller [Volume/Power button simulator]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.

set /p choice=Enter your choice:  

if /i '%choice%' == 'P' goto page2
if /i '%choice%' == 'E' goto extras
if /i '%choice%' == '21' goto bugreport
if /i '%choice%' == '22' goto devicesimu
cls
echo Error occured
pause>nul
goto page3

---------------------------------------------------

:bugreport
files\adb bugreport > bugs.log
cls
echo BUG REPORT SAVED
echo.
pause>nul
goto start

---------------------------------------------------

:devicesimu
cls
echo.
echo.
echo [1] Wake / Sleep device
echo.
echo [2] Increase volume
echo.
echo [3] Decrease volume
echo.
echo [4] Go back
echo.
echo.
echo.

set /p devsimu=Enter choice:  

if /i '%devsimu%' == '1' goto devws
if /i '%devsimu%' == '2' goto devvi
if /i '%devsimu%' == '3' goto devvd
if /i '%devsimu%' == '4' goto start
cls
echo Error occured, please retry
pause>nul
goto devicesimu

:devws
files\adb shell input keyevent 26
goto devicesimu

:devvi
files\adb shell input keyevent 24
goto devicesimu

:devvd
files\adb shell input keyevent 25
goto devicesimu
