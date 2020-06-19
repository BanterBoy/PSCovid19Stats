function Get-CovidState {

    <#

        .SYNOPSIS
        Command used to extract Data for all US States from the NovelCOVID API (github.com/NovelCOVID/API)

        .DESCRIPTION
        Command used to extract Data for select US States from the NovelCOVID API (github.com/NovelCOVID/API). Get stats on United States of America States with COVID-19, including cases, new cases, deaths, new deaths, and active cases. Data is updated every 10 minutes.

        The default sorting for this command is active cases if no sorting option is selected.

        .INPUTS
        You can pipe the string for "state" objects to Get-CovidState

        .OUTPUTS
        System.String. Get stats on United States of America States with COVID-19, including cases, new cases, deaths, new deaths, and active cases. Data is updated every 10 minutes.

        .EXAMPLE
        Get-CovidState -state "New Hampshire"

        updated             : 1592552385569
        cases               : 5450
        testsPerOneMillion  : 88675
        todayDeaths         : 0
        todayCases          : 0
        deathsPerOneMillion : 243
        deaths              : 331
        state               : New Hampshire
        active              : 1015
        casesPerOneMillion  : 4008
        tests               : 120573

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidState

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
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Default')]
        [string]$state
    )

    BEGIN {
        if ( $yesterday ) {
            $URI = "https://corona.lmao.ninja/v2/states/$state?yesterday=$yesterday"
        }
        else {
            $URI = "https://corona.lmao.ninja/v2/states/$state"
        }
    }

    PROCESS {
        $stateHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $stateHeaders.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")
        $stateResponses = Invoke-RestMethod $URI -Method 'GET' -Headers $stateHeaders -Body $body
        
        foreach ($Response in $stateResponses) {
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
