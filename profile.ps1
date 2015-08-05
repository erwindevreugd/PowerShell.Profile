$ONEDRIVE_AS_FUNCTION=1
$ONEDRIVE_AS_PSDRIVE=1
$POSHGIT_PROMPT=1
$OPEN_EXPLORER=1

Push-Location $psScriptRoot

if($ONEDRIVE_AS_FUNCTION) {
	. .\onedrive_as_function.ps1
}

if($ONEDRIVE_AS_PSDRIVE) {
	. .\onedrive_as_psdrive.ps1
}

if($POSHGIT_PROMPT) {
	. .\poshgit_prompt.ps1
}

if($OPEN_EXPLORER) {
	. .\open_explorer.ps1
}

Pop-Location









