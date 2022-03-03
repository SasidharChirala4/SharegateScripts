param (
    [Parameter(Mandatory=$true)][string]$source,
    [Parameter(Mandatory=$true)][string]$destination,
    [Parameter(Mandatory=$true)][string]$path
 )

$nl = "`r`n"
$text = $source + ", Succes" 
$text += $nl
$text += $source + ", Error"
new-item -force -path $path -value $text -type file
