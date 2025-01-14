#!/bin/bash

source ./src/bash/argparse.sh

set_description "This script helps you setup the empty structure of your project."

define_arg "location" "" "Path to where you want to setup your project. For example: /home/doej/Documents/projects/" "string"
define_arg "project_name" "" "The name of your project. Should be the same as the one on your Git server." "string" "true"

check_for_help "$@"
# Parse the arguments
parse_args "$@"

projec_dir="$location/$project_name"
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
mkdir $projec_dir

# Create directories
mkdir -p $projec_dir/docs
mkdir -p $projec_dir/manuscript/extended_data
mkdir -p $projec_dir/manuscript/tables
mkdir -p $projec_dir/manuscript/figures
mkdir -p $projec_dir/manuscript/submissions/
mkdir -p $projec_dir/data/raw
mkdir -p $projec_dir/data/processed
mkdir -p $projec_dir/analysis/tables
mkdir -p $projec_dir/analysis/figures
mkdir -p $projec_dir/analysis/001_
mkdir -p $projec_dir/analysis/002_
mkdir -p $projec_dir/analysis/003_
mkdir -p $projec_dir/src/tables
mkdir -p $projec_dir/src/figures
mkdir -p $projec_dir/src/001_
mkdir -p $projec_dir/src/002_
mkdir -p $projec_dir/src/003_
touch $projec_dir/data/README.md
echo "# $project_name" >$projec_dir/README.md

cp src/gitignore_template $projec_dir/.gitignore