# Replace existing Program.cs with new test script
$inputFilePath = "$scriptPath\test.cs"
$outputFilePath = "C:\Users\zamir\Documents\Project\"+$ProjectName+"\program.cs"
[int]$delayInSeconds = 5

#navigate to Project directory
cd Project

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