<#
# All named sources available

$News = Invoke-RestMethod -Uri 'http://newsapi.org/v2/everything?q=covid19&language=en&apiKey=dbe0d66c3040490eb020abc2c47da87c'
$CovidHeadlines = $News.articles
$CovidHeadlines |
Select-Object -Property Author,Title,Description,URL |
Out-GridView -PassThru |
ForEach-Object { Start-Process $Headline.Url
}

# All named sources with English news
https://newsapi.org/v2/sources?language=en&apiKey=dbe0d66c3040490eb020abc2c47da87c


# All named sources with English news in the UK
https://newsapi.org/v2/sources?language=en&country=uk&apiKey=dbe0d66c3040490eb020abc2c47da87c

#>

<#
$News = Invoke-RestMethod -Uri 'http://newsapi.org/v2/everything?q=covid19&language=en&apiKey=dbe0d66c3040490eb020abc2c47da87c'
$CovidHeadlines = $News.articles
$CovidResults = $CovidHeadlines |
Select-Object -Property Author,Title,Description,URL
New-Item -Path "C:\inetpub\wwwroot\NewsHeadlines.md" -ItemType File -Value "---
" -Force
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "Title: News Headlines"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "TemplateName: Material"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "Robots: noindex, nofollow"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "Border: true"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "---"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" ""

ConvertTo-Markdown -Inputobject $CovidResults -Width 200 -AsTable |
Out-File C:\inetpub\wwwroot\NewsHeadlines.md -Encoding utf8 -Append

$response = Invoke-RestMethod 'https://www.who.int/feeds/entity/csr/don/en/rss.xml' -Method 'GET' -Headers $headers -Body $body
$news = $response | Select-Object -Property Title,Description,link,pubDate
ConvertTo-Markdown -Inputobject $news -Width 200 -AsTable |
Out-File C:\inetpub\wwwroot\NewsHeadlines.md -Encoding utf8 -Append

#>


New-Item -Path "C:\inetpub\wwwroot\NewsHeadlines.md" -ItemType File -Value "---
" -Force
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "Title: News Headlines"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "TemplateName: Material"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "Robots: noindex, nofollow"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "Border: true"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" "---"
Add-Content "C:\inetpub\wwwroot\NewsHeadlines.md" ""

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Cookie", "__cfduid=deb005a07115d3f6eeb11a3e6f0448ea01585351583")
$response = Invoke-RestMethod 'https://newsapi.org/v2/everything?q=COVID&from=2020-03-16&sortBy=publishedAt&pageSize=20&page=1&language=en&apiKey=dbe0d66c3040490eb020abc2c47da87c' -Method 'GET' -Headers $headers -Body $body
$news = $response.articles | Select-Object -Property Title,Description,publishedAt,url
ConvertTo-Markdown -Inputobject $news -Width 200 -AsTable |
Out-File C:\inetpub\wwwroot\NewsHeadlines.md -Encoding utf8 -Append
