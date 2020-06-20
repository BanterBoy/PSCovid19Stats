<#

JHUCSSE

Data from Johns Hopkins University

Countries / Continents

Data from Worldometers

GET All Continents
https://corona.lmao.ninja/v2/continents?yesterday=true&sort
Returns a JSON array with an element for each continent that has stats available.

PARAMS
yesterday

For this parameter you can show yesterday data

Available values : true, false, 1, 0.

sort

For this parameter you can provide a key from the country model (e.g. cases, todayCases, deaths, recovered, active, etc) to sort the countries from greatest to least, depending on the key

Available values : cases, todayCases, deaths, todayDeaths, recovered, active, critical, casesPerOneMillion, deathsPerOneMillion.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/continents?yesterday=true&sort=' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


<#

JHUCSSE

Data from Johns Hopkins University

GET Specific Continent
https://corona.lmao.ninja/v2/continents/:query?yesterday&strict
Get the same data from the /v2/continents endpoint, but filter down to a specific continent.

PARAMS
yesterday

For this parameter you can show yesterdays data

Available values : true, false, 1, 0.

strict

Defaults to true. Setting to false gives you the ability to fuzzy search countries. Example Oman vs. rOMANia

Available values : true, false.

PATH VARIABLES
query

The continent name.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/continents/Europe?yesterday=&strict=' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json