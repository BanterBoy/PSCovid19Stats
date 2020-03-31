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
        [string]
        $Country
    )

    BEGIN {
    }
    
    PROCESS {
        $CountryHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $CountryHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $CountryResponse = Invoke-RestMethod "https://corona.lmao.ninja/countries/$Country" -Method 'GET' -Headers $CountryHeaders -Body $body
        
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
