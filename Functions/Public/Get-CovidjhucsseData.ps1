function Get-CovidjhucsseData {

    BEGIN {
    
    }

    PROCESS {
        $jhucsseDataHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $jhucsseDataHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $jhucsseData = Invoke-RestMethod 'https://corona.lmao.ninja/jhucsse' -Method 'GET' -Headers $jhucsseDataHeaders -Body $body

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
