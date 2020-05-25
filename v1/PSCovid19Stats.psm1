function Get-CovidCountriesStats {

    <#
        .SYNOPSIS
        Command used to extract data (Country Stats) from the NovelCOVID API (github.com/NovelCOVID/API)
    
        .DESCRIPTION
        Command used to extract data (Country Stats) from the NovelCOVID API (github.com/NovelCOVID/API)
        Returns data of all countries that has COVID-19
    
        .INPUTS
        None. You cannot pipe objects to Get-CovidCountryStats
    
        .OUTPUTS
        System.String. Get-CovidCountriesStats returns a string with all of the Covid-19 stats for every
        country affected
    
        .EXAMPLE
        PS C:\GitRepos> Get-CovidCountriesStats | Format-Table -AutoSize                                                                                                                                
        DeathsPerOneMillion TodayCases CasesPerOneMillion Deaths Critical Active Recovered Country  TodayDeaths  Cases
        ------------------- ---------- ------------------ ------ -------- ------ --------- -------  -----------  -----
        0.07                0           0.5               1      0        6      0         Zimbabwe 0            7
        0                   1           2                 0      0        29     0         Zambia   0            29

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidCountriesStats
    
        .NOTES
        Author:     Luke Leigh
        Website:    https://blog.lukeleigh.com/
        LinkedIn:   https://www.linkedin.com/in/lukeleigh/
        GitHub:     https://github.com/BanterBoy/
        GitHubGist: https://gist.github.com/BanterBoy
    
    #>

    BEGIN {

    }

    PROCESS {
        $CountriesHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $CountriesHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $CountriesResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/countries?sort=country' -Method 'GET' -Headers $CountriesHeaders -Body $body

        foreach ($Response in $CountriesResponses) {
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

function Get-CovidCountryStats {

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
        None. You cannot pipe objects to Get-CovidCountryStats
    
        .OUTPUTS
        System.String. Get-CovidCountriesStats returns a string with all of the Covid-19 stats for the
        specified country.
    
        .EXAMPLE
        PS C:\GitRepos> Get-CovidCountryStats -Country UK
        
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
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidCountryStats
    
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
        HelpUri = 'https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidCountryStats',
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

function Get-CovidHistoricalData {

    <#
        .SYNOPSIS
        Command used to extract historical data from the NovelCOVID API (github.com/NovelCOVID/API)

        .DESCRIPTION
        Command used to extract historical data from the NovelCOVID API (github.com/NovelCOVID/API)

        .INPUTS
        None. You cannot pipe objects to Get-CovidHistoricalData

        .OUTPUTS
        System.String. Get-CovidHistoricalData returns a string with all of the Covid-19 stats for every
        country affected

        .EXAMPLE
        PS C:\GitRepos> Get-CovidHistoricalData

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidHistoricalData

        .NOTES
        Author: Luke Leigh  
        Website: https://blog.lukeleigh.com  
        LinkedIn: https://www.linkedin.com/in/lukeleigh  
        GitHub: https://github.com/BanterBoy  
        GitHubGist: https://gist.github.com/BanterBoy  
    #>

    BEGIN {
    
    }

    PROCESS {
        $HistoricalDataHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $HistoricalDataHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $HistoricalData = Invoke-RestMethod 'https://corona.lmao.ninja/v2/v2/historical' -Method 'GET' -Headers $HistoricalDataHeaders -Body $body

        foreach ($Data in $HistoricalData) {
            try {
                $properties = @{
                    country  = $Data.country
                    province = $Data.province
                    Cases    = $HistoricalData[0].timeline.cases
                    Deaths   = $HistoricalData[0].timeline.deaths
                }
            }
            catch {
                $properties = @{
                    country  = $Data.country
                    province = $Data.province
                    Cases    = $HistoricalData[0].timeline.cases
                    Deaths   = $HistoricalData[0].timeline.deaths
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

function Get-CovidjhucsseData {

    <#

        .SYNOPSIS
        Command used to extract John HOpkins CSSE Data from the NovelCOVID API (github.com/NovelCOVID/API)

        .DESCRIPTION
        Command used to extract John HOpkins CSSE Data from the NovelCOVID API (github.com/NovelCOVID/API)
        Return data from the John Hopkins CSSE Data Repository (Provinces and such).

        .INPUTS
        None. You cannot pipe objects to Get-CovidjhucsseData

        .OUTPUTS
        System.String. Get-CovidjhucsseData returns a string with all of the Covid-19 stats for every
        country affected

        .EXAMPLE
        PS C:\GitRepos> Get-CovidjhucsseData

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidjhucsseData

        .NOTES
        Author: Luke Leigh  
        Website: https://blog.lukeleigh.com  
        LinkedIn: https://www.linkedin.com/in/lukeleigh  
        GitHub: https://github.com/BanterBoy  
        GitHubGist: https://gist.github.com/BanterBoy  

#>


    BEGIN {
    
    }

    PROCESS {
        $jhucsseDataHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $jhucsseDataHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $jhucsseData = Invoke-RestMethod 'https://corona.lmao.ninja/v2/jhucsse' -Method 'GET' -Headers $jhucsseDataHeaders -Body $body

        foreach ($jhucsse in $jhucsseData) {
            try {
                $properties = @{
                    City      = [string]$jhucsse.city
                    Province  = [string]$jhucsse.province
                    Country   = [string]$jhucsse.country
                    UpdatedAt = [datetime]$jhucsse.updatedAt
                    Longitude = $jhucsse.coordinates.longitude
                    Latitude  = $jhucsse.coordinates.latitude
                    Confirmed = $jhucsse.stats.confirmed
                    Recovered = $jhucsse.stats.recovered
                    Deaths    = $jhucsse.stats.deaths
                }
            }
            catch {
                $properties = @{
                    City      = [string]$jhucsse.city
                    Province  = [string]$jhucsse.province
                    Country   = [string]$jhucsse.country
                    UpdatedAt = [datetime]$jhucsse.updatedAt
                    Longitude = $jhucsse.coordinates.longitude
                    Latitude  = $jhucsse.coordinates.latitude
                    Confirmed = $jhucsse.stats.confirmed
                    Recovered = $jhucsse.stats.recovered
                    Deaths    = $jhucsse.stats.deaths
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

function Get-CovidStateStats {

    <#

        .SYNOPSIS
        Command used to extract Data for all US States from the NovelCOVID API (github.com/NovelCOVID/API)

        .DESCRIPTION
        Command used to extract John HOpkins CSSE Data from the NovelCOVID API (github.com/NovelCOVID/API)
        Return data from the John Hopkins CSSE Data Repository (Provinces and such).

        .INPUTS
        None. You cannot pipe objects to Get-CovidStateStats

        .OUTPUTS
        System.String. Get-CovidStateStats returns a string with all of the Covid-19 stats for all US States

        .EXAMPLE
        PS C:\GitRepos> Get-CovidStateStats

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidStateStats

        .NOTES
        Author: Luke Leigh  
        Website: https://blog.lukeleigh.com  
        LinkedIn: https://www.linkedin.com/in/lukeleigh  
        GitHub: https://github.com/BanterBoy  
        GitHubGist: https://gist.github.com/BanterBoy  

    #>


    BEGIN {
        
    }
    
    PROCESS {
        $StateHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $StateHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $StateResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/states' -Method 'GET' -Headers $StateHeaders -Body $body
        
        foreach ($Response in $StateResponses) {
            try {
                $properties = @{
                    State       = [string]$Response.state
                    TodayCases  = [int]$Response.todayCases
                    TodayDeaths = [int]$Response.todayDeaths
                    Cases       = [int]$Response.cases
                    Active      = [int]$Response.active
                    Deaths      = [int]$Response.deaths
                }
            }
            catch {
                $properties = @{
                    State       = [string]$Response.state
                    TodayCases  = [int]$Response.todayCases
                    TodayDeaths = [int]$Response.todayDeaths
                    Cases       = [int]$Response.cases
                    Active      = [int]$Response.active
                    Deaths      = [int]$Response.deaths
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

function Get-CovidWorldStats {

    <#

        .SYNOPSIS
        Command used to extract Data for all Returns all total cases, recovery, and deaths from the NovelCOVID API (github.com/NovelCOVID/API)

        .DESCRIPTION
        Command used to extract John HOpkins CSSE Data from the NovelCOVID API (github.com/NovelCOVID/API)
        Returns all total cases, recovery, and deaths.

        .INPUTS
        None. You cannot pipe objects to Get-CovidWorldStats

        .OUTPUTS
        System.String. Get-CovidWorldStats returns a string of all total cases, recovery, and deaths.

        .EXAMPLE
        PS C:\GitRepos> Get-CovidWorldStats
        Active    : 536625
        Recovered : 151312
        Deaths    : 33966
        Cases     : 721903
        Updated   : 30/03/2020 02:08:07

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidWorldStats

        .NOTES
        Author: Luke Leigh  
        Website: https://blog.lukeleigh.com  
        LinkedIn: https://www.linkedin.com/in/lukeleigh  
        GitHub: https://github.com/BanterBoy  
        GitHubGist: https://gist.github.com/BanterBoy  

    #>


    BEGIN {
    
    }

    PROCESS {
        $AllHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $AllHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $AllResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/all' -Method 'GET' -Headers $AllHeaders -Body $body
        $EpochStart = Get-Date "01/01/1970 00:00:00"

        foreach ($Response in $AllResponses) {
            try {
                $properties = @{
                    Cases     = $Response.cases
                    Deaths    = $Response.Deaths
                    Recovered = $Response.Recovered
                    Updated   = $EpochStart.AddMilliseconds($Response.Updated)
                    Active    = $Response.Active
                }
            }
            catch {
                $properties = @{
                    Cases     = $Response.cases
                    Deaths    = $Response.Deaths
                    Recovered = $Response.Recovered
                    Updated   = $EpochStart.AddMilliseconds($Response.Updated)
                    Active    = $Response.Active
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

function Show-CountryCodes {
    <#
        .SYNOPSIS
        Command used to display a list of Country Codes
    
        .DESCRIPTION
        This Command can be used to display a list of standard Country Codes from the standard [ISO Country Codes](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)
    
        .INPUTS
        None. You cannot pipe objects to Show-CountryCodes
    
        .OUTPUTS
        System.String. Show-CountryCodes returns a string with all of the ISO Country Codes.
    
        .EXAMPLE
        PS C:\GitRepos> Show-CountryCodes
        Code Name
        ---- ----
        AF   Afghanistan
        AX   Åland Islands
        AL   Albania
        DZ   Algeria
        AS   American Samoa
        AD   Andorra
        AO   Angola
        AI   Anguilla
        AQ   Antarctica
        ...............

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Show-CountryCodes
    
        .NOTES
        Author:     Luke Leigh
        Website:    https://blog.lukeleigh.com/
        LinkedIn:   https://www.linkedin.com/in/lukeleigh/
        GitHub:     https://github.com/BanterBoy/
        GitHubGist: https://gist.github.com/BanterBoy
    
    #>
    Invoke-RestMethod -Uri 'https://datahub.io/core/country-list/r/data.json'
}
