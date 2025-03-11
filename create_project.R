create_project <- function(location, project, create_project_path = "/data/IARC_Biostat/work/create_project") {
  if (!dir.exists(location)) {
    stop(paste("Location directory does not exist:", location))
  }

  project_path <- file.path(location, project)
  if (dir.exists(project_path)) {
    stop(paste0("A project with the name '", project, "' already exists in '", location, "'.\nPlease choose a different name and try again."))
  } else {
    dir.create(project_path, recursive = TRUE)
  }


  template_structure <- file.path(create_project_path, "src/template_structure")

  if (!file.exists(template_structure)) {
    stop(paste("The file does not exist:", template_structure))
  }

  dirs <- readLines(template_structure, warn = FALSE)
  # Remove any empty or whitespace-only lines (e.g., the incomplete final line)
  dirs <- dirs[dirs != ""]
  dirs <- trimws(dirs)
  for (dir in dirs) {
    dir_to_create <- file.path(project_path, dir)
    if (!dir.exists(dir_to_create)) {
      dir.create(dir_to_create, recursive = TRUE)
    }
  }

  file.copy(file.path(create_project_path, "src", "template_README_main.md"), file.path(project_path, "README.md"),overwrite = FALSE)
  # file.copy(file.path(create_project_path, "src", "template_README_data.md"), file.path(project_path, "data/README.md"),overwrite = FALSE)
  # file.copy(file.path(create_project_path, "src", "template_README_manuscript.md"), file.path(project_path, "manuscript/README.md"),overwrite = FALSE)
  # file.copy(file.path(create_project_path, "src", "template_README_src.md"), file.path(project_path, "src/README.md"),overwrite = FALSE)
  print("Project template generated.")
}
