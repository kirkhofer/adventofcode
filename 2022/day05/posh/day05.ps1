$ErrorActionPreference="Stop"
$lines=(Get-Content "..\input.txt")

function Stack-It($option)
{

    $crates=@{}
    foreach($line in $lines)
    {
        if( $line -notlike "*[[]*" )
        {
            break
        }
    
        $c=1
        for($i=1;$i -lt $line.length;$i+=4)
        {
            $v = $line[$i]
            if( -not $crates.ContainsKey($c) )
            {
                $crates.Add($c,@())
            }
            if( " " -ne $v )
            {
                $crates[$c]+=$v
            }
            $c++
        }    
    }    

    foreach($line in $lines)
    {
        if( $line -notlike "move*" )
        {
            continue
        }

        Write-Verbose $line
        $cols=$line.split(' ')
        $move=[int]$cols[1]
        $from=[int]$cols[3]
        $to=[int]$cols[5]

        $arrFrom=@()
        $arrTo=@()

        for($j=0;$j -lt $crates[$from].length;$j++)
        {
            if( $j -lt $move )
            {
                $arrTo+=$crates[$from][$j]
            }
            else
            {
                $arrFrom+=$crates[$from][$j]
            }
        }

        #Reverse the array to put the first one on top
        if( $option -eq 1)
        {
            [array]::Reverse($arrTo)
        }

        #Add the other ones to the bottom
        $arrTo+=$crates[$to]

        $crates[$from]=$arrFrom
        $crates[$to]=$arrTo

    }
    $answer=""
    for($i=1;$i -le $crates.Count;$i++)
    {
        $answer+=$crates[$i][0]
        Write-Verbose $($crates[$i] -join "")
    }
    return $answer
}
#SHQWSRBDL
$rt = Stack-It 1
Write-Host $("Answer 1: {0}" -f $rt)
#CDTQZHBRS
$rt = Stack-It 2
Write-Host $("Answer 2: {0}" -f $rt)