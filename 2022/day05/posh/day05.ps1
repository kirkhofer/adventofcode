$ErrorActionPreference="Stop"
$lines=(Get-Content "..\input.txt")


function Stack-It($option)
{
    $crates=@()
    $crate1=@("R","C","H")
    $crate2=@("F","S","L","H","J","B")
    $crate3=@("Q","T","J","H","D","M","R")
    $crate4=@("J","B","Z","H","R","G","S")
    $crate5=@("B","C","D","T","Z","F","P","R")
    $crate6=@("G","C","H","T")
    $crate7=@("L","W","P","B","Z","V","N","S")
    $crate8=@("C","G","Q","J","R")
    $crate9=@("S","F","P","H","R","T","D","L")
    $crates=$crate1,$crate2,$crate3,$crate4,$crate5,$crate6,$crate7,$crate8,$crate9

    $moves=@()
    foreach($crate in $crates)
    {
        $moves+=$crate.length
    }


    for($i=10;$i -lt $lines.length;$i++)
    {
        $line=$lines[$i]
        Write-Verbose $line
        $cols=$line.split(' ')
        $move=[int]$cols[1]
        $from=[int]$cols[3]-1
        $to=[int]$cols[5]-1

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

        $moves[$from]=$moves[$from]-$move
        $moves[$to]=$moves[$to]+$move
    }
    $answer=""
    for($i=0;$i -lt $crates.length;$i++)
    {
        $answer+=$crates[$i][0]
        Write-Verbose $($crates[$i] -join "")
        if( $crates[$i].length -ne $moves[$i] )
        {
            Write-Error "Moves do not match"
            break
        }
    }
    return $answer
}
#SHQWSRBDL
$rt = Stack-It 1
Write-Host $("Answer 1: {0}" -f $rt)
#CDTQZHBRS
$rt = Stack-It 2
Write-Host $("Answer 2: {0}" -f $rt)

