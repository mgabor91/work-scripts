[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
Add-Type -AssemblyName System.ServiceProcess
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$path = "c:\PROGRAM\version.ini"
$row2 = Get-Content $path | Select-Object -Index 1
$text = 0
$Folder = 'c:\PROGRAM\'

if (-not(Test-Path -Path $Folder)) {
   $text = "The Program is not installed, would you like to install now?"
} elseif ($row2 -eq "Ver = 3.90.200.210") { 
	$text = "The version of the program is fine (.210)`n Before starting it please exit from other instances of the program!"}
else {
	$text = "Your program has updated`nReinstall with the button below"
}


$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Program database file copy v3.2'
$main_form.BackColor = 'white'
$main_form.Width = 480
$main_form.Height = 220

$header = New-Object System.Drawing.Font("Verdana", 13, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$procFont = New-Object System.Drawing.Font("Verdana", 15, [System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))


$Label = New-Object System.Windows.Forms.Label
$Label.Font = $header
if ($row2 -eq "Ver = 3.90.200.210") {
	$Label.ForeColor = 'green'
} else {
	$Label.ForeColor = 'red'
}
$Label.Text = "$szoveg"
$Label.Location = New-Object System.Drawing.Point(10, 10)
$Label.Width = 480
$Label.Height = 65


$Label2 = New-Object System.Windows.Forms.Label
$Label2.Font = $header
if ($row2 -eq "Ver = 3.90.200.210") {
	$Label2.ForeColor = 'magenta'
} else {
	$Label2.ForeColor = 'white'
}
$Label2.Text = "Click the copy button only after you have signed in!"
$Label2.Location = New-Object System.Drawing.Point(10, 75)
$Label2.Width = 480
$Label2.Height = 40


$StartButton = New-Object System.Windows.Forms.Button
$StartButton.Location = New-Object System.Drawing.Size(10, 130)
$StartButton.Size = New-Object System.Drawing.Size(100, 50)
$StartButton.Text = "1. step start the program"
$StartButton.height = 40
$StartButton.BackColor = 'LightGray'
$StartButton.ForeColor = 'black'
$StartButton.Add_click( { 0 |  Out-File -FilePath c:\Program\counter.txt; Invoke-Expression -Command "c:\Program\Program.exe" });

$CopyButton = New-Object System.Windows.Forms.Button
$CopyButton.Location = New-Object System.Drawing.Size(130, 130)
$CopyButton.Size = New-Object System.Drawing.Size(100, 50)
$CopyButton.Text = "2. Copy old database file"
$CopyButton.height = 40
$CopyButton.BackColor = 'LightGray'
$CopyButton.ForeColor = 'black'
$CopyButton.Add_click( { Copy-Item -Path "c:\Program\database_old\database.DB" -Destination "c:\Program\data\database" ; [System.Windows.MessageBox]::Show("Copy done!", "Yay", "OK", "info") });

$InstallButton = New-Object System.Windows.Forms.Button
$InstallButton.Location = New-Object System.Drawing.Size(10, 130)
$InstallButton.Size = New-Object System.Drawing.Size(200, 200)
$InstallButton.Text = "Install program"
$InstallButton.height = 40
$InstallButton.BackColor = 'LightGray'
$InstallButton.ForeColor = 'black'
$InstallButton.Add_click( { $msgBoxInput =  [System.Windows.MessageBox]::Show(
    "In the next popup window click the install button!`nNow I quit and start the script, OK?",
    'Install',
    'YesNo',
    'Exclamation')
switch  ($msgBoxInput) 
      {
          'Yes' 
          {
          Start-Process -FilePath "K:\IT\install.bat"; $Main_Form.Close()
          }
          'No' 
          {
            Return "Runs Nothing"
          }
      }  } );

$ReInstallButton = New-Object System.Windows.Forms.Button
$ReInstallButton.Location = New-Object System.Drawing.Size(10, 130)
$ReInstallButton.Size = New-Object System.Drawing.Size(200, 200)
$ReInstallButton.Text = "Reinstall Program"
$ReInstallButton.height = 40
$ReInstallButton.BackColor = 'LightGray'
$ReInstallButton.ForeColor = 'black'
$ReInstallButton.Add_click( { $msgBoxInput =  [System.Windows.MessageBox]::Show(
    "Now I quit and reinstall the Program, OK?",
    'Reinstall Program',
    'YesNo',
    'Exclamation')
switch  ($msgBoxInput) 
      {
          'Yes' 
          {
          Start-Process -FilePath "K:\IT\install.bat"; $Main_Form.Close()
          }
          'No' 
          {
            Return "Runs Nothing"
          }
      }  } );

$EndButton = New-Object System.Windows.Forms.Button
$EndButton.Location = New-Object System.Drawing.Size(250, 130)
$EndButton.Size = New-Object System.Drawing.Size(200, 10)
$EndButton.Text = "Exit"
$EndButton.height = 40
$EndButton.BackColor = 'LightGray'
$EndButton.ForeColor = 'black'
$EndButton.Add_click( { $Main_Form.Close() });


if (-not(Test-Path -Path $Folder)) {
   $main_form.Controls.AddRange(($Label, $InstallButton, $EndButton))
} elseif ($row2 -eq "Ver = 3.90.200.210") { 
	$main_form.Controls.AddRange(($Label, $Label2, $StartButton, $CopyButton, $EndButton))}
else {
	$main_form.Controls.AddRange(($Label, $ReInstallButton, $EndButton))
}

$main_form.StartPosition = "manual"
$main_form.Location = New-Object System.Drawing.Size(500, 300)
$result = $main_form.ShowDialog() 
