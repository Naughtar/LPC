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

$rango_ip = @(1...254)

Write-Output ""
Write-Host "--Subred Actual:"
Write-Host "Escaneando: " -NoNewline; Write-Host $rango -NoNewline; Write-Host "0/24" -ForegroundColor Red
Write-Output ""
foreach ($r in $rango_ip)
{
    $actual = $rango + $r 
    $respuesta = Test-Connection $actual -Quiet -Count 1 
    if ($respuesta -eq "True")
    {
        Write-Output ""
        Write-Host "Host responde: " -NoNewline; Write-Host $actual -ForegroundColor Green
    }
}