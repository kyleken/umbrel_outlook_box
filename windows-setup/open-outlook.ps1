# What MS Mail's "Outlook" connection runs (embedded in kyle-ms-mail/docker-compose.yml
# as -EncodedCommand). Reuses a running Outlook if there is one, otherwise starts it,
# then maximizes the window so it fills the browser tab.
$id = 'Microsoft.OutlookForWindows_8wekyb3d8bbwe!Microsoft.OutlookforWindows'
function Get-OutlookWindow { Get-Process olk -ErrorAction SilentlyContinue | Where-Object MainWindowHandle -ne 0 | Select-Object -First 1 }
$w = Get-OutlookWindow
if (-not $w) {
    Start-Process explorer.exe "shell:AppsFolder\$id"
    for ($i = 0; $i -lt 60 -and -not $w; $i++) { Start-Sleep -Milliseconds 500; $w = Get-OutlookWindow }
}
if ($w) {
    Add-Type -Namespace MsMail -Name Win -MemberDefinition '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(System.IntPtr hWnd, int nCmdShow);'
    [MsMail.Win]::ShowWindowAsync($w.MainWindowHandle, 3) | Out-Null   # 3 = SW_MAXIMIZE
}
