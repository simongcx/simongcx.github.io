$strComputer ="."
$colItems = Get-WmiObject Win32_NetworkAdapterConfiguration -Namespace "root\CIMV2" | where{$_.IPEnabled -eq “True”}

$ipaddress = $colItems[0].IPAddress[0]
$IPScope = $ipaddress[0..$ipaddress.LastIndexOf(".")] -join '' 

$ping = New-Object System.Net.NetworkInformation.Ping

$IPNode = 1;

while ( $IPNode -le 255 ) {

 $IPtoPing = "$IPScope$IPNode";
 $stat = $ping.send($IPtoPing, 500) | select status;
 if ($stat.Status -ceq "Success") {
     $IPtoPing;
 }
 $IPNode = $IPNode + 1;

}