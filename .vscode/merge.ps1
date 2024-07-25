param (
	[string]$leftPath,
	[string]$rightPath
)
$DebugPreference = 'SilentlyContinue'

$WINMERGE = "winmergeのパス"

Write-Debug "leftPath=$leftPath, rightPath=$rightPath"

if ($rightPath -eq "") {
	[void][System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")
	$dialog = New-Object System.Windows.Forms.FolderBrowserDialog
	$dialog.Description = "フォルダを選択"
	$ret = $dialog.ShowDialog()
	if ($ret -ne [System.Windows.Forms.DialogResult]::ok) {
		Exit 0
	}
	Write-Debug $dialog.SelectedPath
	$rightPath = $dialog.SelectedPath
}

Write-Debug "$WINMERGE `"$leftPath`" `"$rightPath`""
Start-Process -FilePath $WINMERGE -ArgumentList `"$leftPath`", `"$rightPath`"
