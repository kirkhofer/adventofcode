$ErrorActionPreference="Stop"

#Short version inspired by nicoleserafino (lol)

$totalScore=0;
Get-Content "..\input.txt"|ForEach-Object{
    # $_
    $x=$_.split(' ')
    $player2=switch($x[0]){"A"{"Rock"}"B"{"Paper"}"C"{"Scissors"}}
    $player1=switch($x[1]){"X"{"Rock"}"Y"{"Paper"}"Z"{"Scissors"}}
    $player1Val=switch($x[1]){"X"{1}"Y"{2}"Z"{3}}
    $score=0;
    Write-Host $("{0} vs {1}" -f $player1,$player2)
    if( ($player1 -eq "Rock" -and $player2 -eq "Scissors") `
        -or ($player1 -eq "Scissors" -and $player2 -eq "Paper") `
        -or ($player1 -eq "Paper" -and $player2 -eq "Rock") )
    {
        $score=6;
    }
    elseif ($player1 -eq $player2) {
        $score=3;
    }
    Write-Host $("Score:{0}" -f ($player1Val+$score))
    $totalScore+=($player1Val+$score);
}
Write-Host "Answer 1:" -NoNewline
$totalScore


########################################################
#Rock,Paper,Scissor
$points=@(1,2,3)
$pointer=@(2,0,1,2,0)
$totalScore=0;
Get-Content "..\input.txt"|ForEach-Object{
    $_
    $x=$_.split(' ')

    $player2=switch($x[0]){"A"{1}"B"{2}"C"{3}}
    $p2=switch($x[0]){"A"{"Rock"}"B"{"Paper"}"C"{"Scissors"}}
    $result=switch($x[1]){"X"{"Lose"}"Y"{"Draw"}"Z"{"Win"}}
    $offset=switch($result){"Lose"{-1}"Draw"{0}"Win"{1}}

    $a=$player2 + $offset
    $val=$points[$pointer[$a]]
    $p1=switch($val){1{"Rock"}2{"Paper"}3{"Scissors"}}
    $player1Val=switch($result){"Lose"{0}"Draw"{3}"Win"{6}}

    Write-Host $("Other={0} vs Elf={1} = {2} ({3}+{4})" -f $p2,$p1,$result,$player1Val,$val)

    $totalScore+=($player1Val+$val);
}
Write-Host "Answer 2:" -NoNewline
$totalScore