param(
    [Parameter(Mandatory=$true)]
    [string]$NetworkPrefix,
    
    [Parameter(Mandatory=$true)]
    [string]$DnsServer
)

# Extract the network portion (first 3 octets)
$NetworkBase = $NetworkPrefix -replace '\.$', '' -replace '\.\d+$', ''

for ($i = 1; $i -le 254; $i++) {
    $IPAddress = "$NetworkBase.$i"
    Resolve-DnsName -DnsOnly $IPAddress -Server $DnsServer -ErrorAction Ignore
}
