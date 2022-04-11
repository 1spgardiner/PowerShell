$NotFound = 'First.Last@domain.com'

$Name = $NotFound.split('@')[0]

If ($Name -contains '.') {
    $FirstName = $Name.split('.')[0]
    $FirstName = '*' + $FirstName + '*'
    $LastName = $Name.split('.')[1]
    $LastName = '*' + $LastName + '*'
    $ResultsFirst = Get-AZADUser -filter (Firstname -like $FirstName)
    $ResultsLast = Get-AZADuser -filter (Surname -like $LastName)
    $results = $ResultsFirst + $ResultsLast
    $results = $results.Unique
}
Else {
    $TryName = '*' + Try$Name + '*'
    $results = Get-AZADuser -filter (DisplayName -like $TryName)
}

    write-host 'Not Found... $($Name), `t Potential matches... $($results)'

Connect-AzAd


