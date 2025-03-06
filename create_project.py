import subprocess

def create_project(location, project, githubname=None):
    """
    Creates a new project directory and initializes by calling the external `create_project.sh` script. 
    This function handles directory creation.

    Args:
        location (str): The base directory where the project should be created.
        project (str): The name of the project. This will be used as the directory name.
        
    Raises:
        subprocess.CalledProcessError: If the shell command fails to execute successfully.
        FileNotFoundError: If the `create_project.sh` script is not found or is not executable.

    Examples:
        create_project(
            location="/data/MET_share/work/001_projects/",
            project="my-new-project"
        )
    """
    command = [
        "/Users/leem/OneDrive - International Agency for Research on Cancer/001_projects/IARCBiostat/create_project/create_project.sh",
        "--location", location,
        "--project", project
    ]
    
    try:
        subprocess.run(command, check=True)
        print(f"Project '{project}' created successfully!")
    except subprocess.CalledProcessError as e:
        print(f"Error: Command failed with return code {e.returncode}")
    except FileNotFoundError:
        print("Error: create_project.sh not found or not executable.")
