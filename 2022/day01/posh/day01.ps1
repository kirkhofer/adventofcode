$ErrorActionPreference="Stop"

#Short version inspired by nicoleserafino (lol)
Write-Host "Answer 1:" -NoNewline
(((Get-Content "..\input.txt" -raw).split("`n`n")|ForEach-Object{($_.split("`n")|measure-object -sum).sum})|Measure-Object -Max).Maximum
Write-Host "Answer 2:" -NoNewline
(((Get-Content "..\input.txt" -raw).split("`n`n")|ForEach-Object{($_.split("`n")|measure-object -sum).sum})|Sort-Object -desc|Select-Object -first 3|Measure-Object -Sum).Sum

#Long version
$lines=(Get-Content "..\input.txt")

$elves=@()

$cal=0
foreach($line in $lines)
{
    if( $line -eq "" )
    {
        $elves+=$cal
        $cal=0
    }
    else 
    {
        $cal+=[int]$line
    }
}

#Answer for #1
Write-Host "Answer 1:" -NoNewline
($elves|Measure-object -Sum -max).Maximum

#Answer for #2
Write-Host "Answer 2:" -NoNewline
(($elves|Sort-Object -desc|select -First 3)|Measure-Object -Sum).Sum
