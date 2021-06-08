# Manage artifact versioning security and compliance

## Install White Source Bolt extention
1. Visit Organization Settings\Extentions\Marketplace
1. Search for WhiteSource
1. Use "WhiteSource Bolt" and install it
1. Open the project now

## Exercise 1: Activate WhiteSource Bolt
1. In your Azure DevOps Project, under Pipelines section, go to White Source Bolt tab
1. Provide your Work Email, Company Name and click Get Started button to start using the Free version.

## Exercise 1: Enable Build Pipeline to use WhiteSource Bolt
1. Open any existing pipeline which is building Dot Net project
1. Add a task for WhiteSource Bolt in the last
1. Trigger a Build manually
1. Once the build is completed, click back navigation to see the summary which shows Test results, Build artifacts etc.
1. Navigate to WhiteSource Bolt Build Report tab and wait for the report generation of the completed build to see the vulnerability report.
1. The security dashboard shows the vulnerability of the build
1. This report shows the list of all vulnerable open source components with Vulnerability Score, Vulnerable Libraries, Severity Distribution.
1. You can see the opensource license distribution and a detailed view of all components and links to their metadata and licensed references.
1. Outdated Libraries: WhiteSource Bolt also tracks outdated libraries in the project, getting all the detailed information and links to newer versions and recommendations.
