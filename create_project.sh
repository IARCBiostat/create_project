#!/bin/bash

source ./src/bash/argparse.sh

set_description "This script helps you setup the empty structure of your project."

define_arg "location" "" "Path to wher you want to setup your project. For example: /home/doej/Documents/projects/" "string"
define_arg "project_name" "my_project" "The name of your project. Should be the same as the one on your Git server." "string"

# Validate required arguments
if [[ -z "$location" || -z "$project_name" ]]; then
    echo "Usage: create_project -location <location> -project <project_name> -githubname <github_name>"
    exit 2
fi

# Navigate to the base location
cd "$location" || {
    echo "Failed to navigate to $location"
    exit 3
}


if [ -d "$project_name" ]; then
  echo "$project_name already exists. Please select a different project name, or  a different location."
  exit 4
fi

# Create project directory
mkdir "$project_name"
cd "$project_name"

# Create directories
mkdir -p docs
mkdir -p manuscript/extended_data manuscript/tables manuscript/figures manuscript/submissions/
mkdir -p data/raw data/processed
touch data/README.md
mkdir -p analysis/tables analysis/figures analysis/001_ analysis/002_ analysis/003_
mkdir -p src/tables src/figures src/001_ src/002_ src/003_

# Create .gitignore
cat <<EOL >.gitignore
*.csv
*.tsv
*.dta
*.txt
*.dat
*.[rR]data
.Rproj.user
.Rhistory
.RData
.Ruserdata
*.Rproj
*.Rmd
*.bgen
*.gen
out*
error*
j*.sh.e*
j*.sh.o*
*.sh.e*
*.sh.o*
slurm*
*.enc_ukb
*.enc
*.cwa
data
EOL

# Create README.md
echo "# $project_name" >README.md

# Initialize Git repository and commit
# git init
# git add README.md .gitignore src/
# git commit -m "first commit"
# git branch -M main

# Configure GitHub remote if username is provided
# if [[ -n "$github_name" ]]; then
#     git remote add origin "https://github.com/$github_name/$project_name.git"
#     git push -u origin main || echo "Warning: Failed to push to the GitHub repository. Please ensure the repository exists."
# fi
