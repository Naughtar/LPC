#
# Nombre: Erick Mejorado Garcia
# Matricula: 1803249

Clear-Host

Write-Host "Ejemplo de codificacion base64 en PowerShell" -ForegroundColor Yellow
Write-Host "Escribe una clase a codificar: " -ForegroundColor Yellow

$frase = Read-Host

$encod = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes(($frase)))

Write-Host "La frase escrita en Base64 es: " -ForegroundColor Green
Write-Output $encod
Get-Date