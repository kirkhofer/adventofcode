$ErrorActionPreference="Stop"
#$lines = (Get-Content "2022\day11\sample.txt")
$lines = (Get-Content "2022\day11\input.txt")

$monkeys=@()

foreach($line in $lines)
{
    if( $line -match "Monkey (.*):" )
    {
        $monkey = [PSCustomObject]@{
            id = $Matches[1]
            items=@()
            throws=@()
            operation=""
            test=""
            tr=""
            fl=""
            inspections=0
        }
        $monkeys+=$monkey
    }
    $str="Starting items:"
    if( $line -like "*$str*")
    {
        $monkey.items=$line.Substring($line.IndexOf($str)+$str.Length+1).split(", ")
    }
    $str="Operation: new ="
    if( $line -like "*$str*")
    {
        Write-Host "Here"
        #$monkey.operation=$line.Substring($line.IndexOf($str)+$str.Length+1)
        $monkey.operation=$line.Substring($line.IndexOf($str)+$str.Length+1).Replace("old","{0}")
    }
    $str="Test: divisible by"
    if( $line -like "*$str*")
    {
        $monkey.test=$line.Substring($line.IndexOf($str)+$str.Length+1)
    }
    $str="If true: throw to monkey"
    if( $line -like "*$str*")
    {
        $monkey.tr=[int]$line.Substring($line.IndexOf($str)+$str.Length+1)
    }
    $str="If false: throw to monkey"
    if( $line -like "*$str*")
    {
        $monkey.fl=[int]$line.Substring($line.IndexOf($str)+$str.Length+1)
    }
    Write-Host $line
}
$monkeys

$runs=($monkeys|%{$_.items.count}|Measure-Object -Sum).Sum
$ix=1
while( $runs -gt 0 -and $ix -le 20)
{
    foreach($monkey in $monkeys)
    {
        Write-Host "Monkey $($monkey.id)"
        $level=0
        foreach($item in $monkey.items+$monkey.throws)
        {
            $monkey.inspections++

            Write-Host "`t$item"
            $level = Invoke-Expression $($monkey.operation -f $item)
            Write-Host "`tLevel=$level"

            $level = [math]::floor($level / 3)
            Write-Host "`tLevel2=$level"

            $rs = $level % $monkey.test
            Write-Host $("`trt={0} % {1}" -f $level,$monkey.test)
            Write-Host "`trs=$rs"
            if( $rs -eq 0 )
            {
                Write-Host "`tThrow to $($monkey.tr)"
                if( $monkey.id -lt $monkey.tr )
                {
                    $monkeys[$monkey.tr].items+=$level
                }
                else
                {
                    $monkeys[$monkey.tr].throws+=$level
                }
                
            }
            else
            {
                if( $monkey.id -lt $monkey.fl )
                {
                    $monkeys[$monkey.fl].items+=$level
                }
                else
                {
                    $monkeys[$monkey.fl].throws+=$level
                }
            }
        }
    }
    foreach($monkey in $monkeys){$monkey.items=$monkey.throws;$monkey.throws=@()}
    $runs=($monkeys|%{$_.items.count}|Measure-Object -Sum).Sum
    $ix++
}
$top2=($monkeys|select id,inspections|sort-object inspections -desc|select -first 2)
Write-Host ("Answer 1: {0}" -f $top2[0].inspections*$top2[1].inspections)
