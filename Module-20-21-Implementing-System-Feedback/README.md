# Implementing System Feedback

## Application Insights
1. Create ASP.Net Web Application(.Net Framework) with C# language
1. Project name - insights
1. Chose MVC
1. Right Click Project\Add\Application Insights Telemetory
1. Get Started\Or just add the SDK to the local only mode
1. Wait few minutes
1. Run project locally - >IIS Express (Google Chrome)
1. Stop App
1. Create a new Web App in Azure - demoweb20001
1. Runtime Stack -> ASP.Net v4.7
1. Chose Standard App Service Plan
1. In Monitoring Tab\Enbale Application Insights
1. Review and Create
1. Open All Resource\Insights\insight
1. Publish Project to newly created Web App
1. Open URL of Web App and click on different links to generate some insights data
1. Have a look at Live Metric of Application insight resource we created
1. Review the tabs Performance, Failures, Users, Sessions

## Application Insights - Availability Tests
1. Open resource insight\Availability
1. Add Test, Test Type -> Ping Test
1. Test Frequency -> 5 min
1. Paste URL of any Azure Web App
1. Access Web App from various locations
1. Wait for 30 min
1. Open resource insight\Availability and view report at bottom


## Slack Integration

1. Visit Slack.com and create account \ Try for free
2. Create Workspace
3. Add Channel if required
4. Open Project Setting from Top Left -> Settings and administration\manage apps
5. Search - Azure Boards and Add to Slack
6. Select Channel and Allow
7. /azboards signin
8. Click button Sign In and a new window will open. Hit Accept.
9. Copy the verification code
10. Enter Code
11. /azboards link <devops project name>
	Sample -> /azboards link https://dev.azure.com/myorg/myproject
12. Click -> Add Subscription
13. Create a new Work Item in Azure Devops Project
14. Notice if any new notification is received in the Slack Channel
15. /azboards create
16. Create work item from Slack
17. Notice the new work item in Azure Devops Boards
