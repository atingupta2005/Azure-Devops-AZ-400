# Scaling Git for Enterprise DevOps
## Lab - Git Branching Model for Continuous Delivery
- Create branch
	- git branch feature
	- git checkout feature
	- git log
- Make changes in the file
- Commit changes
	- git add *
	- git commit -m "commits of feature branch"
	- git log
- Merge
	- git checkout master
	- git merge feature
- Git Log in graph
	- git log --graph --decorate --oneline

## Lab - Git Branching Model for Continuous Delivery
- Handling Merge Conflict
	- Do changes in master branch
	- Commit
	- Checkout to feature branch
	- Do some changes in feature branch
	- Commit
	- Checkout to master branch
	- Merge the changes
	- Handle merge conflict

## Lab - Git Branching Model for Continuous Delivery
- Squash merge
	- To not to commit the history of feature branch to master branch
	- checkout to feature branch
	- do multiple commits
	- checkout to master branch
	- git merge --squash feature
	- git log

## Lab - Push branch to Azure Repo
- Create a blank Azure Repo
- Connect local repo to azure repo by following instructions
- git push origin master
- git push --all origin
- Review Azure Repo

## Lab - Pull Requests
- Change Master branch policies in Azure Repo Branches
- Enable "Require Number of Reviewers"
	- Enable "Allow to approve their own changes"
- Now unable to push to master branch
- Create a new branch and push that
- Create pull request and then approve the merge

## Lab - Using .gitignore file
- Create .gitignore file

## Lab - GitHub and Azure Boards integration
- Make GitHub integration from Project settings
- Create a new work item
- Note the work item id
- Do some changes in GitHub code
	- While committing the changes specify in Commit Description - "Fixed AB#<WorkItemID>"
- Refresh Azure work items
	- Note the status of work item is changed to closed.

### Other Integration Features
- Fixes AB#123
	- Links and transitions the work item to the "done" state.
- Adds a new feature, fixes AB#123
	- Links and transitions the work item to the "done" state.
- Fixes AB#123, AB#124, and AB#126
	- Links to Azure Boards work items 123, 124, and 126. Transitions only the first item, 123 to the "done" state.
- Fixes AB#123, Fixes AB#124, Fixes AB#125
	- Links to Azure Boards work items 123, 124, and 126. Transitions all items to the "done" state.
- Fixing multiple bugs: issue #123 and user story AB#234
	- Links to GitHub issue 123 and Azure Boards work item 234. No transitions.


## Lab - Fork a repo
- How to fork a GitHub repo
- How to fork a Azure Repo

## Lab - Githook
- File Name - .git\hooks\pre-commit

```
#!C:/Program\ Files/Git/usr/bin/sh.exe
matches=$(git diff-index --patch HEAD | grep '^+' | grep -Pi 'password|keyword2|keyword3')if [ ! -z "$matches" ]then  cat <<\EOTError: Words from the blacklist were present in the diff:EOT  echo $matches  exit 1fi
```

## Lab - Githook
- Do changes in file
```
notepad fileA.txt
```

- Add restricted keywords
```
git add *
git commit -m "-"		# Will throw exception
```
