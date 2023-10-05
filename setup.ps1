$emacsUri = "https://mirror.lagoon.nc/gnu/emacs/windows/emacs-29/emacs-29.1-installer.exe"
$emacsOutputFile = Join-Path $pwd (Split-Path $emacsUri -Leaf)

$firefoxUri = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-GB"
$firefoxOutputFile = Join-Path $pwd "firefox-installer.msi"

echo "Git download starting..."
Start-Job -ScriptBlock {
  $uri = "https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/Git-2.42.0.2-64-bit.exe"
  $outfile = Join-Path $pwd (Split-Path $uri -Leaf)

  Invoke-WebRequest -Uri $uri -OutFile $outfile -PassThru -UseBasicParsing
  Start-Process -FilePath $outfile # -ArgumentList "/VERYSILENT"

  echo "Git installation finished."
}

echo "Spotify download starting..."
Start-Job -ScriptBlock {
  $uri = "https://download.scdn.co/SpotifySetup.exe"
  $outfile = Join-Path $pwd (Split-Path $uri -Leaf)

  Invoke-WebRequest -Uri $uri -OutFile $outfile -PassThru -UseBasicParsing
  Start-Process -FilePath $outfile # -ArgumentList "/Silent"

  echo "Spotify installation finished."
}

echo "Emacs download starting..."
Start-Job -ScriptBlock {
  $uri = "https://mirror.lagoon.nc/gnu/emacs/windows/emacs-29/emacs-29.1-installer.exe"
  $outfile = Join-Path $pwd (Split-Path $uri -Leaf)

  Invoke-WebRequest -Uri $uri -OutFile $outfile -PassThru -UseBasicParsing
  Start-Process -FilePath $outfile # -ArgumentList "/S"

  echo "Emacs installation finished."
}

echo "Firefox download starting..."
Start-Job -ScriptBlock {
  $uri = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-GB"
  $outfile = Join-Path $pwd (Split-Path $uri -Leaf)

  Invoke-WebRequest -Uri $uri -OutFile $outfile -PassThru -UseBasicParsing
  Start-Process msiexec -ArgumentList "/package","`"$firefoxOutputFile`""

  echo "Firefox installation finished."
}
