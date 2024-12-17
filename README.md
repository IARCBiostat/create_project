# create_project

## What
This repo and `README` provides the code and information for how to create your standardised repository.

## How
1. Make an empty Git repository on servers such as IARC's [internal](git.iarc.lan) or [external](code.iarc.fr) or any commercial Git server like [GitLab.com](gitlab.com) or [GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/quickstart-for-repositories)
  * you only need to make the repository, you do not need to populate it.
  * please make sure the name of your Git repository is the same as your project name.
2. use any of the different implamentation of the `create_project` function to create your project directory and initialise it. 
  * you must provide 3 arguments:
    * `location`: where you want to make the project.
    * `project`: the name of the project; this must be the same as the Git repository name.
    * `git_username`: your user name on the Git server.
  
  ## Example:

  You would like to initilise a project on Osiris in your "Documents" folder and your username is doej. Suppose that you are running create_project from a location other than your Documents folder, so you need to provide the full project path to the `location` argument:
```bash
/home/doej/Documents/
```
and the name of you project is "foo_project" which will be the input of `project`.
You are also using the IARC's internal Git server so your `git_username` is your IARC username, "doej".

You can use one of the following implementations to create your project directory. 
  
  ### bash
  You can use `create_project` directly on the command line on Osiris:
```bash
create_project.sh --location "/home/doej/Documents/" --project "super_project" --git_username "doej"
```

  ### R 
  you can use `create_project()` directly in `R` on Osiris
```R
source("/data/IARCBiostat/create_project/create_project.R")
create_project(
  location = "your/file/path/",
  project = "your-project-name",
  githubname = "your-github-user-name")
```

  ### python 
  you can use `create_project()` directly in `python` or a notebook on Osiris
```
sys.path.append('/data/IARCBiostat/create_project/create_project')
from create_project import create_project
create_project(
  location = "your/file/path/",
  project = "your-project-name",
  githubname = "your-github-user-name")
  
```

3. guidelines:
  * use capitals sparingly
  * use `-` to combine; e.g., colon-caner
  * use `_` to separate; e.g., EPIC_colon-cancer

