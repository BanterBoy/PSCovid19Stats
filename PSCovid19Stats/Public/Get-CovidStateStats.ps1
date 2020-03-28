
function Get-CovidStateStats {

    BEGIN {
        
    }
    
    PROCESS {
        $StateHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $StateHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $StateResponses = Invoke-RestMethod 'https://corona.lmao.ninja/states' -Method 'GET' -Headers $StateHeaders -Body $body
        
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
