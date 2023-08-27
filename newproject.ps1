#create new C# project
$inputFilePath = "$scriptPath\test.cs"
$outputFilePath = "C:\Users\zamir\Documents\Project\"+$ProjectName+"\program.cs"
[int]$delayInSeconds = 5

#create new C# project in Project directory
cd Project
dotnet new console -o $ProjectName

#Install dependencies
dotnet add $ProjectName package NUnit
dotnet add $ProjectName package NUnit3TestAdapter
dotnet add $ProjectName package Selenium.WebDriver
dotnet add $ProjectName package Selenium.Support
dotnet add $ProjectName package Selenium.WebDriver.ChromeDriver
dotnet add $ProjectName package Microsoft.NET.Test.Sdk
dotnet add $ProjectName package dotnetseleniumextras.waithelpers

# Read the test scenario file from the specified input file
$txtContent = Get-Content -Path $inputFilePath -Raw

# Construct the content for the Program.cs file
$csContent = $txtContent

# Write the test scenario content to the specified cs file
$csContent | Set-Content -Path $outputFilePath

Write-Host "CS file created at $outputFilePath with content pasted from $inputFilePath."

# Build the project
dotnet build $ProjectName

# Execute the test
dotnet test $ProjectName