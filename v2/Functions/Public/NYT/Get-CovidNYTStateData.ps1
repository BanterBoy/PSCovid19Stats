<#
Data from New York Times

GET State Data
https://corona.lmao.ninja/v2/nyt/states?state

Return all NYT state data or individual state data if specified. Each entry returned represents data for a given day.

PARAMS
state

The state that you'd like to search for, separated by comma if you want to search for multiple (i.e. 'California, Washington'. Default is full data set.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/nyt/states?state=' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json

