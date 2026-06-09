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

Run the function you just created, once created, type `Get-INFGreeting` in your terminal and see what it returns.

## 3. Add a mandatory parameter
Now let's make the function dynamic. Modify your function to look like this:

```PowerShell
function Get-INFGreeting {
    param (
        [parameter(Mandatory=$true)]
        [string]$Name
    )

    Write-Host "Hello, $Name!"
}
```
* What changed?
    * The `param()` block tells PowerShell to expect input. 
    * `[parameter(Mandatory=$true)]` forces the user to provide a value.
    * `$Name` is the variable that stores the input you provide.
* **Test it:** Run the updated function. Now type Get-INFGreeting without any extra info. PowerShell will prompt you to enter the value for `$Name`.
* **Try this as well:** `Get-INFGreeting -Name "YourName"`

## 4. Protect your function with Type Safety
In the previous step, you used `[string]` for the `$Name` parameter. Now, lets add an `$Age` parameter to your function.
* Update your `param()` block to look like this:
```PowerShell
param (
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [int]$Age
    )
```
* **Update your `Write-Host` line to:** `"Hello, $Name! You are $Age years old."`
* **Test it: Run the function with a valid number:** `Get-INFGreeting -Name "YourName" -Age 30`
* **The Experiment:** Now try to run it with a word instead of a number: `Get-INFGreeting -Name "YourName" -Age "Thirty"`
* **What happened?** You will see that PowerShell automatically throws an error because the input for `$Age` was not an integer. This is **Type Safety** in action. It prevents your script from breaking by ensuring the data type is correct.