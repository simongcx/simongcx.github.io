
$strComputer ="."
$colItems = Get-WmiObject Win32_NetworkAdapterConfiguration -Namespace "root\CIMV2" | where{$_.IPEnabled -eq “True”}

$ipaddress = $colItems[0].IPAddress[0]
write-host $ipaddress
$ipaddress -remove "/d+"
write-host $ipaddress

<#

$ping = New-Object System.Net.NetworkInformation.Ping

$IPScope = "172.16.112";

$IPNode = 1;

while ( $IPNode -le 255 ) {

 $IPtoPing = "$IPScope.$IPNode";
 $stat = $ping.send($IPtoPing, 500) | select status;
 write-host $stat
 #$stat;
 if ($stat.Status -ceq "Success") {
     $result = "$IPtoPing $stat";
     $result; 
 }
 $IPNode = $IPNode + 1;

}

#>