V2

Get global stats: cases, deaths, recovered, time last updated, and active cases. Data is updated every 10 minutes.

#ALL
$AllResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/all'


#ALLYesterday
$AllDateResponses = Invoke-RestMethod 'https://corona.lmao.ninja/v2/all?yesterday='

true
false


