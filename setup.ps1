$destinationPath = "C:\Users\andre\Downloads\test\"

$gitUri = "https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/Git-2.42.0.2-64-bit.exe"

$spotifyUri = "https://download.spotify.com/SpotifyFullSetup.exe"

$emacsUri = "https://mirror.lagoon.nc/gnu/emacs/windows/emacs-29/emacs-29.1-installer.exe"

$firefoxUri = "https://download.mozilla.org/?product=firefox-stub&os=win64&lang=en-GB"

echo "Downloading Git for Windows..."
$gitOutputFile = Join-Path $destinationPath (Split-Path $gitUri -Leaf)
$response = Invoke-WebRequest -Uri $gitUri -OutFile $gitOutputFile -PassThru
echo "Download returned HTTP response $($response.StatusCode) ($($response.StatusDescription))."

echo "Downloading Spotify..."
$spotifyOutputFile = Join-Path $destinationPath (Split-Path $spotifyUri -Leaf)
$response = Invoke-WebRequest -Uri $spotifyUri -OutFile $spotifyOutputFile -PassThru
echo "Download returned HTTP response $($response.StatusCode) ($($response.StatusDescription))."

echo "Downloading Emacs..."
$emacsOutputFile = Join-Path $destinationPath (Split-Path $emacsUri -Leaf)
$response = Invoke-WebRequest -Uri $emacsUri -OutFile $emacsOutputFile -PassThru
echo "Download returned HTTP response $($response.StatusCode) ($($response.StatusDescription))."

echo "Downloading Firefox..."
$firefoxOutputFile = Join-Path $destinationPath (Split-Path $firefoxUri -Leaf)
$response = Invoke-WebRequest -Uri $firefoxUri -OutFile $firefoxOutputFile -PassThru
echo "Download returned HTTP response $($response.StatusCode) ($($response.StatusDescription))."

Start-Process -FilePath $firefoxOutputFile -ArgumentList "/S", "/TaskbarShortcut=true", "/PreventRebootRequired=true"
Start-Process -FilePath $gitOutputFile -ArgumentList "/VERYSILENT"
Start-Process -FilePath $emacsOutputFile -ArgumentList "/S"
Start-Process -FilePath $spotifyOutputFile -ArgumentList "/Silent"
