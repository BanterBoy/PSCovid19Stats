<#

JHUCSSE

Data from Johns Hopkins University

Countries / Continents

Data from                                                                                                                                                                                                         

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

function Get-CovidContinent {

    <#
        .SYNOPSIS
        Command used to extract data (Continent Stats) from the NovelCOVID API (github.com/NovelCOVID/API)
    
        .DESCRIPTION
        Command used to extract data (Continent Stats) from the NovelCOVID API (github.com/NovelCOVID/API)
        Returns data of a specific Continent.
    
        .PARAMETER Continent
        
    
        .INPUTS
        None. You cannot pipe objects to Get-CovidContinent
    
        .OUTPUTS
        System.String. Get-CovidCountriesStats returns a string with all of the Covid-19 stats for the
        specified Continent.
    
        .EXAMPLE
        PS C:\GitRepos> Get-CovidContinent -Continent UK
        
        DeathsPerOneMillion : 18
        TodayCases          : 2433
        CasesPerOneMillion  : 288
        Deaths              : 1228
        Critical            : 163
        Active              : 18159
        Recovered           : 135
        Country             : UK
        TodayDeaths         : 209
        Cases               : 19522

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidContinent
    
        .NOTES
        Author:     Luke Leigh
        Website:    https://blog.lukeleigh.com/
        LinkedIn:   https://www.linkedin.com/in/lukeleigh/
        GitHub:     https://github.com/BanterBoy/
        GitHubGist: https://gist.github.com/BanterBoy
    
    #>
    

    [CmdletBinding(DefaultParameterSetName = 'ParameterSet1',
        SupportsShouldProcess = $false,
        PositionalBinding = $false,
        ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'ParameterSet1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [OutputType([String])]
        [ArgumentCompleter( {
                $ContinentList = (Invoke-RestMethod 'https://corona.lmao.ninja/v2/continents').continent
                foreach ($item in $ContinentList) {
                    $item
                }
            }) ]
        [string]$Continent
    )

    BEGIN {

    }
    
    PROCESS {

        $continentHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $continentHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $continentResponse = Invoke-RestMethod 'https://corona.lmao.ninja/v2/continents?yesterday=true&sort=' -Method 'GET' -Headers $headers -Body $body



        foreach ($Response in $continentResponse) {
            try {
                $properties = @{
                    active                 = [long]$Response.active
                    activePerOneMillion    = [double]$Response.activePerOneMillion
                    cases                  = [long]$Response.cases
                    casesPerOneMillion     = [double]$Response.casesPerOneMillion
                    continent              = [string]$Response.continent
                    countries              = [Object]$Response.countries
                    critical               = [long]$Response.critical
                    criticalPerOneMillion  = [double]$Response.criticalPerOneMillion
                    deaths                 = [long]$Response.deaths
                    deathsPerOneMillion    = [double]$Response.deathsPerOneMillion
                    population             = [long]$Response.population
                    recovered              = [long]$Response.recovered
                    recoveredPerOneMillion = [double]$Response.recoveredPerOneMillion
                    tests                  = [long]$Response.tests
                    testsPerOneMillion     = [double]$Response.testsPerOneMillion
                    todayCases             = [long]$Response.todayCases
                    todayDeaths            = [long]$Response.todayDeaths
                    todayRecovered         = [long]$Response.todayRecovered
                    updated                = [long]$Response.updated
                }
            }
            catch {
                $properties = @{
                    active                 = [long]$Response.active
                    activePerOneMillion    = [double]$Response.activePerOneMillion
                    cases                  = [long]$Response.cases
                    casesPerOneMillion     = [double]$Response.casesPerOneMillion
                    continent              = [string]$Response.continent
                    countries              = [Object]$Response.countries
                    critical               = [long]$Response.critical
                    criticalPerOneMillion  = [double]$Response.criticalPerOneMillion
                    deaths                 = [long]$Response.deaths
                    deathsPerOneMillion    = [double]$Response.deathsPerOneMillion
                    population             = [long]$Response.population
                    recovered              = [long]$Response.recovered
                    recoveredPerOneMillion = [double]$Response.recoveredPerOneMillion
                    tests                  = [long]$Response.tests
                    testsPerOneMillion     = [double]$Response.testsPerOneMillion
                    todayCases             = [long]$Response.todayCases
                    todayDeaths            = [long]$Response.todayDeaths
                    todayRecovered         = [long]$Response.todayRecovered
                    updated                = [long]$Response.updated
                }
            }
            finally {
                $obj = New-Object -TypeName PSObject -Property $Properties
                Write-Output $obj
            }
        }
    }

    END {

    }

}


<#

GET All Countries
https://corona.lmao.ninja/v2/countries?yesterday&sort
Returns a JSON array with an element for each country that has stats available. This includes iso codes, lat/long, a link to the country flag, cases, new cases, deaths, new deaths, recovered, active cases, critical cases, and cases/deaths per one million people. Data is updated every 10 minutes.

PARAMS
yesterday
For this parameter you can show yesterday data

Available values : true, false, 1, 0.

sort
For this parameter you can provide a key from the country model (e.g. cases, todayCases, deaths, recovered, active, etc) to sort the countries from greatest to least, depending on the key

Available values : cases, todayCases, deaths, todayDeaths, recovered, active, critical, casesPerOneMillion, deathsPerOneMillion.


GET Specific Contry
https://corona.lmao.ninja/v2/countries/:query?yesterday=true&strict=true&query
Get the same data from the /countries endpoint, but filter down to a specific country.

PARAMS
yesterdaytrue
For this parameter you can show yesterday data

Available values : true, false, 1, 0.

stricttrue
Defaults to true. Setting to false gives you the ability to fuzzy search countries. Example Oman vs. rOMANia

query
Required

PATH VARIABLES
queryItaly
For this parameter you can use Country Name && Country Id && ISOs (ISO 2 | ISO 3) 3166 Country Standards


GET Multiple Countries
https://corona.lmao.ninja/v2/countries/:query?yesterday
Get the same data from the /countries endpoint, but filter down to multiple specific countries. Data is updated every 10 minutes.

PARAMS
yesterday
For this parameter you can show yesterday data

Available values : true, false, 1, 0.

PATH VARIABLES
queryItaly,Brazil
For this parameter you can use multiple Country Names && Country Ids && ISOs (ISO 2 | ISO 3) 3166 Country Standards separated by commas

#>


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