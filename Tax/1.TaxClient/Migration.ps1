# History: Rakesh Laveti - created - 25/04/2017
#Updated : Thirumalesh -Updated 28/04/2017
#############################################################
param ( 
	[string]$sourceSiteUrl= "",
	[string]$destSiteUrl = "",
	[string]$logFolder = "",
	[string]$migrationUnit = "",
	[string]$attemptCount = ""
	)

. "..\..\ScriptHelper.ps1"

# To add logging
# Add-Content 'c:\temp\test.txt' 'sites loaded'

# Validation
ValidateInputParameters $sourceSiteUrl $destSiteUrl $logFolder $migrationUnit $attemptCount

#==================== MAIN EXECUTION ====================
Write-Host ""
Write-Host "This script will migrate Tax related lists for client sites."

ImportModules
$shareGateCredential = Get-StoredCredential -Name "ShareGateCredential"

$srcSite = Connect-Site -Url $sourceSiteUrl -Credential $shareGateCredential
$destSite = Connect-Site -Url $destSiteUrl -Credential $shareGateCredential

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcListName "Tax Data" -destListName "All Documents" -propertyMappingPath "PropertyMappings\PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\AllDocuments.sgt" -propertyTemplateName "TaxCustomer" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

