$gameid = $args[0]
$folder = $args[1]
$platform = $args[2]
$steamuser = $args[3]
$steampass = $args[4]

Write-Output "Installing and verifying game $gameid..."

.\SteamCMD\steamcmd\steamcmd.exe `
    +@sSteamCmdForcePlatformType $platform `
    +force_install_dir ../../$folder `
    +login "$steamuser" "$steampass" `
    +app_update $gameid validate `
    +quit `
    || & {
        if ($global:LASTEXITCODE -eq 7) {
            "SteamCMD exited with exit code $global:LASTEXITCODE, but we don't care about it."; $global:LASTEXITCODE = 0
        }
     }

Write-Output "Done."
