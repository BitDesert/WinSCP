#requires -Modules Pester,PSScriptAnalyzer

Set-Location -Path "$env:USERPROFILE\Documents\GitHub\WinSCP"
Import-Module -Name .\WinSCP\WinSCP.psd1 -Force

Get-Process | Where-Object { $_.Name -eq 'WinSCP' } | Stop-Process -Force

Describe 'New-WinSCPItemPermission' {
    Context "Invoke-ScriptAnalyzer -Path $(Resolve-Path -Path (Get-Location))\Functions\New-WinSCPItemPermission.ps1." {
        $results = Invoke-ScriptAnalyzer -Path .\WinSCP\Public\New-WinSCPItemPermission.ps1

        It 'Invoke-ScriptAnalyzer of New-WinSCPItemPermission results count should be 0.' {
            $results.Count | Should Be 0
        }
    }
}

Remove-Module -Name WinSCP -Force