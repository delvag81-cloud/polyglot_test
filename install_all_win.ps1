param(
    [string]$BaseUrl = "https://example.com/dist"
)

Write-Host "=== Windows polyglot installer ==="
Write-Host "Base URL: $BaseUrl"

function Ask {
    param([string]$Msg)
    $ans = Read-Host "$Msg [y/N]"
    return ($ans -match '^(y|Y|yes|YES)$')
}

function Install-FromUrl {
    param(
        [string]$Name,
        [string]$Url,
        [string]$Args = ""
    )
    $tmp = "$env:TEMP\$Name"
    Write-Host "Downloading $Name from $Url"
    Invoke-WebRequest -Uri $Url -OutFile $tmp
    Write-Host "Installing $Name..."
    Start-Process -FilePath $tmp -ArgumentList $Args -Wait -NoNewWindow
    Remove-Item $tmp
}

if (Ask "Установить Python?") {
    Install-FromUrl "python-installer.exe" "$BaseUrl/python-installer.exe" "/quiet InstallAllUsers=1 PrependPath=1"
}

if (Ask "Установить Node.js?") {
    Install-FromUrl "node-setup.msi" "$BaseUrl/node-setup.msi" "/quiet"
}

if (Ask "Установить PHP (portable)?" ) {
    $phpZip = "$env:TEMP\php.zip"
    Invoke-WebRequest -Uri "$BaseUrl/php.zip" -OutFile $phpZip
    Expand-Archive -Path $phpZip -DestinationPath "C:\php" -Force
    Remove-Item $phpZip
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\php", [System.EnvironmentVariableTarget]::Machine)
}

if (Ask "Установить Temurin JDK?") {
    Install-FromUrl "temurin.msi" "$BaseUrl/temurin.msi" "/quiet"
}

if (Ask "Установить Ruby?") {
    Install-FromUrl "rubyinstaller.exe" "$BaseUrl/rubyinstaller.exe" "/verysilent"
}

if (Ask "Установить Rust?") {
    Invoke-WebRequest -Uri "$BaseUrl/rustup-init.exe" -OutFile "$env:TEMP\rustup-init.exe"
    Start-Process -FilePath "$env:TEMP\rustup-init.exe" -ArgumentList "-y" -Wait -NoNewWindow
    Remove-Item "$env:TEMP\rustup-init.exe"
}

if (Ask "Установить Go?") {
    Install-FromUrl "go-installer.msi" "$BaseUrl/go-installer.msi" "/quiet"
}

Write-Host "Готово."
Write-Host "Версии окружения (если установлены):"
python --version 2>$null
node -v 2>$null
php -v 2>$null
java -version 2>$null
ruby -v 2>$null
rustc -V 2>$null
go version 2>$null