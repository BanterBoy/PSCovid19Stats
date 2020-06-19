function Show-CountryCodes {
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
        Show-CountryCodes | more

        Name                                         Code
        ----                                         ----
        Afghanistan                                  AF
        Åland Islands                                AX
        Albania                                      AL
        Algeria                                      DZ
        American Samoa                               AS
        Andorra                                      AD
        Angola                                       AO
        Anguilla                                     AI
        Antarctica                                   AQ
        Antigua and Barbuda                          AG
        Argentina                                    AR
        Armenia                                      AM
        Aruba                                        AW
        Australia                                    AU
        Austria                                      AT
        Azerbaijan                                   AZ
        -- More  --

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

    }
    
    PROCESS {
        $countryCodes = Invoke-RestMethod -Uri 'https://datahub.io/core/country-list/r/data.json'
        foreach ($code in $countryCodes) {
            try {
                $properties = @{
                    Code = [string]$code.Code
                    Name = [string]$code.Name
                }
            }
            catch {
                $properties = @{
                    Code = [string]$code.Code
                    Name = [string]$code.Name
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
