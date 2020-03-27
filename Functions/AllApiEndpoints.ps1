ALL
$AllResponses = Invoke-RestMethod 'https://corona.lmao.ninja/all' -Method 'GET' -Headers $headers -Body $body
$AllResponses | ConvertTo-Json

COUNTRIES
$CountriesResponses = Invoke-RestMethod 'https://corona.lmao.ninja/countries?sort=country' -Method 'GET' -Headers $headers -Body $body
$CountriesResponses | ConvertTo-Json

COUNTRY
$CountryResponse = Invoke-RestMethod 'https://corona.lmao.ninja/countries/Uk' -Method 'GET' -Headers $headers -Body $body
$CountryResponse | ConvertTo-Json

STATES
$StateResponses = Invoke-RestMethod 'https://corona.lmao.ninja/states' -Method 'GET' -Headers $headers -Body $body
$StateResponses | ConvertTo-Json

JOHN HOPKINS CSSE DATA
$JohnHopkinsData = Invoke-RestMethod 'https://corona.lmao.ninja/jhucsse' -Method 'GET' -Headers $headers -Body $body
$JohnHopkinsData | ConvertTo-Json

HISTORICAL DATA
$HistoricalDataHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$HistoricalDataHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")

$HistoricalData = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical' -Method 'GET' -Headers $headers -Body $body
$HistoricalData | ConvertTo-Json

