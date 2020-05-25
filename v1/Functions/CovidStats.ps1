New-Item -Path "C:\inetpub\wwwroot\CovidStats.md" -ItemType File -Value "---
" -Force
Add-Content "C:\inetpub\wwwroot\CovidStats.md" "Title: COVID-19 Stats"
Add-Content "C:\inetpub\wwwroot\CovidStats.md" "TemplateName: readthedocs"
Add-Content "C:\inetpub\wwwroot\CovidStats.md" "Robots: noindex, nofollow"
Add-Content "C:\inetpub\wwwroot\CovidStats.md" "Border: true"
Add-Content "C:\inetpub\wwwroot\CovidStats.md" "---"
Add-Content "C:\inetpub\wwwroot\CovidStats.md" ""



$Country = Get-CovidCountryStats -Country UK
$WorldStats = Get-CovidWorldStats

$Params = [pscustomobject]@{
Country = $($Country.Country)
ResultsUpdated = $($WorldStats.Updated)
ActiveCases = $($Country.Active)
TodayCases =  + $($Country.TodayCases)
TotalFatal = $($Country.Deaths)
TodayFatal = $($Country.TodayDeaths)
Recovered = $($Country.Recovered)
}

ConvertTo-Markdown -Inputobject $Params -Width 200 -AsTable |
Out-File C:\inetpub\wwwroot\CovidStats.md -Encoding utf8 -Append
