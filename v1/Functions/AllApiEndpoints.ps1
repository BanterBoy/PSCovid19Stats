V1

#ALL
$AllHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$AllHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$AllResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/all' -Method 'GET' -Headers $AllHeaders -Body $body
$AllResponses | ConvertTo-Json

#COUNTRIES
$CountriesHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$CountriesHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$CountriesResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/countries?sort=country' -Method 'GET' -Headers $CountriesHeaders -Body $body
$CountriesResponses | ConvertTo-Json

#COUNTRY
$CountryHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$CountryHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$CountryResponse = Invoke-RestMethod 'https://corona.lmao.ninja/v2/countries/Uk' -Method 'GET' -Headers $CountryHeaders -Body $body
$CountryResponse | ConvertTo-Json

#STATES
$StateHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$StateHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$StateResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/states' -Method 'GET' -Headers $StateHeaders -Body $body
$StateResponses | ConvertTo-Json

#JOHN HOPKINS CSSE DATA
$jhucsseDataHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$jhucsseDataHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$jhucsseData = Invoke-RestMethod 'https://corona.lmao.ninja/v2/jhucsse' -Method 'GET' -Headers $jhucsseDataHeaders -Body $body
$jhucsseData | ConvertTo-Json

#HISTORICAL DATA
$HistoricalDataHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$HistoricalDataHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$HistoricalData = Invoke-RestMethod 'https://corona.lmao.ninja/v2/v2/historical' -Method 'GET' -Headers $HistoricalDataHeaders -Body $body
$HistoricalData | ConvertTo-Json