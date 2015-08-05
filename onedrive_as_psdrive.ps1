if(-not (Test-Path Onedrive:)) {
    $userfolder = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\OneDrive").UserFolder

    if($userfolder -eq $null) {
		Write-Warning ("Could not locate the OneDrive folder.")
		return
    } 

	New-PSDrive -Name OneDrive -Root $userfolder -PSProvider FileSystem | Out-Null
	Write-Verbose ("OneDrive folder is now mapped as a PSDrive. You can access the drive by typing 'cd OneDrive:'.")
}