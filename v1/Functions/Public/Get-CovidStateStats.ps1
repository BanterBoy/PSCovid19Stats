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
