## Set Up Self-Hosted Agents
- Need to install powershell 7 msi, Azure CLI
- Need to restart Azure agent pool service

## Lab - GitHub and Azure Boards integration
- Make GitHub integration from Project settings
- Create a new work item
- Note the work item id
- Do some changes in GitHub code
	- While committing the changes specify in Commit Description - "Fixed AB#<WorkItemID>"
- Refresh Azure work items
	- Note the status of work item is changed to closed.
