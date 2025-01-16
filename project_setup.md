# Instructions for Starting a New Project

## 1. Clone the Repository
```bash
git clone <original-repo-url>
cd <repository-name>
```

## 2. Create a New GitHub Repository
1. Go to your GitHub account.
2. Create a new repository (e.g., `project-name`).
3. Leave the repository empty (do not initialize with a README, `.gitignore`, or license).

## 3. Set the New Remote Origin
Replace the original repository’s remote URL with your new repository’s URL:
```bash
git remote rename origin upstream
git remote add origin https://github.com/<your-username>/<repository-name>.git
```

## 4. Push the Repository to Your GitHub Account
Push the existing codebase to your GitHub repository:
```bash
git branch -M main
git push -u origin main
```

## 5. Fetch Updates from the Original Repository (Optional)
To sync future changes from the original repository:
```bash
git fetch upstream
git merge upstream/main
```

---

## Example Scenario

1. Clone `example-repo` by `original-author`:
   ```bash
   git clone https://github.com/original-author/example-repo.git
   cd example-repo
   ```
2. Create your own GitHub repository named `my-example-repo`.
3. Add it as the new origin:
   ```bash
   git remote rename origin upstream
   git remote add origin https://github.com/<your-username>/my-example-repo.git
   ```
4. Push it to GitHub:
   ```bash
   git push -u origin main
   ```

This workflow ensures you can track changes while staying connected to the original repository for updates.

