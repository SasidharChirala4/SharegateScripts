# History: Rakesh Laveti - created - 25/04/2017
#Updated : Thirumalesh -Updated 28/04/2017
# Updated : Andreas Dasseville -Updated 23/01/2018
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
Write-Host "This script will migrate Accountacy-ACC project related lists."

ImportModules
$shareGateCredential = Get-StoredCredential -Name "ShareGateCredential"

$srcSite = Connect-Site -Url $sourceSiteUrl -Credential $shareGateCredential
$destSite = Connect-Site -Url $destSiteUrl -Credential $shareGateCredential

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcListName "Annual accounts" -destListName "Annual accounts" -propertyMappingPath "PropertyMappings\AnnualAccounts_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\AnnualAccounts_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\AnnualAccounts.sgt" -propertyTemplateName "AnnualAccountsTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcListName "Bookkeeping" -destListName "Bookkeeping" -propertyMappingPath "PropertyMappings\BookKeeping_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\BookKeeping_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\BookKeeping.sgt" -propertyTemplateName "BookKeepingTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcListName "Tax Compliance" -destListName "Tax Compliance" -propertyMappingPath "PropertyMappings\TaxComplaince_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\TaxComplaince_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\TaxComplaince.sgt" -propertyTemplateName "TaxComplainceTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcListName "Consolidation" -destListName "Consolidation" -propertyMappingPath "PropertyMappings\Consolidation_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\Consolidation_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Consolidation.sgt" -propertyTemplateName "ConsolidationTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcListName "PB-IPP" -destListName "PB-IPP" -propertyMappingPath "PropertyMappings\PBIPP_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\PBIPP_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\PBIPP.sgt" -propertyTemplateName "PBIPPTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount



