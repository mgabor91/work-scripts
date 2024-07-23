# work-scripts
Longer and shorter scripts which i use regurarly at work

# 210.ps1
Basic PowerShell script for a company program, it detects the version and copies a database file manually after logon. It reads the version from the second line of an .ini file, also overrides a counter.txt in which the program saves how many times the old version has started. Also has a branching for reinstalling the program from the network script, if the user accidentally updates it.

# browser_shortcuts
Desktop shortcuts for opening URLs using different browsers, not just the default one.

# no_sleep.bat
Place it at shell:startup common and it overrides the group policy rule which force the computer to go sleep after 10 minutes of inactivity. Useful when you work away from your computer, because sometimes coming back from sleep it loses the network drives.

# printer.bat
My account is a member of multiple network printer, the computer won't remember the default setting, in the batch file there is a listing command and one for setting the default printer.

# ps.bat
Batch file which calls a PowerShell script, same as above, to bypass group policy. For example calling the 210.ps2 script.

