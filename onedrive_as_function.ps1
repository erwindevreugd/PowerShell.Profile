function OneDrive {
    $userfolder = (Get-ItemProperty -Path "HKCU:\Software\Microsoft\OneDrive").UserFolder

    if($userfolder -eq $null) {
		Write-Warning ("Could not locate the OneDrive folder.")
		return
    }

	Set-Location -Path $userfolder
	Write-Verbose ("OneDrive folder is now mapped as a function. You can access the drive by typing 'OneDrive'.")
}