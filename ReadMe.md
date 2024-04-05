# dumPS PowerShell Module

## 💬 Description

A PowerShell module that allows you to dump all of an object's properties, including nested objects, to the console in a nice, colourful, structured, and easy-to-read format.

Currently it only supports PowerShell v7.3+, but I plan to add support for PowerShell v5 in the near future.

## ❓ Why this exists

When debugging PowerShell in Visual Studio Code you can use the Variables and Watch windows to drill into objects and see all of their property values.
When experimenting in the terminal however, it is very difficult to see all nested properties of an object.
You can pipe objects to `Select-Object *` to see all top-level property values, but this does not show nested properties.
dumPS allows you to easily view all of an object's nested properties in the console in a nice, structured format.

## ✨ Features

List the features of this project:

- Easily view all properties and values of an object in the terminal, including nested objects.
- `PassThru` parameter to still return the object being displayed.

## Example

The following code produces the output screenshot below:

```powershell
$dan = @{
  Name = 'Daniel Schroeder'
  Alias = 'deadlydog'
  Address = @{
    Province = 'Saskatchewan'
    Country = 'Canada'
  }
  Likes = @('Programming', 'PowerShell', '.NET', 'Dogs')
}

$dan | Out-Dump
```

![Example output of above dumps command](/docs/Images/dan-dumps-example.png)

## 🚀 Quick start

### Installation

Install the module from the PowerShell Gallery:

```powershell
Install-Module -Name dumPS -Scope CurrentUser
```

### Usage

Display all properties of an object using full cmdlet name:

```powershell
$process = Get-Process | Select-Object -First 1
Out-Dump -InputObject $process
```

---

Pipe an object to display all properties:

```powershell
$process = Get-Process | Select-Object -First 1
$process | Out-Dump
```

---

Display the object as part of a pipeline:

```powershell
Get-Process | Select-Object -First 1 | Out-Dump
```

---

Use the `PassThru` parameter to display the object while still returning it to the pipeline:

```powershell
$process = Get-Process | Select-Object -First 1 | Out-Dump -PassThru
```

---

Use the `dumps` alias in place of `Out-Dump`:

```powershell
Get-Process | Select-Object -First 1 | dumps
```

> Aside: The alias is `dumps` instead of `dump` to avoid conflicting with the unix `dump` command.

## ➕ How to contribute

Issues and Pull Requests are welcome.
See [the Contributing page](docs/Contributing.md) for more details.

## 📃 Changelog

See what's changed in the application over time by viewing [the changelog](Changelog.md).

## Credit

This module utilizes [Dumpify](https://github.com/MoaidHathot/Dumpify).
The Dumpify library is doing all of the heavy lifting and I thank them for making this PowerShell module possible.
