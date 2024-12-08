#!/bin/bash

create_project() {
    # Initialize variables
    local location=""
    local project_name=""
    local github_name=""

    # Parse flags manually
    while [[ $# -gt 0 ]]; do
        case $1 in
            -location)
                location="$2"
                shift 2
                ;;
            -project)
                project_name="$2"
                shift 2
                ;;
            -githubname)
                github_name="$2"
                shift 2
                ;;
            *)
                echo "Unknown flag: $1"
                echo "Usage: create_project -location <location> -project <project_name> -githubname <github_name>"
                return 1
                ;;
        esac
    done

    # Validate required arguments
    if [[ -z "$location" || -z "$project_name" ]]; then
        echo "Usage: create_project -location <location> -project <project_name> -githubname <github_name>"
        return 1
    fi

    # Warning for missing or incorrect GitHub username
    if [[ -z "$github_name" ]]; then
        echo "Warning: You did not provide a GitHub username or the repository might not exist. Skipping GitHub setup."
    fi

    # Navigate to the base location
    cd "$location" || { echo "Failed to navigate to $location"; return 1; }

    # Create project directory
    mkdir "$project_name"
    cd "$project_name" || { echo "Failed to navigate to $project_name"; return 1; }

    # Create directories
    mkdir -p docs
    mkdir -p manuscript/extended_data manuscript/tables manuscript/figures manuscript/submissions/
    mkdir -p data/raw data/processed
    touch data/README.md
    mkdir -p analysis/tables analysis/figures analysis/001_ analysis/002_ analysis/003_
    mkdir -p code/tables code/figures code/001_ code/002_ code/003_

    # Create .gitignore
    cat <<EOL > .gitignore
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
    echo "# $project_name" > README.md

    # Initialize Git repository and commit
    git init
    git add README.md .gitignore code/
    git commit -m "first commit"
    git branch -M main

    # Configure GitHub remote if username is provided
    if [[ -n "$github_name" ]]; then
        git remote add origin "https://github.com/$github_name/$project_name.git"
        git push -u origin main || echo "Warning: Failed to push to the GitHub repository. Please ensure the repository exists."
    fi
}

create_project "$@"
