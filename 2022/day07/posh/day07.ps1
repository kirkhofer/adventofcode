$ErrorActionPreference="Stop"
#$lines = (Get-Content "..\sample.txt")
#$lines = (Get-Content "..\input.txt")|select -first 50
$lines = (Get-Content "..\input.txt")

$files=@()
$index=0
$fullpath=@("/")
$dirs=@{}
foreach($line in $lines)
{
    if( $line -like "`$*")
    {
        $mv = $line.split(" ")
        if( $mv[1] -eq "cd" )
        {
            if( $mv[2] -eq "/" )
            {
                $index=0
                $fullpath=@("/")
            }
            elseif( $mv[1] -eq "dir" )
            {
                continue
            }
            elseif( $mv[2] -eq ".." )
            {
                $index+=-1
                $fullpath=$fullpath[0..$index]
            }
            else
            {
                $index++
                $dir=
                $fullpath+=$mv[2]+"/"
            }
            Write-Host ($fullpath -join "")
            if( -not $dirs.ContainsKey($fullpath -join "") )
            {
                $dirs.Add(($fullpath -join ""),0)
            }
        }
    }
    elseif( $line -like "[0-9]*" )     
    {
        $size=[int]$line.split(" ")[0]
        $name=$line.split(" ")[1]
        $files+=@{path=($fullpath -join "");filename=$name;size=$size}
    }
}
$agg=$files|select path,size|group-object path|%{
    # New-Object  psobject -Property @{
    [PSCustomObject]@{
        Path = $_.Name
        Size=($_.Group | Measure-Object "Size" -Sum).Sum
        TotalSize=($_.Group | Measure-Object "Size" -Sum).Sum
    }
}
foreach($key in $dirs.keys.clone())
{
    $totalSize=($agg|?{$_.Path -like "$($key)*"}|Measure-Object Size -Sum).Sum
    $dirs[$key]=$totalSize
}
#1611443
$dirs.GetEnumerator()|?{$_.value -le 100000}|Measure-Object value -Sum

$totalSize=($files|Measure-Object Size -Sum).Sum
$minRemove=30000000-(70000000-$totalSize)
#2086088
$dirs.values|?{$_ -ge $minRemove}|Measure-Object -Minimum
