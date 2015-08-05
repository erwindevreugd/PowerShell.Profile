# Copyright (c) 2010-2013 Keith Dahlby and contributors
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
# to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

if (-not(Get-Module -ListAvailable -Name posh-git)) {
    Write-Warning ("Module posh-git was not found. This module is required for the PoshGitPrompt.`n" +
				   "Check and make sure that the module is installed in a valid PowerShell modules directory.")
	return
}

# Load posh-git module
Import-Module posh-git

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Pop-Location

Start-SshAgent -Quiet

Rename-Item Function:\Prompt PoshGitPrompt -Force
function Prompt() {
    if(Test-Path Function:\PrePoshGitPrompt) {
        ++$global:poshScope; 
        New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;
        $private:p = PrePoshGitPrompt; 
        if(--$global:poshScope -eq 0) {
            Remove-Item function:\Write-Host -Force
        }
     }
     PoshGitPrompt
}