function Get-INFGreeting {
    param (
        [Parameter(Mandatory=$true)]
        [string]$name,
        [Parameter(Mandatory=$true)]
        [int]$age
    )

    Write-Host "Hello, $name! You are $age years old."
}