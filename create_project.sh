#!/opt/homebrew/bin/bash

export DIR_source="/Users/leem/OneDrive - International Agency for Research on Cancer/001_projects/IARCBiostat/create_project/src/" # change for server usage
source "${DIR_source}bash/argparse.sh"

set_description "This script helps you setup the empty structure of your project."

define_arg "location" "" "Path to where you want to setup your project. For example: /home/doej/Documents/projects/" "string"
define_arg "project" "" "The name of your project. Should be the same as the one on your Git server." "string" "true"

check_for_help "$@"
# Parse the arguments
parse_args "$@"

projec_dir="$location/$project"
# Navigate to the base location
if [ ! -d "$location" ]; then
    echo "Could not find '$location'. Please check the location and try again."
    exit 2
fi

if [ -d "$projec_dir" ]; then
    echo "$projec_dir already exists. Please select a different project name, or  a different location."
    exit 3
fi

# Create project directory
mkdir "$projec_dir"

# make directory structure
structure_file="${DIR_source}template_structure"
while IFS= read -r line || [ -n "$line" ]; do
    # Construct the full path
    full_path="$projec_dir$line"
    
    if [[ $line == */ ]]; then
        # Create directories for paths ending with /
        mkdir -p "$full_path"
    else
        # For README.md files, copy the specific template based on the file path
        case "$line" in
            "/data/README.md")
                # Copy the template for data/README.md
                cp "${DIR_source}template_README_data.md" "$full_path"
                ;;
            "/src/README.md")
                # Copy the template for src/README.md
                cp "${DIR_source}template_README_src.md" "$full_path"
                ;;
            "/analysis/README.md")
                # Copy the template for analysis/README.md
                cp "${DIR_source}template_README_analysis.md" "$full_path"
                ;;
            "/manuscript/README.md")
                # Copy the template for manuscript/README.md
                cp "${DIR_source}template_README_manuscript.md" "$full_path"
                ;;
            "/README.md")
                # Copy the template for the main README.md
                cp "${DIR_source}template_README_main.md" "$full_path"
                ;;
            *)
                # For other files, create empty files for paths
                mkdir -p "$(dirname "$full_path")" # Ensure parent directories exist
                touch "$full_path"
                ;;
        esac
    fi
done < "$structure_file"

# gitignore
cp "${DIR_source}/template_gitignore" "$projec_dir/.gitignore"