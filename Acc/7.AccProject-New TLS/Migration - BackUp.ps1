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

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Tax" -destList "All Documents" -propertyMappingPath "PropertyMappings\Tax_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\Tax_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Tax.sgt" -propertyTemplateName "Tax (1)" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount
	
	
MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "VAT" -destList "All Documents" -propertyMappingPath "PropertyMappings\Vat_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\Vat_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\VAT.sgt" -propertyTemplateName "VAT" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

# -- Not working. Projectname is copying, Have a look on next time --#
MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Corporate law" -destList "All Documents" -propertyMappingPath "PropertyMappings\CorporateLaw_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\CorporateLaw_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Corporatelaw.sgt" -propertyTemplateName "Corporatelaw (1)" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Commercial law" -destList "All Documents" -propertyMappingPath "PropertyMappings\CommercialLaw_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\CommercialLaw_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Commerciallaw.sgt" -propertyTemplateName "Commerciallaw" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Private governance" -destList "All Documents" -propertyMappingPath "PropertyMappings\PrivateGovernance_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\PrivateGovernance_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Privategovernance.sgt" -propertyTemplateName "PrivategovernanceTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Real estate" -destList "All Documents" -propertyMappingPath "PropertyMappings\RealEstate_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\RealEstate_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Realestate.sgt" -propertyTemplateName "RealestateTemplate" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount

MigrateLibrary -srcSite $srcSite -destSite $destSite -srcList "Social law" -destList "All Documents" -propertyMappingPath "PropertyMappings\SocialLaw_PropertyMappings.sgpm" -contenttypeMappingPath "PropertyMappings\SocialLaw_ContentTypeMappings.sgctm" -propertyTemplatePath "PropertyMappings\Sociallaw.sgt" -propertyTemplateName "Sociallaw" -logFolder $logFolder -migrationUnit $migrationUnit -attemptCount $attemptCount
