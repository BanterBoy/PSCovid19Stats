# PSCovid19Stats

| Name: | README.md |
|-----|--|
| About: | Generic details regarding this project. |

![Postman COVID-19 API Resources](https://blog.lukeleigh.com/assets/images/postmanlogo.jpg)

A PowerShell Module that can be used to extract data from the NovelCOVID API (github.com/NovelCOVID/API). The API has been supplied by Postman as part of the ***"Postman COVID-19 API Resource Center"***

Click [here](https://covid-19-apis.postman.com/) to view the Postman Resource Centre

#### Quote

```"During the present novel coronavirus (COVID-19) pandemic, those on the front lines—including health care professionals, researchers, and government experts—need quick, easy access to real-time critical data. This type of information exchange is what APIs do best, and as an API-first company, Postman is committed to providing whatever assistance we can in this area."```

This was inspired by a [blog post](https://www.powershell.co.at/cov-id-19-powershell-prompt/) that popped up in the random click-fest of reading everything about the coronavirus. Perhaps too much time stuck indoors obsessing about what is happening around the world.

## Update

I have updated the module to include Commment Based Help and also Online Help

***Example***
```
PS C:\GitRepos> Get-Help Get-CovidCountryStats

NAME
    Get-CovidCountryStats

SYNOPSIS
    Command used to extract data (Country Stats) from the NovelCOVID API (github.com/NovelCOVID/API)

SYNTAX
    Get-CovidCountryStats -Country <String> [<CommonParameters>]

DESCRIPTION
    Command used to extract data (Country Stats) from the NovelCOVID API (github.com/NovelCOVID/API)
    Returns data of a specific country.

RELATED LINKS
    https://github.com/BanterBoy/PSCovid19Stats/wiki/Get-CovidCountryStats

REMARKS
    To see the examples, type: "get-help Get-CovidCountryStats -examples".
    For more information, type: "get-help Get-CovidCountryStats -detailed".
    For technical information, type: "get-help Get-CovidCountryStats -full".
    For online help, type: "get-help Get-CovidCountryStats -online"
```
Also, this module is now using the standard [ISO Country Codes](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes) which can now be used in tab completion.

![Tab Complete](https://blog.lukeleigh.com/assets/images/PSCiscoMeraki/CountryTabComplete.png)

## Getting Started

In order to make this more accessible and easy to install, I have uploaded the module to the [PowerShell Gallery](https://www.powershellgallery.com). This will also make it much easier for everyone to update, should any changes be made to the Module.

With this in mind, you now have two options when it comes to installation.

### 1) Install Module from Gallery

https://www.powershellgallery.com/packages/PSCovid19Stats

```
Install-Module -Name PSCovid19Stats
or
Install-Module -Name PSCovid19Stats -Scope CurrentUser
```

### 2) Download

You can [download](https://github.com/BanterBoy/PSCovid19Stats/archive/master.zip)
this repository.

### Import the Module

Once you've downloaded the repo place the PSCovid19Stats folder in any path in your ``$PSModulePath``. I recommend copying it to either ``C:\Program Files\WindowsPowerShell\Modules`` or ``C:\Users\<Username>\Documents\WindowsPowerShell\Modules``.

Once it's in one of those paths you can either import it manually by ``Import-Module PSCovid19Stats`` or rely on auto-module loading.

### Once Installed

```
PS C:\GitRepos> Get-Command -Module PSCovid19Stats

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-CovidCountriesStats                            1.0.2      PSCovid19Stats
Function        Get-CovidCountryStats                              1.0.2      PSCovid19Stats
Function        Get-CovidHistoricalData                            1.0.2      PSCovid19Stats
Function        Get-CovidjhucsseData                               1.0.2      PSCovid19Stats
Function        Get-CovidStateStats                                1.0.2      PSCovid19Stats
Function        Get-CovidWorldStats                                1.0.2      PSCovid19Stats
Function        Show-CountryCodes                                  1.0.2      PSCovid19Stats
```

![COVID-19 Example](https://blog.lukeleigh.com/assets/images/PSCiscoMeraki/pscovidscrnsht.png)

[License](/LICENSE)
