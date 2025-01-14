#!/bin/bash

# MIT License

# Copyright (c) 2023 Yaacov Zamir

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.



# argparse.sh contains bash functions that streamlines the management of
# command-line arguments in Bash scripts 

# Example:
#   define_arg "username" "" "Username for login" "string" "true"
#   parse_args "$@"
#
#   echo "Welcome, $username!"
#
#   # Usage:
#   # ./example.sh --username Alice

# Author: Yaacov Zamir <kobi.zamir@gmail.com>
# License: MIT License.
# https://github.com/yaacov/argparse-sh/ 

# Declare an associative array for argument properties
declare -A ARG_PROPERTIES

# Variable for the script description
SCRIPT_DESCRIPTION=""

# Function to display an error message and exit
# Usage: display_error "Error message"
display_error() {
    echo -e "Error: $1\n"
    show_help
    exit 1
}

# Function to set the script description
# Usage: set_description "Description text"
set_description() {
    SCRIPT_DESCRIPTION="$1"
}

# Function to define a command-line argument
# Usage: define_arg "arg_name" ["default"] ["help text"] ["action"] ["required"]
define_arg() {
    local arg_name=$1
    ARG_PROPERTIES["$arg_name,default"]=${2:-""} # Default value
    ARG_PROPERTIES["$arg_name,help"]=${3:-""}    # Help text
    ARG_PROPERTIES["$arg_name,action"]=${4:-"string"} # Action, default is "string"
    ARG_PROPERTIES["$arg_name,required"]=${5:-"false"} # Required flag, default is "false"
}

# Function to parse command-line arguments
# Usage: parse_args "$@"
parse_args() {
    while [[ $# -gt 0 ]]; do
        key="$1"
        key="${key#--}" # Remove the '--' prefix

        if [[ -n "${ARG_PROPERTIES[$key,help]}" ]]; then
            if [[ "${ARG_PROPERTIES[$key,action]}" == "store_true" ]]; then
                export "$key"="true"
                shift # past the flag argument
            else
                [[ -z "$2" || "$2" == --* ]] && display_error "Missing value for argument --$key"
                export "$key"="$2"
                shift # past argument
                shift # past value
            fi
        else
            display_error "Unknown option: $key"
        fi
    done

    # Check for required arguments
    for arg in "${!ARG_PROPERTIES[@]}"; do
        arg_name="${arg%%,*}" # Extract argument name
        [[ "${ARG_PROPERTIES[$arg_name,required]}" == "true" && -z "${!arg_name}" ]] && display_error "Missing required argument --$arg_name"
    done

    # Set defaults for any unset arguments
    for arg in "${!ARG_PROPERTIES[@]}"; do
        arg_name="${arg%%,*}" # Extract argument name
        [[ -z "${!arg_name}" ]] && export "$arg_name"="${ARG_PROPERTIES[$arg_name,default]}"
    done
}

# Function to display help
# Usage: show_help
show_help() {
    [[ -n "$SCRIPT_DESCRIPTION" ]] && echo -e "$SCRIPT_DESCRIPTION\n"

    echo "usage: $0 [options...]"
    echo "options:"
    for arg in "${!ARG_PROPERTIES[@]}"; do
        arg_name="${arg%%,*}" # Extract argument name
        [[ "${arg##*,}" == "help" ]] && {
            [[ "${ARG_PROPERTIES[$arg_name,action]}" != "store_true" ]] && echo "  --$arg_name [TXT]: ${ARG_PROPERTIES[$arg]}" || echo "  --$arg_name: ${ARG_PROPERTIES[$arg]}"
        }
    done
}

# Function to check for help option
# Usage: check_for_help "$@"
check_for_help() {
    for arg in "$@"; do
        [[ $arg == "-h" || $arg == "--help" ]] && { show_help; exit 0; }
    done
}