# Power BI Refresh Runbook

Setup an "Azure Based Black Box" able to run Power BI datasets refresh through API calls making everything secure using SPN and, leveraging Webhooks, launchable using POST calls by any application.

## Prerequisites 
- PowerShell v7.x
- PowerShell Az Module
- Power BI tenant
- SPN created and setup in AAD
- Enabled APIs use at Power BI tenant level for SPN
- Worspace V2 with SPN user as an admin

## powerbi_refresh_runbook_env_setup.ps1
Setup the whole environment using this PowerShell Script.

## powerbi_refresh_runbook.ps1
This PowerShell script is used by Azure Runbook to perform dataset refresh getting needed IDs and Secret from Runbook's variables and credentials.

## powerbi_refresh_runbook_webhook_setup.ps1
Setup a webhook to make "Black Box" available through POST calls.
