powershell -Command "& {.\Migration.ps1  -sourceSiteUrl: 'http://client-a.be.deloitte.com/C/CUST0000323430/' -destSiteUrl:'https://09dev.be.deloitte.com/Sites/TaxACCCustomerBaseTemplate/' -logFolder: 'c:\temp' -migrationUnit: 'blablabla' }"
powershell -Command "& {.\Migration.ps1  -sourceSiteUrl: 'http://acc-a.be.deloitte.com/W/WBS323430ACC/' -destSiteUrl:'https://09dev.be.deloitte.com/Sites/TaxACCCustomerBaseTemplate/'} -logFolder: 'c:\temp' -migrationUnit: 'blablabla' }"
powershell -Command "& {.\Migration.ps1  -sourceSiteUrl: 'http://acc-a.be.deloitte.com/W/WBS323430GEN/' -destSiteUrl:'https://09dev.be.deloitte.com/Sites/TaxACCCustomerBaseTemplate/'} -logFolder: 'c:\temp' -migrationUnit: 'blablabla' }"
powershell -Command "& {.\Migration.ps1  -sourceSiteUrl: 'http://acc-a.be.deloitte.com/W/WBS100217PRG/' -destSiteUrl:'https://09dev.be.deloitte.com/Sites/TaxACCCustomerBaseTemplate/'} -logFolder: 'c:\temp' -migrationUnit: 'blablabla' }"


