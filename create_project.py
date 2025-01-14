import subprocess

def create_project(location, project, githubname=None):
    """
    Creates a new project directory and initializes a GitHub repository by calling 
    the external `create_project.sh` script. This function handles directory creation, 
    Git initialization, and optionally links to a GitHub repository if a username is provided.

    Args:
        location (str): The base directory where the project should be created.
        project (str): The name of the project. This will be used as the directory name.
        githubname (str, optional): The GitHub username. If provided, the function will attempt 
                                    to associate the project with a GitHub repository. If not 
                                    provided, GitHub setup is skipped. Defaults to None.

    Raises:
        subprocess.CalledProcessError: If the shell command fails to execute successfully.
        FileNotFoundError: If the `create_project.sh` script is not found or is not executable.

    Examples:
        # Example with a GitHub username
        create_project(
            location="/data/MET_share/work/001_projects/",
            project="my-new-project",
            githubname="your-github-username"
        )

        # Example without a GitHub username (GitHub setup will be skipped)
        create_project(
            location="/data/MET_share/work/001_projects/",
            project="my-new-project"
        )
    """
    # Base command
    command = [
        "/Users/leem/OneDrive - International Agency for Research on Cancer/001_projects/IARCBiostat/create_project/create_project.sh",
        "--location", location,
        "--project", project
    ]
    
    # Add GitHub username if provided
    if githubname:
        command.extend(["-githubname", githubname])
    else:
        print("Warning: You did not provide a GitHub username. Skipping GitHub setup.")
    
    # Execute the command
    try:
        subprocess.run(command, check=True)
        print(f"Project '{project}' created successfully!")
    except subprocess.CalledProcessError as e:
        print(f"Error: Command failed with return code {e.returncode}")
    except FileNotFoundError:
        print("Error: create_project.sh not found or not executable.")
