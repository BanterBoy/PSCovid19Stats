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
