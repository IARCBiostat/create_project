#' Create a New Project Directory and Initialize GitHub Repository
#'
#' This function automates the process of creating a project directory, setting up 
#' necessary subdirectories and  generating a `.gitignore` file. It calls an external 
#' bash script `create_project.sh`.
#' 
#' @param location A character string specifying the base directory where the project 
#'   should be created.
#' @param project A character string specifying the project name. This will be used 
#'   to name the created directory.
#'
#' @return This function does not return any value.
#' 
#' @examples
#' # Example of calling create_project with a GitHub username
#' create_project(location = "/data/MET_share/work/001_projects/", 
#'                project = "my-new-project")
#' 
create_project <- function(location, project, githubname = NULL) {
  script_path <- "/Users/leem/OneDrive - International Agency for Research on Cancer/001_projects/IARCBiostat/create_project/create_project.sh"
  cmd <- sprintf(
    '"%s" --location "%s" --project "%s"',
    script_path, location, project
  )
  system(cmd)
}
