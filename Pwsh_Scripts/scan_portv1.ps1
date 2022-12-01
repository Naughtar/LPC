#Autor 
#Erick Mejorado Garcia
#Matricula
#1803249

$subred = (Get-NetRoute -DestinationPrefix 0.0.0.0/0).NextHop
Write-Host "--Determinando tu Gateway-- "
Write-Host "Tu Gateway es: $subred"

$rango = $subred.Substring(0,$subred.IndexOf('.') + 1 + $subred.Substring($subred.IndexOf('.')+1).IndexOf('.') + 3)
Write-Host "--Determinando tu rango-- "
Write-Host "Tu rango es: $rango"

$punto = $rango.EndsWith('.')
if ($punto -like "False")
{
    $rango = $rango + '.'
}
$portstoscan = @(20,21,22,23,25,50,51,53,56,80,110,119,135,136,137,138,139,143,161,389,443,445,636,1025,1443,3389,5985,5986,8080,10000)
$waittime = 100

Write-Host "Direccion IP a escanear: "-NoNewline
$direccion = Read-Host

foreach ( $p in $portstoscan )
{
    $TCPObject = New-Object System.Net.Sockets.TcpClient
    try{
        $resultado = $TCPObject.ConnectAsync($direccion,$p).Wait($waittime)}catch{}
    if ($resultado -eq "True")
    {
    Write-Host "Puertos Abiertos: " -NoNewline; Write-Host $p -ForegroundColor Green
    }
}