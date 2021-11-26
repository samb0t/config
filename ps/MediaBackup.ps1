# Need Set-ExecutionPolicy Unrestricted
# Used in a daily Task Scheduler
#   Run a program: powershell.exe
#   Arguments (because windows is insane): -Command " &'C:\Users\burbo\Documents\My Projects\GitHub\config\ps\PCBackup.ps1'"
#   Start in (no quotes): C:\Users\burbo\Documents\My Projects\GitHub\config\ps 

$rootSource = "m:"
$rootDest = "n:"

$backupDirs = 
    "mac-backup"

$todaysDate = get-date -format yyyy-MM-dd

$backupDirs | % { robocopy """$($rootSource)\$($_)""" """$($rootDest)\$($_)""" /MIR /IT /NDL /LOG+:"$($todaysDate).log" }
 
#  Backup this ps script
copy-item $PSCommandPath d:\mac-backup
