# Workshop 1 - Creating a Function in PowerShell

## 1. Prepare your environment
* Open VS Code.
* Ensure you have selected PowerShell as your language in the bottom-right corner.
* Create a new file named `Greeting.ps1` and save it in your project folder.

## 2. Define the function
Type (don't copy!) the following code into your file:

```PowerShell
function Get-INFGreeting {
    Write-Host "Hello"
}
```

Once saved, type `Get-INFGreeting` in your terminal to run it and see what it returns.

## 3. Add a mandatory parameter
Now let's make the function dynamic. Modify your function to look like this:

```PowerShell
function Get-INFGreeting {
    param (
        [parameter(Mandatory=$true)]
        [string]$name
    )

    Write-Host "Hello, $name!"
}
```
* What changed?
    * The `param()` block tells PowerShell to expect input. 
    * `[parameter(Mandatory=$true)]` forces the user to provide a value. **Important:** this applies only to the parameter directly below it — you need to add it individually for each parameter you want to make mandatory.
    * `$name` is the variable that stores the input you provide.
* **Test it:** Run the updated function. Now type Get-INFGreeting without any extra info. PowerShell will prompt you to enter the value for `$name`.
* **Try this as well:** `Get-INFGreeting -Name "YourName"`

## 4. Add a parameter without a type
Now let's add a second parameter — but this time without defining a type, to see what can go wrong:
```PowerShell
param (
    [parameter(Mandatory=$true)]
    [string]$name,
    $age          # no type defined
)
```

Update `Write-Host` to: `"Hello, $name! You are $age years old."`

* **Test it:** `Get-INFGreeting -Name "John" -Age "Thirty"` It works. No error.
* **Test it:** `Get-INFGreeting -Name "John" -Age "30"` also works.
* **What's the problem?** PowerShell accepted the "Thirty" where a number was expected. Nothing stopped the wrong data from getting in.

## 5. Protect your function with Type Safety
Now add `[Parameter(Mandatory=$true)]` and `[int]` to `$age`:
```PowerShell
param (
    [parameter(Mandatory=$true)]
    [string]$name,
    [parameter(Mandatory=$true)]
    [int]$age
)
```
* **Test it again:** `Get-INFGreeting -Name "John" -Age "Thirty"` PowerShell now throws an error immediately.
* **What changed?** You told PowerShell exactly what kind of data to expect. Now it enforces that for you.

## Final result
Your completed function should look like this:

```PowerShell
function Get-INFGreeting {
    param (
        [parameter(Mandatory=$true)]
        [string]$name,
        [parameter(Mandatory=$true)]
        [int]$age
    )

    Write-Host "Hello, $name! You are $age years old."
}
```