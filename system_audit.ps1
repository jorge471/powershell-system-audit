Write-Host "=== SYSTEM AUDIT REPORT ==="

Write-Host "`nComputer Name:"
hostname

Write-Host "`nOperating System:"
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion

Write-Host "`nIP Addresses:"
Get-NetIPAddress -AddressFamily IPv4 |
Where-Object {$_.IPAddress -notlike "127.*"} |
Select-Object IPAddress

Write-Host "`nTop 5 CPU Processes:"
Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 5 Name, CPU

Write-Host "`nDisk Information:"
Get-Volume |
Select-Object DriveLetter, SizeRemaining, Size
