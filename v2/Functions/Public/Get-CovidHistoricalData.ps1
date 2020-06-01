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
