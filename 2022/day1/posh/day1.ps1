$ErrorActionPreference="Stop"

$lines=(Get-Content ../input.txt)

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
$elves|Measure-object -Sum -max

#Answer for #2
($elves|Sort-Object -desc|select -First 3)|Measure-Object -Sum