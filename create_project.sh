#!/opt/homebrew/bin/bash

export DIR_source="src"
source "${DIR_source}/bash/argparse.sh"

set_description "This script helps you setup the empty structure of your project."

define_arg "location" "" "Path to where you want to setup your project. For example: /home/doej/Documents/projects/" "string"
define_arg "project_name" "" "The name of your project." "string" "true"

check_for_help "$@"
# Parse the arguments
parse_args "$@"

projec_dir="$location/$project_name"

if [ ! -d "$location" ]; then
    echo "Could not find '$location'. Please check the location and try again."
    exit 2
fi

if [ -d "$projec_dir" ]; then
    echo "$projec_dir already exists. Please select a different project name, or  a different location."
    exit 3
fi

mkdir "$projec_dir"

structure_file="${DIR_source}/template_structure"
while IFS= read -r line || [ -n "$line" ]; do
    full_path="$projec_dir$line"
    
    if [[ $line == */ ]]; then
        mkdir -p "$full_path"
    else
        # For README.md files, copy the specific template based on the file path
        case "$line" in
            "/data/README.md")
                cp "${DIR_source}/template_README_data.md" "$full_path"
                ;;
            "/src/README.md")
                cp "${DIR_source}/template_README_src.md" "$full_path"
                ;;
            "/analysis/README.md")
                cp "${DIR_source}/template_README_analysis.md" "$full_path"
                ;;
            "/manuscript/README.md")
                cp "${DIR_source}/template_README_manuscript.md" "$full_path"
                ;;
            "/README.md")
                cp "${DIR_source}/template_README_main.md" "$full_path"
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