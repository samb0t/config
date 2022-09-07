# Need Set-ExecutionPolicy Unrestricted
# Used in a daily Task Scheduler
#   Run a program: powershell.exe
#   Arguments (because windows is insane): -Command " &'C:\Users\burbo\Documents\My Projects\GitHub\config\ps\MediaBackup.ps1'"
#   Start in (no quotes): C:\Users\burbo\Documents\My Projects\GitHub\config\ps 
# NOTE: Be careful with /MIR as it will blow away files that are extra in the destination - CHECK YOUR SRC/DEST

$rootSource = "y:"
$rootDest = "m:/mac-backup"

$todaysDate = get-date -format yyyy-MM-dd

robocopy $rootSource $rootDest /r:3 /IT /NDL /LOG+:"$($todaysDate).log"
