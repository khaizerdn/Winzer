# Winzer

Winzer, short for Windows Optimizer, is designed to automatically clean, optimize, and declutter your system by removing temporary data, disabling unnecessary services, and performing disk optimizations.

> **Warning:** This script permanently deletes files in key locations such as the `Downloads` folder, system temp directories, and the Recycle Bin. Use with caution.

## Features

- **Optional Cleanup of Downloads Folder**
  - Prompts the user before deleting **all files and subfolders** in `Downloads`.

- **Temporary Files Removal**
  - Cleans:
    - `%TEMP%`
    - `C:\Windows\Temp`
    - `C:\Windows\Prefetch`
    - `AppData\Local\Temp`

- **Flush DNS Cache**
  - Resets system DNS resolver cache using `ipconfig /flushdns`.

- **Service Optimization**
  - Disables commonly unneeded services:
    - `SysMain` (Superfetch)
    - `DiagTrack` (Connected User Experiences and Telemetry)
    - `WSearch` (Windows Search)

- **Disable Cortana**
  - Modifies registry to disable Cortana for current user.

- **Disk Cleanup**
  - Runs Windows Disk Cleanup silently (`cleanmgr /sagerun:1`).

- **Drive Optimization**
  - Defragments and optimizes primary system drive (`C:`).

- **Recycle Bin Wipe**
  - Forcefully empties system Recycle Bin.

## Usage

1. Right-click `NoSystemCleanUp.bat` and select **Run as Administrator**.
2. Follow the prompt asking whether to clean your `Downloads` folder.
3. The script will proceed with optimizations and display progress messages.
4. Press any key when prompted to exit the script.

## Important Notes

- **Administrator privileges are required** for full functionality.
- **Irrecoverable deletion:** Deleted files are **not** moved to the Recycle Bin.
- Consider backing up important data before running the script.
- The script is intended for **advanced users** or for use in **test environments**.

## Customization

You may modify the following sections based on your needs:
- Toggle specific services for disabling (e.g., leave `WSearch` enabled).
- Remove or comment out the Downloads cleanup block if unnecessary.
- Adjust which temp folders are cleaned for specific user scenarios.
- 
## Requirements

- Windows 10 or later
- Admin access
- Local execution permissions

## License

This script is provided **as-is** with no warranty. Use at your own risk.
