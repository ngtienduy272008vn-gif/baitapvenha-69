# Ten: Nguyễn Tiến Duy
# Lop: CNTT1

$reportPath = "../backup/bao-cao-su-co.txt"
$logPath = "../data/log-he-thong.log"

Write-Output "=== BAO CAO SU CO HE THONG SMARTFARM ===" > $reportPath
Write-Output "Thoi gian xuat bao cao: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" >> $reportPath
Write-Output "----------------------------------------" >> $reportPath

Get-Content $logPath | Select-String -Pattern "CRITICAL|ERROR" | ForEach-Object { $_.Line } >> $reportPath

$errorCount = (Get-Content $logPath | Select-String -Pattern "CRITICAL|ERROR" | Measure-Object).Count
Write-Output "----------------------------------------" >> $reportPath
Write-Output "TONG SO SU CO:" >> $reportPath
Write-Output "$errorCount" >> $reportPath
