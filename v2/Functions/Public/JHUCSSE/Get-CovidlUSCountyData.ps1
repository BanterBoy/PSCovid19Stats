<#

JHUCSSE

Data from Johns Hopkins University

GET All US County Data
https://corona.lmao.ninja/v2/jhucsse/counties

Get JHU CSSE county specific data. This includes confirmed cases, deaths, recovered, and coordinates. Data is updated every 10 minutes

GET Single County Data
https://corona.lmao.ninja/v2/jhucsse/counties/:countyName
Get JHU CSSE county specific data. This includes confirmed cases, deaths, recovered, and coordinates. Returns array because there are duplicate names. Data is updated every 10 minutes.

PATH VARIABLES
countyNameAbbeville

#>


# GET All US County Data

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/jhucsse/counties' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


GET Single County Data

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/jhucsse/counties/Abbeville' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json
