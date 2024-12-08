#' Create a New Project Directory and Initialize GitHub Repository
#'
#' This function automates the process of creating a project directory, setting up 
#' necessary subdirectories, generating a `.gitignore` file, initializing a Git 
#' repository, and pushing to GitHub. It calls an external bash script `create_project.sh`.
#' 
#' @param location A character string specifying the base directory where the project 
#'   should be created.
#' @param project A character string specifying the project name. This will be used 
#'   to name the created directory.
#' @param githubname A character string specifying the GitHub username. If provided, 
#'   the function will attempt to link the new project to a GitHub repository under 
#'   the given username. If not provided, the GitHub setup is skipped, and a warning 
#'   is displayed. Default is `NULL`.
#'
#' @return This function does not return any value.
#' 
#' @examples
#' # Example of calling create_project with a GitHub username
#' create_project(location = "/data/MET_share/work/001_projects/", 
#'                project = "my-new-project", 
#'                githubname = "your-github-username")
#' 
#' # Example without a GitHub username (GitHub setup will be skipped)
#' create_project(location = "/data/MET_share/work/001_projects/", 
#'                project = "my-new-project")
#'
create_project <- function(location, project, githubname = NULL) {
  # Construct the command
  cmd <- sprintf(
    '/data/IARCBiostat/create_project/create_project.sh -location "%s" -project "%s"',
    location, project
  )
  
  # Add the GitHub username if provided
  if (!is.null(githubname)) {
    cmd <- sprintf('%s -githubname "%s"', cmd, githubname)
  } else {
    message("Warning: You did not provide a GitHub username. Skipping GitHub setup.")
  }
  
  # Execute the command
  system(cmd)
}
