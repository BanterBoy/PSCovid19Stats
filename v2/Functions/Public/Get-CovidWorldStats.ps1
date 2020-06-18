function Get-CovidWorldStats {

    <#
        .SYNOPSIS
        Command used to extract data (Global Stats) from the NovelCOVID API (github.com/NovelCOVID/API).
    
        .DESCRIPTION
        This command can be used to extract data (Global Stats) from the NovelCOVID API (github.com/NovelCOVID/API). It will extract the global statistics and includes: cases, deaths, recovered, time last updated, and active cases. This data is updated every 10 minutes.
    
        .INPUTS
        None. You cannot pipe objects to Get-CovidWorldStats
    
        .OUTPUTS
        System.String. Get-CovidWorldStats returns a string with all of the stats for every country affected with Covid-19.
    
        .EXAMPLE
        Get-CovidWorldStats

        deathsPerOneMillion    : 57.3
        activePerOneMillion    : 451.07
        oneDeathPerPeople      : 0
        deaths                 : 446666
        oneTestPerPeople       : 0
        critical               : 54576
        oneCasePerPeople       : 0
        criticalPerOneMillion  : 7.04
        active                 : 3498202
        recovered              : 4341839
        tests                  : 117370255
        casesPerOneMillion     : 1063
        updated                : 1592390360372
        todayRecovered         : 39052
        recoveredPerOneMillion : 559.85
        testsPerOneMillion     : 15134.07
        todayCases             : 35483
        todayDeaths            : 1478
        population             : 7755366723
        affectedCountries      : 215
        cases                  : 8286707

        .EXAMPLE
        Get-CovidWorldStats -yesterday

        deathsPerOneMillion    : 57.3
        activePerOneMillion    : 451.14
        oneDeathPerPeople      : 0
        deaths                 : 446667
        oneTestPerPeople       : 0
        critical               : 54576
        oneCasePerPeople       : 0
        criticalPerOneMillion  : 7.04
        active                 : 3498778
        recovered              : 4341848
        tests                  : 117386313
        casesPerOneMillion     : 1063
        updated                : 1592390960163
        todayRecovered         : 39061
        recoveredPerOneMillion : 559.85
        testsPerOneMillion     : 15136.14
        todayCases             : 36069
        todayDeaths            : 1479
        population             : 7755366723
        affectedCountries      : 215
        cases                  : 8287293

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidWorldStats
    
        .NOTES
        Author:     Luke Leigh
        Website:    https://blog.lukeleigh.com/
        LinkedIn:   https://www.linkedin.com/in/lukeleigh/
        GitHub:     https://github.com/BanterBoy/
        GitHubGist: https://gist.github.com/BanterBoy
    
    #>

    [CmdletBinding(DefaultParameterSetName = 'Default',
        SupportsShouldProcess = $false,
        PositionalBinding = $false,
        ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $false,
            ValueFromPipelineByPropertyName = $false,
            ParameterSetName = 'Default')]
        [switch]$yesterday
    )


    BEGIN {
        if ( $yesterday ) { $URI = "https://corona.lmao.ninja/v2/all?yesterday" }
        else { $URI = "https://corona.lmao.ninja/v2/all" }
    }

    PROCESS {

        $AllStatsHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $AllStatsHeaders.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")
        $AllStatsResponses = Invoke-RestMethod "$URI" -Method 'GET' -Headers $AllStatsHeaders -Body $body

        foreach ($Response in $AllStatsResponses) {
            try {
                $properties = @{
                    active                 = [long]$Response.active
                    activePerOneMillion    = [double]$Response.activePerOneMillion
                    affectedCountries      = [long]$Response.affectedCountries
                    cases                  = [long]$Response.cases
                    casesPerOneMillion     = [long]$Response.casesPerOneMillion
                    critical               = [long]$Response.critical
                    criticalPerOneMillion  = [double]$Response.criticalPerOneMillion
                    deaths                 = [long]$Response.deaths
                    deathsPerOneMillion    = [double]$Response.deathsPerOneMillion
                    oneCasePerPeople       = [long]$Response.oneCasePerPeople
                    oneDeathPerPeople      = [long]$Response.oneDeathPerPeople
                    oneTestPerPeople       = [long]$Response.oneTestPerPeople
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
                    affectedCountries      = [long]$Response.affectedCountries
                    cases                  = [long]$Response.cases
                    casesPerOneMillion     = [long]$Response.casesPerOneMillion
                    critical               = [long]$Response.critical
                    criticalPerOneMillion  = [double]$Response.criticalPerOneMillion
                    deaths                 = [long]$Response.deaths
                    deathsPerOneMillion    = [double]$Response.deathsPerOneMillion
                    oneCasePerPeople       = [long]$Response.oneCasePerPeople
                    oneDeathPerPeople      = [long]$Response.oneDeathPerPeople
                    oneTestPerPeople       = [long]$Response.oneTestPerPeople
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
