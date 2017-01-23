##############################################################################################################
#
# Title: RemoveADGroupDisabledAccount
# Createdby: Francis Paulo B. Andres
# Website: http://francisandres.com
# Description: Remove all the disabled user accounts that are member of a specific Active Directory Group
#
##############################################################################################################


# Import Active Directory Module
Import-Module -Name ActiveDirectory

# List all User accounts under specific AD Group and show only all disabled user accounts.
$DisabledUser = Get-ADGroupMember -Identity "Domain Admins" | Get-ADUser | Where-Object {$_.Enabled -eq $false}

# Verify all the filtered disabled users accounts
$DisabledUser | Select-Object Name, Enabled | Format-Table -AutoSize

# Remove all the filtered user accounts
Remove-ADGroupMember -Identity "Domain Admins" -Members $DisabledUser