param(
    [Parameter(Mandatory=$true)]
    [string]$NetworkPrefix,
    
    [Parameter(Mandatory=$true)]
    [string]$DnsServer
)

# Extract the network portion (first 3 octets) and ensure it ends with a dot
$NetworkBase = $NetworkPrefix -replace '\.

Write-Host "Checking DNS for all hosts in network $NetworkBase.1 - $NetworkBase.254 using DNS server $DnsServer"

for ($i = 1; $i -le 254; $i++) {
    $IPAddress = "$NetworkBase.$i"
    try {
        Resolve-DnsName -DnsOnly $IPAddress -Server $DnsServer -ErrorAction Stop
    }
    catch {
        # Silently continue if no DNS record found
    }
}
