function Open-Explorer {
    $current = (Get-Location).ProviderPath
	$explorer = Join-Path $env:SystemRoot "explorer.exe"
    &$explorer "$current"
}