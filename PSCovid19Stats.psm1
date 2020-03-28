function Get-CovidCountriesStats {

    BEGIN {
    
    }

    PROCESS {
        $CountriesHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $CountriesHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $CountriesResponses = Invoke-RestMethod 'https://corona.lmao.ninja/countries?sort=country' -Method 'GET' -Headers $CountriesHeaders -Body $body

        foreach ($Response in $CountriesResponses) {
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


function Get-CovidCountryStats {
    
    [CmdletBinding(DefaultParameterSetName = 'ParameterSet1',
        SupportsShouldProcess = $false,
        PositionalBinding = $false,
        HelpUri = 'http://www.microsoft.com/',
        ConfirmImpact = 'Medium')]
    param(
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'ParameterSet1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [OutputType([String])]
        [ArgumentCompleter( { 'AF', 'AX', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'BT', 'BO', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'KH', 'CM', 'CA', 'CV', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CG', 'CD', 'CK', 'CR', 'CI', 'HR', 'CU', 'CY', 'CZ', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'VA', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IL', 'IT', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'KR', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MK', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'AN', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RE', 'RO', 'RU', 'RW', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SK', 'SI', 'SB', 'SO', 'ZA', 'GS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SZ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TR', 'TM', 'TC', 'TV', 'UG', 'UA', 'AE', 'GB', 'US', 'UM', 'UY', 'UZ', 'VU', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW' }) ]
        [string]
        $Country
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

function Get-CovidWorldStats {

    BEGIN {
    
    }

    PROCESS {
        $AllHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $AllHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
        $AllResponses = Invoke-RestMethod 'https://corona.lmao.ninja/all' -Method 'GET' -Headers $AllHeaders -Body $body

        foreach ($Response in $AllResponses) {
            try {
                $properties = @{
                    Cases     = $Response.cases
                    Deaths    = $Response.Deaths
                    Recovered = $Response.Recovered
                    Updated   = $Response.Updated
                    Active    = $Response.Active
                }
            }
            catch {
                $properties = @{
                    Cases     = $Response.cases
                    Deaths    = $Response.Deaths
                    Recovered = $Response.Recovered
                    Updated   = $Response.Updated
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
