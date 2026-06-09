# Concepts: Session 1

This file contains the core concepts and explanations for the topics covered in this session. 

Use this document as a reference guide while working through your exercises to understand the "why" behind the code.

## Windows PowerShell vs. PowerShell
* **Windows PowerShell (v1.0 - v5.1)** Built on the older .NET Framework. It is exclusive to Windows and is no longer actively developed, though it remains pre-installed on every Windows system for legacy compatibility.
* **PowerShell (v6.0+)** Formerly known as "PowerShell Core." This is the modern, open-source version built on .NET. It is cross-platform (runs on Windows, macOS, and Linux) and receives all new features and performance improvements.

**Summary:** Windows PowerShell is the legacy version; PowerShell is the current, active standard. 

## What are functions?
A function is a named block of code designed to perform a specific task. Instead of writing the same instructions repeatedly, you define them once in a function and call them by name whenever needed.

* **Reusability:** Write once, use everywhere.
* **Maintainability:** If you need to change how the task works, you only have to update the code in one place.
* **Readability:** It makes your script much cleaner by breaking complex tasks into smaller, logical pieces.

## Best practice: Using function prefixes
PowerShell has a vast library of built-in commands (cmdlets). To prevent your custom functions from accidentally overwriting or conflicting with these native commands, always use a custom prefix.

* **The Verb-Noun Standard:** PowerShell uses a `Verb-Noun` naming convention (e.g., `Get-Service`). 
* **Custom Prefixing:** Add a unique identifier (like your organization or project initials) to the noun. 
* **Example:** Instead of `Get-Date`, use `Get-INFDate`.

This ensures that your code remains isolated and will never conflict with future updates to PowerShell or other installed modules.

## What are variables?
Variables are like labeled placeholders used to store data in your computer's memory so you can use or change it later in your script.

* **The Syntax:** In PowerShell, all variables start with a dollar sign (`$`), such as `$name` or `$age`.
* **Storing Data:** You use the assignment operator (`=`) to put a value into a variable: `$ServerName = "Production-01"`.
* **Flexibility:** Because they are variables, their contents can change during the execution of your script. 
* **Recall:** Once a value is stored, you can refer to that container by its name anywhere else in your code.

Think of variables as a way to give a name to a piece of information, making your code easier to read and maintain.

## What are parameters?
Parameters are the input mechanism for your functions. They allow you to pass data into a function, making it dynamic and reusable rather than static.

* **The `param()` block:** This is the entry point of your function where all inputs are defined.
* **Flexibility:** Without parameters, a function does exactly the same thing every time. With parameters, you can feed it different data (like a name, a path, or a number) and the function adapts its output accordingly.
* **The "Contract":** Think of parameters as a contract between the function and the user: "If you want me to run, you must provide me with this specific information."

## Common data types

Data types define the "nature" of the information your function processes. By specifying these, you ensure your code handles data correctly and catches errors before they cause problems.

* **[string]:** Used for text and characters (e.g., `"Hello"`, `"Server01"`).
* **[int]:** Used for whole numbers (e.g., `10`, `2026`).
* **[bool]:** Used for true/false flags (e.g., `$true`, `$false`).
* **[datetime]:** Used for dates and times.

**Why define types?**
If you tell PowerShell a parameter must be an `[int]`, it will automatically reject any text input. This "type safety" prevents bugs and makes your code much more reliable for other users.

## Handling Strings

When building output in PowerShell, you will encounter three ways to combine text and variables. Using the right method keeps your scripts readable and prevents bugs.

* **String Interpolation (Recommended):**

    You include the variable directly inside the double-quoted string. PowerShell automatically replaces it with the value. 
    * **Example:** `Write-Host "Hello, $name!"`
    * **Verdict:** This is the clean, standard and preferred way to write strings in PowerShell.
* **String Formatting:**

    You use placeholders (like {0}, {1}) and define the values afterwards using the `-f` operator.
    * **Example:** `Write-Host ("Hello, {0}!" -f $name)`
    * **Verdict:** Very useful for complex or large outputs, but it can make simple lines harder to read. Use this if you have many variables to manage in one sentence.
* **String Concatenation (Avoid):**

    You "glue" different parts together using a plus sign ( + ).
    * **Example:** `Write-Host ("Hello, " + $name + "!")`
    * **Verdict:** Considered bad practice. It is error-prone (e.g., forgetting a space) and less efficient. Stick to Interpolation whenever possible.