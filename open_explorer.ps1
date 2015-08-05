function Open-Explorer {
    $current = (Get-Location).ProviderPath

    &explorer.exe "$current"
}