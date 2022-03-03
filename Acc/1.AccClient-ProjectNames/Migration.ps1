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
Write-Host "This script will migrate Project Names list from accountancy client sites."

ImportModules
$shareGateCredential = Get-StoredCredential -Name "ShareGateCredential"

$srcSite = Connect-Site -Url $sourceSiteUrl -Credential $shareGateCredential
$destSite = Connect-Site -Url $destSiteUrl -Credential $shareGateCredential

MigrateAccList -srcSite $srcSite -destSite $destSite -srcList "Project Names" -destList "Project Names" -propertyTemplatePath "PropertyMappings\ProjectNames.sgpm" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount
