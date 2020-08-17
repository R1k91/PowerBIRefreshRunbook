$resource_group_name = '<my_rg_name>'
$automation_account_name = '<my_ac_name>'
$runbook_name = '<my_rb_name>'
$expiry_time = [DateTime] '01/01/2021 00:00:00 AM'

New-AzAutomationWebhook -Name 'Power BI dataset Refresh' -RunbookName $runbook_name -IsEnabled $true -ResourceGroupName $resource_group_name -AutomationAccountName $automation_account_name -ExpiryTime $expiry_time
