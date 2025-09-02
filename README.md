# GitHub Repo Creator Script

A simple shell script to automate creating a new GitHub repository and pushing a local project to it.  
The script initializes a Git repository locally, creates a remote repository on GitHub via the GitHub API, and pushes the initial commit using SSH.

---

## Features

- Prompts for a repository name if not provided as an argument.  
- Automatically creates a `README.md` with the repository name.  
- Initializes a local Git repository and makes the first commit.  
- Creates a remote GitHub repository using your Personal Access Token (PAT).  
- Sets the remote `origin` using SSH and pushes the initial commit.  

---

## Requirements

- `curl`  
- `git`  
- `jq` (for parsing GitHub API responses)  
- A GitHub Personal Access Token stored in an environment variable `GITHUB_PAT`.  
- SSH keys configured with your GitHub account for pushing via SSH.

---

## Usage

### 1. Set your GitHub PAT

Add the following line to your shell configuration (`~/.bashrc` or `~/.zshrc`):

```bash
export GITHUB_PAT="your_personal_access_token_here"
```

Reload your shell

```bash
source ~/.bashrc
```

### 2. Run the script
You can provide the repository name as the argument:
```bash
./create_repo.sh my-new-repo
```
Or run without arguments and the script will prompt you for the repository name:
```bash
./create_repo.sh
```
### 3. After running 
- A local Git repository is initialized.
- A README.md containing the repository name is created.
- A remote repository is created on GitHub (public by default).
- The initial commit is pushed to the remote repository on the main branch.

### Notes
- The script uses your GITHUB_PAT for repository creation. Do not commit this token to any repository.
- Make sure SSH keys are properly configured for GitHub to allow pushing without entering credentials.
- The script assumes your GitHub username is krlkarol. Update the username in the script if necessary:
```bash
https://api.github.com/repos/krlkarol/"$repoName"
```

