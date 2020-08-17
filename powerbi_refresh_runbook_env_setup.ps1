$resource_group_name = '<my_rg_name>'
$automation_account_name = '<my_ac_name>'
$automation_account_location = '<my_ac_location>'
$runbook_name = '<my_rb_name>'
$tenant_id = '<my_pbi_tenant_id>'
$group_id = '<my_wks_id>' # Workspace ID
$dataset_id = '<dst_id>' # Dataset to Refresh ID
$app_id = '<my_app_id>' # Service PRincipal ID
$Password = ConvertTo-SecureString 'ThisIsMyPassword' -AsPlainText -Force # Secret from Service Principal

Connect-AzAccount

# Create Azure Automation Account
New-AzAutomationAccount -ResourceGroupName $resource_group_name -Location $automation_account_location -Name $automation_account_name
# Create Azure Automation Runbook
New-AzAutomationRunbook -Name $runbook_name -ResourceGroupName $resource_group_name -AutomationAccountName $automation_account_name -Type PowerShell

# Create Variables for IDs
New-AzAutomationVariable -Name 'TenantID' -Description 'Power BI Tenant ID' -Value $tenant_id -AutomationAccountName $automation_account_name -ResourceGroupName $resource_group_name -Encrypted $false
New-AzAutomationVariable -Name 'GroupID' -Description 'Power BI Workspace ID' -Value $group_id -AutomationAccountName $automation_account_name -ResourceGroupName $resource_group_name -Encrypted $false
New-AzAutomationVariable -Name 'DatasetID' -Description 'Power BI Dataset ID' -Value $dataset_id -AutomationAccountName $automation_account_name -ResourceGroupName $resource_group_name -Encrypted $false

# Create Credential for SPN
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $app_id, $password
New-AzAutomationCredential -name 'SPN' -Description 'Service Principal' -Value $Credential -AutomationAccountName $automation_account_name -ResourceGroupName $resource_group_name