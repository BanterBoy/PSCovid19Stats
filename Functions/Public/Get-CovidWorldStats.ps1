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
