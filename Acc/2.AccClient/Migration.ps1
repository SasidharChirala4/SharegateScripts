# History: Rakesh Laveti - created - 02/05/2017
#############################################################
param ( 
	[string]$sourceSiteUrl= "",
	[string]$destSiteUrl = "",
	[string]$logFolder = "",
	[string]$migrationUnit = "",
	[string]$attemptCount = ""
)

. "..\..\ScriptHelper.ps1"
# Validation
ValidateInputParameters $sourceSiteUrl $destSiteUrl $logFolder $migrationUnit $attemptCount

#==================== MAIN EXECUTION ====================
Write-Host ""
Write-Host "This script will migrate Permanent File Accountancy list from accountancy client sites"

ImportModules
$shareGateCredential = Get-StoredCredential -Name "ShareGateCredential"

$srcSite = Connect-Site -Url $sourceSiteUrl -Credential $shareGateCredential
$destSite = Connect-Site -Url $destSiteUrl -Credential $shareGateCredential

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Permanent File" -destList "Permanent File" -propertyMappingPath "PropertyMappings\PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\PermanentFileAccountancy.sgt" -propertyTemplateName "PermanentFileAccountancyTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount




