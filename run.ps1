#Automate Selenium Project creation and executions
$scriptPath = "C:\Users\zamir\Documents"
# Create new or use existing Project
$newProject = Read-Host "Do you want to create a new Project? (yes|no)"

if ($newProject -eq "yes") {
    $ProjectName = Read-Host "Please specify your Project Name"
    Write-Host "Your Project Name is $ProjectName"
    Invoke-Expression -Command $scriptPath\newproject.ps1
} 
elseif ($newProject -eq "no") {
    $ProjectName = Read-Host "Please specify your existing Project Name"
    Write-Host "You chose to skip create new project."
    Write-Host "Your Project Name is $ProjectName"
    Invoke-Expression -Command $scriptPath\updatetest.ps1
}
else{
    exit
}