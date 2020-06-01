V2

#ALL
$AllHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$AllHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$AllResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/all'


#ALLDate
$AllDateHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$AllDateHeaders.Add("Cookie", "__cfduid=d6907f091c38e985d84bd05e1faf548a61585349147")
$NumberDays = 1
$date = (Get-Date).AddDays(-$NumberDays)
$AllDateResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/all?yesterday=$date'


