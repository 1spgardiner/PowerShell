Connect-AzAccount;
load-module -name 'PSRule.Rules.Azure'

Install-Module -Name 'PSRule.Rules.Azure' -Scope CurrentUser;

# Confirm the current subscription context
Get-AzContext;

# STEP 3: Exports a resource graph stored as JSON for analysis
Export-AzRuleData -OutputPath 'c:\out\template\'

# STEP 4: Run analysis against exported data
Assert-PSRule -Module 'PSRule.Rules.Azure' -InputPath 'c:\out\template\';

Invoke-PSRule -InputPath 'c:\out\template\' -Module 'PSRule.Rules.Azure' -Outcome Fail;

Invoke-PSRule -InputPath 'c:\out\template\' -Module 'PSRule.Rules.Azure' -As Summary;