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
# Validation
ValidateInputParameters $sourceSiteUrl $destSiteUrl $logFolder $migrationUnit $attemptCount


#==================== MAIN EXECUTION ====================
Write-Host ""
Write-Host "This script will migrate Accountacy-PRG project related lists."

ImportModules
$shareGateCredential = Get-StoredCredential -Name "ShareGateCredential"

$srcSite = Connect-Site -Url $sourceSiteUrl -Credential $shareGateCredential
$destSite = Connect-Site -Url $destSiteUrl -Credential $shareGateCredential

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Private governance" -destList "Private governance" -propertyMappingPath "PropertyMappings\PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Privategovernance.sgt" -propertyTemplateName "PrivategovernanceTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

