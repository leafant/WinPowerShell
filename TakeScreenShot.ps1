param([string]$file,    [switch]$activeWindowOnly) 
$currentPath = Convert-Path .
if (-Not $file){ $file = $currentPath+"\\failureScreenShot.png"}
if (Test-Path $file){    Remove-Item $file}
[Reflection.Assembly]::LoadFile($currentPath + "\\TakeScreenShot.dll")
$capture = New-Object ScreenShot.ScreenCapture
if ($activeWindowOnly){    $capture.CaptureActiveWindowToFile($file)}
else{    $capture.CaptureScreenToFile($file)}
