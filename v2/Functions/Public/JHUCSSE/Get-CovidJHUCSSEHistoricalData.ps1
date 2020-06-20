<#

JHUCSSE

Data from Johns Hopkins University

GET Historical Data
https://corona.lmao.ninja/v2/historical?lastdays=30

Get time series info from the JHU CSSE Data Repository. Every date since 1/22/20 has an entry tracking deaths, cases, and recoveries for each country. Updated each day at 23:59 UTC. Data is updated every 10 minutes.

PARAMS
lastdays

number of days you want the data to go back to. Default is 30. Use all for full data set.

Ex: 15, all, 24


#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical?lastdays=30' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json

