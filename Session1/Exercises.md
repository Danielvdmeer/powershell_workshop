# Workshop 1 - Creating a Function in Powershell

## 1. Prepare your environment
* Open VS Code.
* Ensure you have selected Powershell as your language in the bottom-right corner.
* Create a new file named `greeting.ps1` and save it in your project folder.

## 2. Define the function
Type (don't copy!) the following code into your file:

```Powershell
Function Get-InfGreeting {
    Write-host "Hello"
}
```

Run the function you just created, after you created it type `Get-InfGreeting` in your terminal and see what it returns

## 3. Add the parameter
Now modify your function to accept a name
* Add a `param()` block inside your function.
* Use `[string]$Name = "World"` as the variable.
* Update the `Write-Host` line to use the variable instead of just "Hello!".

## 4. Test your code
* Click the ***'Play'*** button on top or press ***F5*** to run your code
* In the terminal run your function: `Get-InfGreeting -Name "YourName"`
* **Challenge:** Can you add a second parameter called `[int]$age` and print it as well?