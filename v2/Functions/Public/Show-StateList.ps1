function Show-StateList {
    <#
        .SYNOPSIS
        Command used to display a list of American States
    
        .DESCRIPTION
        This Command used to display a list of America States derived from the states API call.
    
        .INPUTS
        None. You cannot pipe objects to Show-StateList
    
        .OUTPUTS
        System.String. Show-StateList returns a string containing all American States.
    
        .EXAMPLE
        Show-StateList | Sort-Object State | more

        state
        -----
        Alabama
        Alaska
        Arizona
        Arkansas
        California
        Colorado
        Connecticut
        Delaware
        Diamond Princess Ship
        District Of Columbia
        Federal Prisons
        Florida
        Georgia
        Grand Princess Ship
        -- More  --

        .LINK
        https://github.com/BanterBoy/PSCovid19Stats/wiki/Show-StateList
    
        .NOTES
        Author:     Luke Leigh
        Website:    https://blog.lukeleigh.com/
        LinkedIn:   https://www.linkedin.com/in/lukeleigh/
        GitHub:     https://github.com/BanterBoy/
        GitHubGist: https://gist.github.com/BanterBoy
    
    #>

    BEGIN {
        $URI = "https://corona.lmao.ninja/v2/states"
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
                Write-Output $obj
            }
        }
    }

    END {

    }
}
