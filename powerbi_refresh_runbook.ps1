$TenantId = Get-AutomationVariable -Name 'TenantID'
$GroupId = Get-AutomationVariable -Name 'GroupID'
$DatasetId = Get-AutomationVariable -Name 'DatasetID'
$Creds = Get-AutomationPSCredential -Name 'SPN'

Connect-PowerBIServiceAccount -ServicePrincipal -Credential $Creds -Tenant $TenantId

$headers = Get-PowerBIAccessToken

# Refresh the dataset
$uri = "https://api.powerbi.com/v1.0/myorg/groups/$GroupId/datasets/$DatasetId/refreshes"
Invoke-RestMethod -Uri $uri –Headers $headers –Method POST –Verbose

Disconnect-PowerBIServiceAccount