$totalScore=0;
$val=@{}
1..26|%{$val.Add([char]($_+96),$_)}
27..52|%{$val.Add([char]($_+38),$_)}
$lines=(Get-Content "..\input.txt")

$value=0
$lines|ForEach-Object{
    $a=$_.substring(0,$_.length/2)
    $b=$_.substring($_.length/2)
    for($i=0;$i -lt $a.length;$i++)
    {
        $ch=[char]$a[$i]
        if( $b.contains($ch) )
        {
            
            $value+=$val[$ch]
            break
        }
    }
}
#8202
Write-Host "Answer 1:" -NoNewline
$value

$value=0
for($l=0;$l -lt $lines.Length;$l+=3)
{
    $a=$lines[$l]
    $b=$lines[$l+1]
    $c=$lines[$l+2]
    for($i=0;$i -lt $a.length;$i++)
    {
        $ch=[char]$a[$i]
        if( $b.contains($ch) -and $c.contains($ch) )
        {
            $value+=$val[$ch]
            break
        }
    }
}
#2864
Write-Host "Answer 2:" -NoNewline
$value
