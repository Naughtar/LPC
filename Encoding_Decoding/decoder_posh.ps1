#
# Nombre: Erick Mejorado Garcia
# Matricula: 1803249

Clear-Host

Write-Host "Ejemplo de decodificacion base64 en PowerShell" -ForegroundColor Yellow

$texto = "TABhAGIAbwByAGEAdABvAHIAaQBvACAAZABlACAAUAByAG8AZwByAGEAbQBhAGMAaQDzAG4AIABwAGEAcgBhACAAQwBpAGIAZQByAFMAZQBnAHUAcgBpAGQAYQBkACAAUwBlAHMAaQDzAG4AIAAxADAA"

Write-Host "La cadena a decodificar es: "
Write-Host $texto

$decod = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String(($texto)))
Write-Host "La cadena ya decodificada es: " -ForegroundColor Green
Write-Host $decod
Get-Date