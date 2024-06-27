$username = "github_username"
$page = 1
$repos = @()

do {
    $apiUrl = "https://api.github.com/users/$username/repos?page=$page&per_page=100"
    $reposPage = (Invoke-RestMethod -Uri $apiUrl).clone_url
    $repos += $reposPage
    $page++
} while ($reposPage.Count -gt 0)

foreach ($repo in $repos) {
    git clone $repo
}