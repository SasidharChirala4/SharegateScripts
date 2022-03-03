powershell -Command "& {.\Migration.ps1  -sourceSiteUrl: 'https://edreams.deloitte.be/Sites/4lac47vg/4lachea0' -destSiteUrl:'https://edreams.deloitte.be/Sites/4urv9z96/4urvpk7n' -logFolder: 'C:\$@$!\ShareGateScripts_CS13832\Acc\7.AccProject-New TLS\Results\1463474TLS' -migrationUnit: 'AllDocuments' -attemptCount 'Migration'}"

powershell -Command "& {.\Migration.ps1  -sourceSiteUrl: 'https://edreams.deloitte.be/Sites/4mm9rs7p/4mma7k6j' -destSiteUrl:'https://edreams.deloitte.be/Sites/4urv9z96/4urvpk7n' -logFolder: 'C:\$@$!\ShareGateScripts_CS13832\Acc\7.AccProject-New TLS\Results\1465833TLS' -migrationUnit: 'AllDocuments' -attemptCount 'Migration'}"

powershell -Command "& {.\Migration.ps1  -sourceSiteUrl: 'https://edreams.deloitte.be/Sites/3vh4p188/3vh50m76' -destSiteUrl:'https://edreams.deloitte.be/Sites/4urv9z96/4urvpk7n' -logFolder: 'C:\$@$!\ShareGateScripts_CS13832\Acc\7.AccProject-New TLS\Results\1393367TLS' -migrationUnit: 'AllDocuments' -attemptCount 'Migration'}"

powershell -Command "& {.\ExportReports.ps1 -logFile 'C:\$@$!\ShareGateScripts_CS13832\Acc\7.AccProject-New TLS\Results\Testing\Test.xlsx' -fromDateTime '2022/01/27 18:00:00' }"