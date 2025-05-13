# Need Set-ExecutionPolicy Unrestricted
# Used in a daily Task Scheduler
#   Run a program: powershell.exe
#   Arguments (because windows is insane): -Command " &'C:\Users\sambo\Documents\My Projects\GitHub\config\ps\PCBackup.ps1'"
#   Start in (no quotes): C:\Users\sambo\Documents\My Projects\GitHub\config\ps 

param ($rootDest)
if ($rootDest -eq $null) {
    write-host "Destination root is required. e.g. z: or d:/sync"
    return
}

$rootSource = "c:\users\sambo"

$backupDirs = 
    "Documents\My Audio",
    "Documents\My ScanSnap",
    "Documents\JennyDocs",
    "Documents\Calibre",
    "Documents\Installers",
    "Music",
    "Pictures",
    "Videos",
    "cmder\config",
    "Documents\My Projects"

$todaysDate = get-date -format yyyy-MM-dd

$backupDirs | % { robocopy """$($rootSource)\$($_)""" """$($rootDest)\$($_)""" /E /IT /NDL /LOG+:"$($todaysDate)-PC.log" }
 
#  Backup this ps script
copy-item $PSCommandPath $rootDest
