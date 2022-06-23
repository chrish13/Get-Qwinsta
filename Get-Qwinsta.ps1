function Get-QWinsta {
    $QWCSV = qwinsta /Server:$ENV:COMPUTERNAME | ForEach-Object { $_ -replace "\s{2,18}","," } | ConvertFrom-Csv
    $QWObject = $QWCSV | Where-Object -Property UserName -notlike $null | ForEach-Object {
        [PSCustomObject]@{
            Session = $_.SESSIONNAME
            UserName = $_.USERNAME
            SessionID = $_.ID
            State = $_.STATE
         }
    }
	return $QWObject
}
