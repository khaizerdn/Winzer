@echo off
title NoSystemCleanUp
echo Optimizing your computer... Please wait.
echo.

:: Prompt before deleting files and subfolders in Downloads folder
set /p deleteDownloads="Do you want to delete all files and subfolders in your Downloads folder? (Y/N): "
if /I "%deleteDownloads%"=="Y" (
    echo Deleting files and subfolders in Downloads folder...
    del /s /q "%USERPROFILE%\Downloads\*.*" 2>nul
    for /d %%x in ("%USERPROFILE%\Downloads\*") do (
        if exist "%%x" rd /s /q "%%x"
    )
    echo All files and subfolders in Downloads folder deleted!
) else (
    echo Skipping deletion of Downloads folder files.
)
echo.

:: Clean temporary files
echo Cleaning temporary files...
del /s /q %temp%\*.*  
del /s /q C:\Windows\Temp\*.*  
del /s /q C:\Windows\Prefetch\*.*
del /s /q C:\Users\%USERNAME%\AppData\Local\Temp\*.*  
echo Temporary files cleaned!
echo.

:: Clear DNS cache
echo Flushing DNS cache...
ipconfig /flushdns
echo DNS cache flushed!
echo.

:: Stop and disable unnecessary services
echo Disabling unnecessary services...
sc config "SysMain" start= disabled
sc config "DiagTrack" start= disabled
sc config "WSearch" start= disabled
echo Unnecessary services disabled!
echo.

:: Disable Cortana
echo Disabling Cortana...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
echo Cortana disabled!
echo.

:: Run disk cleanup (optional: add a warning before running this if it's a heavy task)
echo Running Disk Cleanup...
cleanmgr /sagerun:1
echo Disk Cleanup completed!
echo.

:: Optimize Drivers
echo Optimizing drives...
defrag C: /O /H /U
echo Drives optimized!
echo.

:: Empty Recycle Bin
echo Emptying Recycle Bin...
rd /s /q "%USERPROFILE%\$Recycle.bin"
echo Recycle Bin emptied!
echo.

echo All tasks finished! Your PC should now run faster.  
pause
exit
