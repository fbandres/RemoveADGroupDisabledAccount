
# List all User accounts under specific AD Group and show only all disabled user accounts.
$DisabledUser = Get-ADGroupMember -Identity "Domain Admins" | Get-ADUser | Where-Object {$_.Enabled -eq $false}

# Remove all the filtered user accounts
Remove-ADGroupMember -Identity "Domain Admins" -Members $DisabledUser