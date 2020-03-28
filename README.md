# PSCovid19Stats

|Name:| README.md |
|-----|--|
|About:| Generic details regarding this project. |

![Postman COVID-19 API Resources](https://psciscomeraki.lukeleigh.com/assets/images/postmanlogo.jpg)

A PowerShell Module that can be used to extract data from the NovelCOVID API (github.com/NovelCOVID/API). The API has been supplied by Postman as part of the ***"Postman COVID-19 API Resource Center"***

Click [here](https://covid-19-apis.postman.com/) to view the Postman Resource Centre

#### Quote

```"During the present novel coronavirus (COVID-19) pandemic, those on the front lines—including health care professionals, researchers, and government experts—need quick, easy access to real-time critical data. This type of information exchange is what APIs do best, and as an API-first company, Postman is committed to providing whatever assistance we can in this area."```

Thought I would mention that this was inspired by a [blog post](https://www.powershell.co.at/cov-id-19-powershell-prompt/) that popped up in the random click-fest of reading everything about the coronavirus. Too much time indoors I think.

## Getting Started

### Download

You can [download](https://github.com/BanterBoy/PSCovid19Stats/archive/master.zip)
this repository.

### Import the Module

Once you've downloaded the repo place the PSCovid19Stats folder in any path in your ``$PSModulePath``. I recommend copying it to either ``C:\Program Files\WindowsPowerShell\Modules`` or ``C:\Users\<Username>\Documents\WindowsPowerShell\Modules``.

Once it's in one of those paths you can either import it manually by ``Import-Module PSCovid19Stats`` or rely on auto-module loading.

### Once Installed

```PS C:\GitRepos> Get-Command -Module PSCovid19Stats

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-CovidCountriesStats                            1.0.0      PSCovid19Stats
Function        Get-CovidCountryStats                              1.0.0      PSCovid19Stats
Function        Get-CovidHistoricalData                            1.0.0      PSCovid19Stats
Function        Get-CovidjhucsseData                               1.0.0      PSCovid19Stats
Function        Get-CovidStateStats                                1.0.0      PSCovid19Stats
Function        Get-CovidWorldStats                                1.0.0      PSCovid19Stats
```

![COVID-19 Example](https://psciscomeraki.lukeleigh.com/assets/images/pscovidscrnsht.png)

[License](/LICENSE)
