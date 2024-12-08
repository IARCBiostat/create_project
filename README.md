# create_project

## what
This repo and `README` provides the code and information for how to create your standardised repository.

## how
1. make a GitHub repository ([info](https://docs.github.com/en/repositories/creating-and-managing-repositories/quickstart-for-repositories))
  * you only need to make the repository, you do not need to populate it
  * the name of your GitHub repository must be the same as your project name
2. use the `create_project` function to create your project directory and initialise it on GitHub
  * you must provide 3 arguments:
    * `location`: where you want to make the project
    * `project`: the name of the project; this must be the same as the GitHub repository name
    * `githubname`: your user name on GitHub
  * `bash`: you can use `create_project` directly on the command line on Osiris
```
/data/IARCBiostat/create_project/create_project.sh \
  -location "your/file/path/" \
	-project "your-project-name" \
	-githubname "your-github-user-name"
```

  * `R`: you can use `create_project()` directly in `R` on Osiris
```
source("/data/IARCBiostat/create_project/create_project.R")
create_project(
  location = "your/file/path/",
  project = "your-project-name",
  githubname = "your-github-user-name")
```

  * `python`: you can use `create_project()` directly in `python` or a notebook on Osiris
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

