Trace-VstsEnteringInvocation $MyInvocation

[string]$ModuleName = Get-VstsInput -Name moduleName -Require

$modules = $ModuleName.Split(";",[StringSplitOptions]'RemoveEmptyEntries')

foreach ($module in $modules)
{
    $module = $module.Trim()

    if ((Get-module $module -ListAvailable).Count -lt 1)
    {
        Install-Module -Name $module -Force -Scope CurrentUser | Out-Null
    }
}

Trace-VstsLeavingInvocation $MyInvocation