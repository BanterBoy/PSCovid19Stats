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


<#

JHUCSSE

Data from Johns Hopkins University

GET USA States
https://corona.lmao.ninja/v2/historical/usacounties

Returns a list of states that are available for querying the endpoint with.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical/usacounties' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


<#

JHUCSSE

Data from Johns Hopkins University

GET Historical Data for all Counties in a Specified State
https://corona.lmao.ninja/v2/historical/usacounties/:state?lastdays=30

Get time series info from the JHU CSSE Data Repository. Every date since 1/22/20 has an entry tracking deaths and cases. Updated each day at 23:59 UTC. Data is updated every 10 minutes.

PARAMS
lastdays

number of days you want the data to go back to. Default is 30. Use all for full data set.
Ex: 15, all, 24. Default value: 30

PATH VARIABLES
state

Required. A valid US state name, validated in the array returned from /v2/historical/usacounties.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical/usacounties/guam?lastdays=30' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


<#

JHUCSSE

Data from Johns Hopkins University

GET Historical Data by Country Name
https://corona.lmao.ninja/v2/historical/:query?lastdays=30

Get a country's time series using a country iso code, country ID, or of course, country name. Data is updated every 10 minutes.

PARAMS
lastdays

Number of days you want the data to go back to. Default is 30. Use all for full data set. Ex: 15, all, 24

PATH VARIABLES
query

Required. For this parameter you can use Country Name && Country Id && ISOs (ISO 2 | ISO 3) 3166 Country Standards

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical/Spain?lastdays=30' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


<#

JHUCSSE

Data from Johns Hopkins University

GET Historical Data by multiple Country Names
https://corona.lmao.ninja/v2/historical/:query?lastdays=30

Get multiple countrys' time series using multiple country iso codes, country IDs, or of course, country names. Data is updated every 10 minutes.

PARAMS
lastdays

Number of days you want the data to go back to. Default is 30. Use all for full data set.

Ex: 15, all, 24

PATH VARIABLES
query

For this parameter you can use multiple Country Names && Country Ids && ISOs (ISO 2 | ISO 3) 3166 Country Standards separated by commas.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical/Japan,Chile?lastdays=30' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


<#

JHUCSSE

Data from Johns Hopkins University

GET Historical Data by Province Name
https://corona.lmao.ninja/v2/historical/:query/:province?lastdays
Get a province within a country's time series. Example is /v2/historical/chn/tibet. CHN is China's iso3 code. Data is updated every 10 minutes.

PARAMS
lastdays

Number of days you want the data to go back to. Default is 30. Use all for full data set.
Ex: 15, all, 24.

PATH VARIABLES
query

Required. For this parameter you can use Country Name && Country Id && ISOs (ISO 2 | ISO 3) 3166 Country Standards.

province

Required. Province name.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical/China/hainan?lastdays=' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


<#

JHUCSSE

Data from Johns Hopkins University

GET Historical Data by multiple Province Names
https://corona.lmao.ninja/v2/historical/:query/:provinces?lastdays=30
Get multiple provinces' time series using multiple Country Names && Country Ids && ISOs (ISO 2 | ISO 3) 3166 Country Standards. Data is updated every 10 minutes.

PARAMS
lastdays

Number of days you want the data to go back to. Default is 30. Use all for full data set.

Ex: 15, all, 24

PATH VARIABLES
query

Required. For this parameter you can use multiple Country Names && Country Ids && ISOs (ISO 2 | ISO 3) 3166 Country Standards separated by commas.

provinces

Required. Provinces spelled correctly separated by ',' or '|' delimiters, never both in the same query.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical/China/yunnan,tianjin?lastdays=30' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json


<#

JHUCSSE

Data from Johns Hopkins University

GET Historical Time Series Data
https://corona.lmao.ninja/v2/historical/all

Return time series data globally. Data is updated every 10 minutes.

#>

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")

$response = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical/all' -Method 'GET' -Headers $headers -Body $body
$response | ConvertTo-Json

