#Requires -Version 3.0

Param (
    [Parameter(Mandatory)]
    [ValidateSet('get', 'set')]
    [string]$action,
    [switch]$restart_dns = $false
)

$path  = 'HKLM:\SYSTEM\CurrentControlSet\Services\DNS\Parameters'
$key   = 'TcpReceivePacketSize'
$value = '0xFF00'

function Set-TcpReceivePacketSize {
    Set-ItemProperty -Path $path -Name $key -Value $value -Force
}

function Get-TcpReceivePacketSize {
    try {
        (Get-ItemProperty -Path $path -Name $key -ErrorAction Stop).TcpReceivePacketSize
    } catch {
        Write-Output 'na'
    }
}

function Show-Results {
    @{
        TcpReceivePacketSize = Get-TcpReceivePacketSize
        dns_status           = (Get-Service -Name DNS).Status.ToString()
    } | ConvertTo-Json
}

switch ($action) {
    set {
        Set-TcpReceivePacketSize
        if ($restart_dns) {
            Restart-Service -Name DNS -Force
            Start-Sleep -Seconds 5
        }
        Show-Results
    }
    get {
        Show-Results
    }
}
