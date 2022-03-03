# History: Andreas Dasseville - created - 23/01/2018

Function GetLogFileName (
		[Parameter(Mandatory=$true)][string]$OutputFolder,
		[Parameter(Mandatory=$true)][string]$MigrationUnit,
		[Parameter(Mandatory=$true)][string]$LogName,
		[Parameter(Mandatory=$true)][string]$AttemptCount
	)
 {
	 $OutputFolder = $OutputFolder.TrimEnd("\")
	 $MigrationUnit = $MigrationUnit.Trim("\")
	 $LogName = $LogName.Trim("\")
	 $AttemptCount = $AttemptCount.Trim("\")



	#Log Folder - Create if not exists yet
	$logFolder = New-Item "$OutputFolder\" -ItemType Directory -Force
	
	 #File name - include attempt number
	$logExtension = "xlsx"

	return "$OutputFolder\$MigrationUnit-$LogName-$AttemptCount.$logExtension"

}

Function ValidateInputParameters([string]$sourceSiteUrl, [string]$destSiteUrl, [string]$logFolder, [string]$migrationUnit, [string]$attemptCount)
{
	if ([string]::IsNullOrEmpty($sourceSiteUrl))
	{
		throw "Source site url is required, script cannot continue !!!"
	}
	if ([string]::IsNullOrEmpty($destSiteUrl))
	{
		throw "Destination site url is required, script cannot continue !!!"
	}
	if ([string]::IsNullOrEmpty($logFolder))
	{
		throw "Log Folder parameter is required, script cannot continue !!!"
	}
	if ([string]::IsNullOrEmpty($migrationUnit))
	{
		throw "Migration unit parameter is required, script cannot continue !!!"
	}
	if ([string]::IsNullOrEmpty($attemptCount))
	{
		throw "AttemptCount parameter is required, script cannot continue !!!"
	}
}


Function ImportModules()
{
	Try
	{
		Import-Module ShareGate
	}
	Catch
	{
		Write-Host "Error while importing modules for Sharegate" -foregroundcolor Black -backgroundcolor Red
		return
	}
	Write-Host ""

	Try {
		Import-Module "..\..\Get-CredentialFromWindowsCredentialManager.psm1"
	}
	Catch
	{
		Write-Host "Error while importing modules for GetCredentialFromWindowsModule" -foregroundcolor Black -backgroundcolor Red
		return
	}
	Write-Host ""
}

Function MigrateLibrary (
	$srcSite,
	$destSite,
	[string]$srcListName,
	[string]$destListName,
	[string]$propertyMappingPath,
	[string]$contenttypeMappingPath,
	[string]$propertyTemplatePath,
	[string]$propertyTemplateName,
	$logFolder,
	$migrationUnit,
	$attemptCount
 )

 {
	$currentFolder = Get-Location
	$propertyMappingPath = "$currentFolder\$propertyMappingPath"
	$contenttypeMappingPath = "$currentFolder\$contenttypeMappingPath"
	$propertyTemplatePath = "$currentFolder\$propertyTemplatePath"

	$srcList = Get-List -Name $srcListName -Site $srcSite
	$destList = Get-List -Name $destListName -Site $destSite
	$mappingSettings = New-MappingSettings
	$mappingSettings = Import-PropertyMapping -Path $propertyMappingPath
	$mappingSettings = Import-ContentTypeMapping -Path $contenttypeMappingPath
	Import-PropertyTemplate -Path $propertyTemplatePath -List $destList -OverWrite 
	$copySettings = New-CopySettings -OnContentItemExists Overwrite
	$contentResult = Copy-Content -SourceList $srcList -DestinationList $destList -TemplateName $propertyTemplateName -MappingSettings $mappingSettings -CopySettings $copySettings -WhatIf
	[string]$logPath = GetLogFileName -MigrationUnit $migrationUnit -LogName $srcListName -OutputFolder $logFolder -AttemptCount $attemptCount
	Export-Report $contentResult -Path $logPath -OverWrite
	Write-Output "#OUTPUT#$logPath"
 }

Function MigrateAccList(
	$srcSite,
	$destSite,
	[string]$srcListName,
	[string]$destListName,
	[string]$propertyTemplatePath,
	$logFolder,
	$migrationUnit,
	$attemptCount)
{
	$currentFolder = Get-Location
	$propertyTemplatePath = "$currentFolder\$propertyTemplatePath"

	$mappingSettings = Import-PropertyMapping -Path $propertyTemplatePath
	$srcList = Get-List -Name $srcListName -Site $srcSite
	$destList = Get-List -Name $destListName -Site $destSite
	$copySettings = New-CopySettings -OnContentItemExists Overwrite
	$contentResult = Copy-Content -SourceList $srcList -DestinationList $destList -MappingSettings $mappingSettings -CopySettings $copySettings
	[string]$logPath = GetLogFileName -MigrationUnit $migrationUnit -LogName $srcListName -OutputFolder $logFolder -AttemptCount $attemptCount
	Export-Report $contentResult -Path $logPath -OverWrite
	Write-Output "#OUTPUT#$logPath"
}