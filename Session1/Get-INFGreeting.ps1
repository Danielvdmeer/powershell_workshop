function Get-INFGreeting {
    param (
        [Parameter(Mandatory=$true)]
        [string]$name,
        [int]$age
    )

    Write-Host "Hello, $name! You are $age years old."
}
