
function Get-CovidCountryStats {
    
    [CmdletBinding(DefaultParameterSetName = 'ParameterSet1',
        SupportsShouldProcess = $false,
        PositionalBinding = $false,
        HelpUri = 'http://www.microsoft.com/',
        ConfirmImpact = 'Medium')]
    Param (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'ParameterSet1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [OutputType([String])]
        [String[]]$Country
    )

    BEGIN {
    }
    
    PROCESS {
        $CountryHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $CountryHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $CountryResponse = Invoke-RestMethod "https://corona.lmao.ninja/countries/$Country" -Method 'GET' -Headers $CountryHeaders -Body $body
        
        foreach ($Response in $CountryResponse) {
            try {
                $properties = @{
                    Country             = [string]$Response.country
                    TodayCases          = [int]$Response.todayCases
                    TodayDeaths         = [int]$Response.todayDeaths
                    Cases               = [int]$Response.cases
                    Active              = [int]$Response.active
                    Critical            = [int]$Response.critical
                    Deaths              = [int]$Response.deaths
                    Recovered           = [int]$Response.recovered
                    CasesPerOneMillion  = [decimal]$Response.casesPerOneMillion
                    DeathsPerOneMillion = [decimal]$Response.deathsPerOneMillion
                }
            }
            catch {
                $properties = @{
                    Country             = [string]$Response.country
                    TodayCases          = [int]$Response.todayCases
                    TodayDeaths         = [int]$Response.todayDeaths
                    Cases               = [int]$Response.cases
                    Active              = [int]$Response.active
                    Critical            = [int]$Response.critical
                    Deaths              = [int]$Response.deaths
                    Recovered           = [int]$Response.recovered
                    CasesPerOneMillion  = [decimal]$Response.casesPerOneMillion
                    DeathsPerOneMillion = [decimal]$Response.deathsPerOneMillion
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
