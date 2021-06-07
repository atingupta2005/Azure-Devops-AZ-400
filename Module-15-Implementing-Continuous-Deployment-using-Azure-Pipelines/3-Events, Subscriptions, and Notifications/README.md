# Use Case
- When a build takes a while to complete, probably you do not want to stare to the screen until it has finished
- But, you want to know when it does.
  - Getting an email or another kind of notification instead is very powerful and convenient

## Setting Up Service Hooks to Monitor the Pipeline:
1. Open Project settings\Service Hooks
1. Create New subscription
1. Select available application - Azure Storage
1. Click Next. In the Trigger page, we determine which event causes the service hook to be called
1. Click the drop down for Trigger on this type of event to see the available event types
1. In the Action page, enter the name of your Azure storage account.
1. Open the Azure Portal, and from the settings for the storage account, in the Access keys section, copy the value for Key.
1. Back in the Action page in Azure DevOps, paste in the key
1. For Queue name enter dp100status, then click Test.
1. Make sure that the test succeeded, then click Close, and on the Action page, click Finish

## Create a release to test the service hook:
1. Create new Release pipeline - Test the queue service hook
1. Click to view the release details.
1. In the Azure Portal, in the blade for the storage account, click Queues from the Queue service section.
1. Click to open the dp100status queue
1. Click the latest message
