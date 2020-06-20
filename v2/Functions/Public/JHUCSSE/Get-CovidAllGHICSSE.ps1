<#
JHUCSSE

Data from Johns Hopkins University

GET All GHI CSSE
https://corona.lmao.ninja/v2/jhucsse

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/jhucsse' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json

