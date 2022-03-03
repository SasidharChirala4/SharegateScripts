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
Write-Host "This script will migrate Tax related lists for Project sites."

ImportModules
$shareGateCredential = Get-StoredCredential -Name "ShareGateCredential"

$srcSite = Connect-Site -Url $sourceSiteUrl -Credential $shareGateCredential
$destSite = Connect-Site -Url $destSiteUrl -Credential $shareGateCredential


MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "All Documents" -destList "All Documents" -propertyMappingPath "PropertyMappings\AllDocumentsPropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\AllDocuments_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\AllDocuments.sgt" -propertyTemplateName "AllDocuments" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Billing Info" -destList "Billing Info" -propertyMappingPath "PropertyMappings\BillingInfoPropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\BillingInfo_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\BillingInfo.sgt" -propertyTemplateName "BillingInfo" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Permanent Risk Files" -destList "Permanent Risk Files" -propertyMappingPath "PropertyMappings\PermanentRiskFilesPropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\PermanentRiskFiles_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\PermanentRiskFiles.sgt" -propertyTemplateName "PermanentRiskFiles" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount



