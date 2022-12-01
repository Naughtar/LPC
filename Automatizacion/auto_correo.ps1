#
# Nombre: Erick Mejorado Garcia
# Matricula: 1803249
$tiempo = (Get-Date).AddMinutes(2)
Register-ScheduledTask -TaskPath "MisTareas" -TaskName "Enviar sysinfo" -InputObject (
  (
    New-ScheduledTask -Action (
      New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument (Get-Item send_sysinfo.ps1).FullName
    ) -Description "Envio de información del sistema" -Trigger (
      New-ScheduledTaskTrigger -Once -At ($tiempo.TimeOfDay.ToString("hh\:mm"))
    ) -Settings (
      New-ScheduledTaskSettingsSet  -DeleteExpiredTaskAfter 00:00:01
    ) 
  ) | %{ $_.Triggers[0].EndBoundary = $tiempo.AddMinutes(4).ToString('s'); $_ } 
)