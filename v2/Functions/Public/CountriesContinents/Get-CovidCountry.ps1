function Get-CovidCountry {

    <#
        .SYNOPSIS
        Command used to extract data (Country Stats) from the NovelCOVID API (github.com/NovelCOVID/API)
    
        .DESCRIPTION
        Command used to extract data (Country Stats) from the NovelCOVID API (github.com/NovelCOVID/API)
        Returns data of a specific country.
    
        .PARAMETER Country
        This is a mandatory field which you can enter manually or using tab to cycle through the options.
        This field uses the standard [ISO Country Codes](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)
    
        .INPUTS
        None. You cannot pipe objects to Get-CovidCountry
    
        .OUTPUTS
        System.String. Get-CovidCountriesStats returns a string with all of the Covid-19 stats for the
        specified country.
    
        .EXAMPLE
        PS C:\GitRepos> Get-CovidCountry -Country UK
        
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
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidCountry
    
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
        HelpUri = 'https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidCountry',
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
                $Content = Invoke-RestMethod -Uri 'https://datahub.io/core/country-list/r/data.json'
                $ISOCodes = $Content | Sort-Object -Property Code
                foreach ($Code in $ISOCodes) {
                    $Code.Code
                }
            }) ]
        [string]
        $Country
    )

    BEGIN {
    }
    
    PROCESS {
        $CountryHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $CountryHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $CountryResponse = Invoke-RestMethod "https://corona.lmao.ninja/v2/countries/$Country" -Method 'GET' -Headers $CountryHeaders -Body $body
        
        foreach ($Response in $CountryResponse) {
            try {
                $properties = @{
                    Country             = [string]$Response.country
                    TodayCases          = [int]$Response.todayCases
                    TodayDeaths         = [int]$Response.todayDeaths
                    Cases               = [int]$Response.cases
                    Active              = [int]$Response.active
                    Critical            = [int]$Response.critical
                    Deaths              = [int]$Response.deaths
                    Recovered           = [int]$Response.recovered
                    CasesPerOneMillion  = [decimal]$Response.casesPerOneMillion
                    DeathsPerOneMillion = [decimal]$Response.deathsPerOneMillion
                }
            }
            catch {
                $properties = @{
                    Country             = [string]$Response.country
                    TodayCases          = [int]$Response.todayCases
                    TodayDeaths         = [int]$Response.todayDeaths
                    Cases               = [int]$Response.cases
                    Active              = [int]$Response.active
                    Critical            = [int]$Response.critical
                    Deaths              = [int]$Response.deaths
                    Recovered           = [int]$Response.recovered
                    CasesPerOneMillion  = [decimal]$Response.casesPerOneMillion
                    DeathsPerOneMillion = [decimal]$Response.deathsPerOneMillion
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
