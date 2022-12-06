$line = (Get-Content "..\input.txt")
#$line = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
#$line = "bvwbjplbgvbhsrlpgdmjqwftvncz"
function Test-It($len=3)
{
    for($i=0;$i -lt $line.Length;$i++)
    {
        if( $i -gt ($len-1) )
        {
            $d=($line[($i-$len+1)..$i]|select -unique).Length
            if( $d -eq $len )
            {
                Write-Host $("Good {0} {1}" -f ($line[($i-$len+1)..$i] -join ""),$i)
                Write-Host $("Answer for {0}: {1}" -f $len,($i+1))
                break
            }
        }
    }
}
#1651
Test-It -len 4
#3837
Test-It -len 14