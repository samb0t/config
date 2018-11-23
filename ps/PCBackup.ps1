# Used in a daily Task Scheduler
# Need Set-ExecutionPolicy Unrestricted
# Run a program: powershell.exe; arguments, path to the script

$rootSource = "c:\users\burbo"
$rootDest = "d:\sync"

$backupDirs = 
    "Documents\My Audio",
    "Documents\My Projects",
    "Documents\My ScanSnap",
    "Documents\JennyDocs",
    "Documents\Calibre",
    "Music",
    "Pictures",
    "Videos"

$todaysDate = get-date -format yyyy-MM-dd

$backupDirs | % { robocopy """$($rootSource)\$($_)""" """$($rootDest)\$($_)""" /MIR /IT /NDL /LOG+:"$($todaysDate).log" }
 
#  Backup this ps script
copy-item $PSCommandPath d:\sync
