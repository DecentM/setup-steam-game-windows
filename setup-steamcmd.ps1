$url = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
$folder = "SteamCMD"

Write-Output "Installing SteamCMD..."

if (!(Test-Path -Path $folder)) {
    mkdir -p $folder
}

$pastlocation = Get-Location
Set-Location $folder

if (!(Test-Path -Path "steamcmd.zip")) {
    Invoke-WebRequest $url -OutFile steamcmd.zip
}

if (!(Test-Path -Path "steamcmd")) {
    Expand-Archive -LiteralPath steamcmd.zip -DestinationPath steamcmd
}

Set-Location $pastlocation

Write-Output "Done."
