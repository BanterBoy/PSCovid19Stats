<#
NYT

Data from New York Times

GET US Nationwide Data
https://corona.lmao.ninja/v2/nyt/usa

Return all NYT US nationwide data. Each entry returned represents data for a given day.


#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/nyt/usa' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json