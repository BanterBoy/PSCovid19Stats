function Get-CovidStateStats {

    <#

        .SYNOPSIS
        Command used to extract Data for all US States from the NovelCOVID API (github.com/NovelCOVID/API)

        .DESCRIPTION
        Command used to extract Data for all US States from the NovelCOVID API (github.com/NovelCOVID/API). Get stats on United States of America States with COVID-19, including cases, new cases, deaths, new deaths, and active cases. Data is updated every 10 minutes.

        The default sorting for this command is active cases if no sorting option is selected.

        .INPUTS
        None. You cannot pipe objects to Get-CovidStateStats

        .OUTPUTS
        System.String. Get stats on United States of America States with COVID-19, including cases, new cases, deaths, new deaths, and active cases. Data is updated every 10 minutes.

        .EXAMPLE
        PS C:\GitRepos> Get-CovidStateStats

        [
            {
                "state": "Wyoming",
                "updated": 1592525381158,
                "cases": 1114,
                "todayCases": 25,
                "deaths": 18,
                "todayDeaths": 0,
                "active": 234,
                "casesPerOneMillion": 1925,
                "deathsPerOneMillion": 31,
                "tests": 35069,
                "testsPerOneMillion": 60593
            },
            {
                "state": "Wuhan Repatriated",
                "updated": 1592525381158,
                "cases": 3,
                "todayCases": 0,
                "deaths": 0,
                "todayDeaths": 0,
                "active": 3,
                "casesPerOneMillion": 0,
                "deathsPerOneMillion": 0,
                "tests": 3,
                "testsPerOneMillion": 0
            }
        ]

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidStateStats

        .NOTES
        Author: Luke Leigh  
        Website: https://blog.lukeleigh.com  
        LinkedIn: https://www.linkedin.com/in/lukeleigh  
        GitHub: https://github.com/BanterBoy  
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
        [switch]$yesterday,
        [Parameter(Mandatory = $false,
            ValueFromPipeline = $false,
            ValueFromPipelineByPropertyName = $false,
            ParameterSetName = 'Default')]
        [ValidateSet('cases', 'todayCases', 'deaths', 'todayDeaths', 'active')]
        [string]$sort = 'active'
    )


    BEGIN {
        if ( $yesterday ) { $URI = "https://corona.lmao.ninja/v2/states?sort=$sort&yesterday=$yesterday" }
        else { $URI = "https://corona.lmao.ninja/v2/states?sort=$sort" }
    }
    
    PROCESS {
        $statesHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $statesHeaders.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")
        $statesResponses = Invoke-RestMethod "$URI" -Method 'GET' -Headers $statesHeaders -Body $body
        
        foreach ($Response in $statesResponses) {
            try {
                $properties = @{
                    state               = [string]$Response.state
                    active              = [long]$Response.active
                    cases               = [long]$Response.cases
                    todayCases          = [long]$Response.todayCases
                    casesPerOneMillion  = [long]$Response.casesPerOneMillion
                    deaths              = [long]$Response.deaths
                    todayDeaths         = [long]$Response.todayDeaths
                    deathsPerOneMillion	= [long]$Response.deathsPerOneMillion
                    tests               = [long]$Response.tests
                    testsPerOneMillion  = [long]$Response.testsPerOneMillion
                    updated             = [long]$Response.updated
                }
            }
            catch {
                $properties = @{
                    state               = [string]$Response.state
                    active              = [long]$Response.active
                    cases               = [long]$Response.cases
                    todayCases          = [long]$Response.todayCases
                    casesPerOneMillion  = [long]$Response.casesPerOneMillion
                    deaths              = [long]$Response.deaths
                    todayDeaths         = [long]$Response.todayDeaths
                    deathsPerOneMillion	= [long]$Response.deathsPerOneMillion
                    tests               = [long]$Response.tests
                    testsPerOneMillion  = [long]$Response.testsPerOneMillion
                    updated             = [long]$Response.updated
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
