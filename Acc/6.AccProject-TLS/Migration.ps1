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
Write-Host "This script will migrate Accountacy-TLS project related lists."

ImportModules
$shareGateCredential = Get-StoredCredential -Name "ShareGateCredential"

$srcSite = Connect-Site -Url $sourceSiteUrl -Credential $shareGateCredential
$destSite = Connect-Site -Url $destSiteUrl -Credential $shareGateCredential

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Tax" -destList "Tax" -propertyMappingPath "PropertyMappings\Tax_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\Tax_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Tax.sgt" -propertyTemplateName "TaxTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "VAT" -destList "VAT" -propertyMappingPath "PropertyMappings\Vat_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\Vat_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\VAT.sgt" -propertyTemplateName "VATTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Corporate law" -destList "Corporate law" -propertyMappingPath "PropertyMappings\CorporateLaw_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\CorporateLaw_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Corporatelaw.sgt" -propertyTemplateName "CorporatelawTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Commercial law" -destList "Commercial law" -propertyMappingPath "PropertyMappings\CommercialLaw_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\CommercialLaw_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Commerciallaw.sgt" -propertyTemplateName "CommerciallawTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

#MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Private governance" -destList "Private governance" -propertyMappingPath "PropertyMappings\PrivateGovernance_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\PrivateGovernance_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Privategovernance.sgt" -propertyTemplateName "PrivategovernanceTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Real estate" -destList "Real estate" -propertyMappingPath "PropertyMappings\RealEstate_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\RealEstate_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Realestate.sgt" -propertyTemplateName "RealestateTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Social law" -destList "Social law" -propertyMappingPath "PropertyMappings\SocialLaw_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\SocialLaw_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Sociallaw.sgt" -propertyTemplateName "SociallawTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount



