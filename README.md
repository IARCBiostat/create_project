# create_project

This repo and `README` provides the code and information for how to create your standardised repository.

## How
Use any of the different implamentation of the `create_project` function to create your project directory and initialise it. 
  
you must provide 2 arguments:  
  * `location`: where you want to make the project.
  * `project`: the name of the project.
  
## Example:

1- You have downloaded (or cloned) this project with all its folders and subfolder on your local machine.

2- You would like to initilise a project on Osiris in your "Documents" folder and your username is `doej`, so you the path to your project will be `/home/doej/Documents/`.

3- The name of your project is `foo_project`.

4- Based on your preference, choose one of the following implementations to create your project directory.
  

### R 
you can use `create_project()` directly in `R` on Osiris
```R
source("/data/IARCBiostat/work/create_project/create_project.R")
create_project(
  location = "/home/doej/Documents/",
  project = "foo_project")
```
### bash
On a terminal, navigate to where this project is located (either a local copy or the copy on OSIRS: `/data/IARCBiostat/work/create_project/`). Run `create_project.sh` with the following options:
```bash
cd /data/IARCBiostat/work/create_project/
bash create_project.sh --location "/home/doej/Documents/" --project_name "foo_project"
```

  ### python 
  you can use `create_project()` directly in `python` or a notebook on Osiris
```

sys.path.append('/data/IARCBiostat/create_project/create_project')
from create_project import create_project
create_project(
  location = "/home/doej/Documents/",
  project = "foo_project")  
```

## General guidelines:
  * use capitals sparingly
  * use `-` to combine; e.g., colon-caner
  * use `_` to separate; e.g., EPIC_colon-cancer

