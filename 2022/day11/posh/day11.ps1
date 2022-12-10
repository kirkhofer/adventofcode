$ErrorActionPreference="Stop"

function Test-It()
{
    [CmdletBinding()]
    param($part=1)

    #$lines = (Get-Content "2022\day11\sample.txt")
    $lines = (Get-Content "2022\day11\input.txt")
    
    $monkeys=@()
    foreach($line in $lines)
    {
        if( $line -match "Monkey (.*):" )
        {
            $monkey = [PSCustomObject]@{id = $Matches[1];items=@();throws=@();operation="";test=0;tr=0;fl=0;inspections=0}
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
            #$monkey.operation=$line.Substring($line.IndexOf($str)+$str.Length+1)
            $monkey.operation=$line.Substring($line.IndexOf($str)+$str.Length+1).Replace("old","{0}")
        }
        $str="Test: divisible by"
        if( $line -like "*$str*")
        {
            $monkey.test=[int]$line.Substring($line.IndexOf($str)+$str.Length+1)
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
        # Write-Host $line
    }
    $times = ($part -eq 1) ?  20 : 10000
    $mod=1
    #Get the product of the tests for a big uniqueness
    $monkeys|%{$mod*=$_.test}
    
    $runs=($monkeys|%{$_.items.count}|Measure-Object -Sum).Sum
    $ix=1
    while( $runs -gt 0 -and $ix -le $times)
    {
        foreach($monkey in $monkeys)
        {
            Write-Verbose "Monkey $($monkey.id)"
            $level=0
            foreach($item in $monkey.items+$monkey.throws)
            {
                $monkey.inspections++

                Write-Verbose "`t$item"
                $level = Invoke-Expression $($monkey.operation -f $item)
                Write-Verbose "`tLevel=$level"

                if( $part -eq 1 )
                {
                    $level = [math]::floor($level / 3)
                }
                else
                {
                    $level = $level % $mod
                }
                Write-Verbose "`tLevel2=$level"

                $rs = $level % $monkey.test
                Write-Verbose $("`trt={0} % {1}" -f $level,$monkey.test)
                Write-Verbose "`trs=$rs"
                if( $rs -eq 0 )
                {
                    Write-Verbose "`tThrow to $($monkey.tr)"
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
        if( $ix % 1000 -eq 0 )
        {
            Write-Host $ix
        }
        $ix++

    }
    return $monkeys
}    

1..2|%{
    $rt = Test-It -part $_
    $top2=($rt|select id,inspections|sort-object inspections -desc|select -first 2)
    #120384 input vs 10605 sample
    Write-Host ("Answer {0}: {1}" -f $_,($top2[0].inspections*$top2[1].inspections))
}
