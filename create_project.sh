#!/opt/homebrew/bin/bash

export DIR_source="src"
source "${DIR_source}/bash/argparse.sh"

set_description "This script helps you setup the empty structure of your project."

define_arg "location" "" "Path to where you want to setup your project. For example: /home/doej/Documents/projects/" "string"
define_arg "project_name" "" "The name of your project." "string" "true"

check_for_help "$@"
# Parse the arguments
parse_args "$@"

project_dir="$location/$project_name"

if [ ! -d "$location" ]; then
    echo "Could not find '$location'. Please check the location and try again."
    exit 2
fi

if [ -d "$project_dir" ]; then
    echo "$project_dir already exists. Please select a different project name, or  a different location."
    exit 3
fi

mkdir "$project_dir"

structure_file="${DIR_source}/template_structure"
while IFS= read -r line || [ -n "$line" ]; do
    full_path="$project_dir$line"
    
    if [[ $line == */ ]]; then
        mkdir -p "$full_path"
    fi
done < "$structure_file"

cp "${DIR_source}/template_README_main.md" "${project_dir}/README.md";
cp "${DIR_source}/template_README_analysis.md" "${project_dir}/analysis/README.md";
cp "${DIR_source}/template_README_data.md" "${project_dir}/data/README.md";
cp "${DIR_source}/template_README_manuscript.md" "${project_dir}/manuscript/README.md";
cp "${DIR_source}/template_README_src.md" "${project_dir}/src/README.md";

# gitignore
cp "${DIR_source}/template_gitignore" "$project_dir/.gitignore"