# PowerShell Profile
-------------

A configurable PowerShell profile where you can easily enable or disable features by setting the options at the top of the PowerShell profile file.

#### Current Features:

* Map OneDrive folder as function
* Map OneDrive folder as PSDrive
* Open Explorer
* GitPrompt from the posh-git project

#### Map OneDrive as Function:

Creates a function to easily access your OneDrive folder from anywhere.

To enable this feature set the following option in profile.ps1
```PowerShell
$ONEDRIVE_AS_FUNCTION=1
```
Then you can quickly navigate to your OneDrive:
```PowerShell
OneDrive
```

#### Map OneDrive as PSDrive:

Maps your OneDrive folder as a PSDrive so you can easily access it from anywhere.

To enable this feature set the following option in profile.ps1
```PowerShell
$ONEDRIVE_AS_PSDRIVE=1
```
Then you can quickly navigate to your OneDrive:
```PowerShell
cd OneDrive:
```

#### Open Explorer:

Opens your current location in Windows Explorer.

To enable this feature set the following option in profile.ps1
```PowerShell
$OPEN_EXPLORER=1
```
Then you can quickly open your current location in Windows Explorer:
```PowerShell
Open-Explorer
```

#### GitPrompt:

Enables the GitPrompt feature from posh-git.
It also loads the posh-git module.

To enable this feature set the following option in profile.ps1
```PowerShell
$POSHGIT_PROMPT=1
```
*The GitPrompt feature requires that the posh-git module is installed on your system*