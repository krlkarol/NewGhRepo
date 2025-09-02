#! /bin/sh

#take new repository name as an argument
repoName=$1

#if repository name not provided promt the user
while [ -z "$repoName" ]
do
    echo 'Provide a repository name'
    read -r -p $'Repository name:' repoName
done

#create new README.md file with repo name in it
echo "$repoName" >> README.md

#initialize git inside current directory, stage all files and make the first commit
git init
git add .
git commit -m "First commit"

#use your Personal Access Token as authentication and create new empty repository in GitHub (public)
curl -H "Authorization: token $GITHUB_PAT" \
     https://api.github.com/user/repos \
     -d '{"name": "'"$repoName"'", "private": false}'

#get your GitHub repository URL
GIT_URL=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/krlkarol/"$repoName" | jq -r '.ssh_url')

#push local files to GitHub repository
git branch -M main
git remote add origin $GIT_URL
git push -u origin main