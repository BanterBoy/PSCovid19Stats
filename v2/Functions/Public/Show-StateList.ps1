function Show-StateList {
    <#
        .SYNOPSIS
        Command used to display a list of Country Codes
    
        .DESCRIPTION
        This Command can be used to display a list of standard Country Codes from the standard [ISO Country Codes](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)
    
        .INPUTS
        None. You cannot pipe objects to Show-CountryCodes
    
        .OUTPUTS
        System.String. Show-CountryCodes returns a string with all of the ISO Country Codes.
    
        .EXAMPLE
        PS C:\GitRepos> Show-CountryCodes
        Code Name
        ---- ----
        AF   Afghanistan
        AX   Åland Islands
        AL   Albania
        DZ   Algeria
        AS   American Samoa
        AD   Andorra
        AO   Angola
        AI   Anguilla
        AQ   Antarctica
        ...............

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Show-CountryCodes
    
        .NOTES
        Author:     Luke Leigh
        Website:    https://blog.lukeleigh.com/
        LinkedIn:   https://www.linkedin.com/in/lukeleigh/
        GitHub:     https://github.com/BanterBoy/
        GitHubGist: https://gist.github.com/BanterBoy
    
    #>

    BEGIN {
        $URI = "https://corona.lmao.ninja/v2/states?sort=$sort"
    }
    
    PROCESS {
        $statesHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $statesHeaders.Add("Cookie", "__cfduid=da03e729af67bf9c91ba81e024407965b1592138079")
        $statesResponses = Invoke-RestMethod "$URI" -Method 'GET' -Headers $statesHeaders -Body $body
        foreach ($Response in $statesResponses) {
            try {
                $properties = @{
                    state = [string]$Response.state
                }
            }
            catch {
                $properties = @{
                    state = [string]$Response.state
                }
            }
            finally {
                $obj = New-Object -TypeName PSObject -Property $Properties
                $obj | Sort-Object -Property state | Write-Output $obj
            }
        }
    }

    END {

    }
}
