function Get-CovidStats {
    $Switzerland = Get-CovidCountryStats -Country Switzerland
    $UK = Get-CovidCountryStats -Country UK
    $WorldStats = Get-CovidWorldStats

    Write-Host ""
    Write-Host "COV-ID-19 Stats for $($Switzerland.Country) from $($WorldStats.Updated)" -ForegroundColor Red
    Write-Host "Active:$($Switzerland.Active)" -ForegroundColor Magenta -NoNewline
    Write-Host "($($Switzerland.TodayCases))  " -ForegroundColor Magenta -NoNewline
    Write-Host "Fatal:$($Switzerland.Deaths)" -ForegroundColor DarkGray -NoNewline
    Write-Host "($($Switzerland.TodayDeaths))  " -ForegroundColor DarkGray -NoNewline
    Write-Host "Recovered:$($Switzerland.Recovered)" -ForegroundColor Green
    Write-Host ""
    Write-Host "COV-ID-19 Stats for $($UK.Country) from $($WorldStats.Updated)" -ForegroundColor Red
    Write-Host "Active:$($UK.Active)" -ForegroundColor Magenta -NoNewline
    Write-Host "($($UK.TodayCases))  " -ForegroundColor Magenta -NoNewline
    Write-Host "Fatal:$($UK.Deaths)" -ForegroundColor DarkGray -NoNewline
    Write-Host "($($UK.TodayDeaths))  " -ForegroundColor DarkGray -NoNewline
    Write-Host "Recovered:$($UK.Recovered)" -ForegroundColor Green
    Write-Host ""
}
