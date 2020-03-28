function Get-CovidHistoricalData {

    BEGIN {
    
    }

    PROCESS {
        $HistoricalDataHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $HistoricalDataHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $HistoricalData = Invoke-RestMethod 'https://corona.lmao.ninja/v2/historical' -Method 'GET' -Headers $HistoricalDataHeaders -Body $body

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
