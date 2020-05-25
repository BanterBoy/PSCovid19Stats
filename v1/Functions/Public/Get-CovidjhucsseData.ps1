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
