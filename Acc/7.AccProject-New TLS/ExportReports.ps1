param ( 
	[String]$logFile,
	[String]$fromDateTime
	)

# Save report
$results = Find-CopySessions -From $fromDateTime 
Export-Report $results -Path $logFile -OverWrite