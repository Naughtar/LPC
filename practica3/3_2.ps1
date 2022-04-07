function leer{
    Param([string]$a)
    [string] $x = Get-Date -Format " dd/MM/yyyy HH:mm"
    Write-Output ("Hola $a, la hora es: ", $x)
    $p =Get-Process explorer | Format-List Id
    Write-Output("El proceso explorer tiene la ID: ", $p,)


}
[string] $nombre = Read-Host "Inserte su nombre" 
leer $nombre 
