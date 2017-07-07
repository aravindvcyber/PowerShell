$Tab = [char]9
$colItems =Get-ChildItem -dir -recurse $pwd | Sort-Object
foreach ($i in $colItems)
 { 
$subFolderItems = Get-ChildItem $i.FullName -recurse -force | Where-Object {($_.PSIsContainer -eq $false) } | Measure-Object -property Length -sum | Select-Object Sum
   ($i.FullName |Resolve-path -relative)+ $Tab  + "{0:N2}" -f ($subFolderItems.sum / 1MB) + "MB"
}
