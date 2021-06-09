## Azure Pipelines YAML versus Visual Designer

## Set Up Self-Hosted Agents


## Lab - GitHub and Azure Boards integration
- Make GitHub integration from Project settings
- Create a new work item
- Note the work item id
- Do some changes in GitHub code
	- While committing the changes specify in Commit Description - "Fixed AB#<WorkItemID>"
- Refresh Azure work items
	- Note the status of work item is changed to closed.


# Modules
 - Module-12-Implementing-Continuous-Integration-with-GitHub-Actions
		- Its Azure DevOps started
		- Need to simplify
 - Module-13-Designing-and-Implementing-a-Dependency-Management-Strategy
 		- Its package management
    - Need to simplify
- Module-16-Implementing-an-Appropriate-Deployment-Pattern
	- Note: Error occuring in Traffic Manager pipeline code. Support raised to Alen
    - https://github.com/atingupta2005/Azure-Devops-AZ-400/blob/master/Module-16-Implementing-an-Appropriate-Deployment-Pattern/11-Azure%20Deployment%20Slots/2-Steps%20-%20with%20Azure%20Pipelines.txt
- Module-18-Third-Party-Infrastructure-as-Code-Tools-Available-with-Azure
	- Ansible not required
	- Terraform Plan task is taking too much to complete execution. Need to test again.
  - Need to test
- Module-19-Managing-Containers-using-Docker
	- Error: While running pipeline its throwing error- "COPY failed: no source files were specified"
		- We need to build the project manually via Docker on Ubuntu machine to understand and fix the error
  - Need to test
- Module-20-21-Implementing-System-Feedback
  - Need to test
- Module-23-Validating-Code-Bases-for-Compliance
	- WhiteSource Bolt is no longer free version now. Need some alternative
  - Need to test
- Module-24-Azure-AI-Optional
