function Get-CovidWorldStats {

    BEGIN {
    
    }

    PROCESS {
        $AllHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $AllHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $AllResponses = Invoke-RestMethod 'https://corona.lmao.ninja/all' -Method 'GET' -Headers $AllHeaders -Body $body
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
