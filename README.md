# SeleniumTest

About
-----
This repository is created for SeleniumTest project which contains a Selenium automation test to validate the following:
- Navigate to https://www.amazon.com/ 
- Type in “laptop” in the search text box
- Click on “Search” button
- Click on the first result 
- Upon page loaded, assert that the laptop price is more than $100. 

Prerequisites
-------------
1. Check Chrome version. eg. Chrome Version 116.0.5845.111 
2. Download ChromeDriver supported version and place it in C:/Driver.
3. Download Selenium WebDriver and place it in C:/Driver.

Folder Structure
-------------
The structures of the folder are as below:
1. run.ps1
   - Main scripts for test execution which requires user to choose either to create new project or modify existing project
   - User needs to specify Project Name
   - Script contains $scriptPath which requires user to define path where script is located.
2. newproject.ps1
   - This script will be called by run.ps1 when user choose to create new C# project and install the required dependencies for this project.
   - Script contains $outputFilePath which requires user to define path where Project is located to ease update on Program.cs file.
3. updatetest.ps1
   - This script will be called by run.ps1 when user choose to update existing project assuming all the dependencies have been installed.
   - Script contains $outputFilePath which requires user to define path where Project is located to ease update on Program.cs file.
4. test.cs
   - C# file which contains test fixtures. This file will replace Program.cs file.
5. Project
   - This folder will stores all Projects created.
   - This folder contains SeleniumTest.zip project.
6. Driver
   - contains the driver files used in this project.
   - need to place it at C:/Driver.
   
Notes
-----
1. All scripts must be placed in the same folder.
2. Scripts are run using Windows PowerShell ISE upon hitting F5.
3. This project is using Chrome browser.
