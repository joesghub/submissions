#!/bin/bash
# A collection of useful Git commands organized by scenarios.

# SCENARIO 1: Check which branch you are on
echo "=== CHECKING CURRENT BRANCH ==="
git branch

# SCENARIO 2: Create a new branch
echo "=== CREATING A NEW BRANCH ==="
read -p "Enter the new branch name: " new_branch
git checkout -b "$new_branch"

# SCENARIO 3: Check if the updates you made will create a conflict
echo "=== FETCHING CHANGES FROM REMOTE ==="
git fetch origin
echo "=== CHECKING FOR POTENTIAL CONFLICTS ==="
git merge --no-commit --no-ff origin/main
if [ $? -eq 0 ]; then
  echo "No conflicts detected. Proceeding."
else
  echo "Conflicts detected! Resolve them manually before committing."
fi
# Abort the merge to avoid unwanted state
git merge --abort

# SCENARIO 4: Update your branch with the latest changes from the main branch
echo "=== REBASING OR MERGING MAIN INTO YOUR BRANCH ==="
read -p "Do you want to rebase or merge (r/m)? " choice
if [ "$choice" == "r" ]; then
  git rebase origin/main
elif [ "$choice" == "m" ]; then
  git merge origin/main
else
  echo "Invalid choice. Exiting."
fi

# SCENARIO 5: Add and commit your changes
echo "=== ADDING AND COMMITTING CHANGES ==="
git status
read -p "Are you sure you want to add all changes? (y/n): " confirm
if [ "$confirm" == "y" ]; then
  git add .
  read -p "Enter commit message: " commit_message
  git commit -m "$commit_message"
else
  echo "Skipped adding changes."
fi

# SCENARIO 6: Push your branch to the remote repository
echo "=== PUSHING YOUR BRANCH ==="
read -p "Enter the branch name to push (leave blank for current branch): " branch_name
if [ -z "$branch_name" ]; then
  git push
else
  git push -u origin "$branch_name"
fi

# SCENARIO 7: Create a pull request
echo "=== CREATING A PULL REQUEST USING GITHUB CLI ==="
gh auth status > /dev/null 2>&1
if [ $? -eq 0 ]; then
  gh pr create --base main --head "$new_branch" --title "New Pull Request" --body "Description of changes."
else
  echo "GitHub CLI not authenticated. Please log in with 'gh auth login'."
fi

# SCENARIO 8: Rollback unwanted changes
echo "=== ROLLING BACK CHANGES ==="
read -p "Rollback all uncommitted changes? (y/n): " rollback_confirm
if [ "$rollback_confirm" == "y" ]; then
  git checkout .
  echo "Uncommitted changes reverted."
else
  echo "Rollback skipped."
fi

# SCENARIO 9: View commit history
echo "=== VIEWING COMMIT HISTORY ==="
git log --oneline --graph --all

# SCENARIO 10: Clone a repository
echo "=== CLONING A REPOSITORY ==="
read -p "Enter the repository URL: " repo_url
git clone "$repo_url"

# SCENARIO 11: Stash uncommitted changes
echo "=== STASHING UNCOMMITTED CHANGES ==="
git stash
echo "Stashed current uncommitted changes."

# SCENARIO 12: Apply stashed changes
echo "=== APPLYING STASHED CHANGES ==="
git stash list
read -p "Enter the stash name to apply (leave blank for latest): " stash_name
if [ -z "$stash_name" ]; then
  git stash apply
else
  git stash apply "$stash_name"
fi

echo "=== SCRIPT EXECUTION COMPLETE ==="
