# create_project

This repo and `README` provides the code and information for how to create your standardised repository.

## How
Use any of the different implamentation of the `create_project` function to create your project directory and initialise it. 
  
you must provide 2 arguments:  
  * `location`: where you want to make the project.
  * `project`: the name of the project; this must be the same as the Git repository name.
  
## Example:

1- You have downloaded (or cloned) this project with all its folders and subfolder on your local machine.

2- You would like to initilise a project on Osiris in your "Documents" folder and your username is doej, so you the path to your project will be `/home/doej/Documents/`.

3- The name of your project is `foo_project`.

4- You choose one of the following implementations to create your project directory.
  
### bash
you can use a terminal and run `create_project.sh` directly on Osiris:
```bash
"/data/IARCBiostat/work/create_project/create_project.sh" \
--location "your/file/path/" \
--project "your-project-name"
```

### R 
you can use `create_project()` directly in `R` on Osiris:
```R
source("/data/IARCBiostat/work/create_project/create_project.R")
create_project(
  location = "your/file/path/",
  project = "your-project-name")
```

### python 
you can use `create_project()` directly in `python` or a notebook on Osiris:
```python
import sys
sys.path.append('/data/IARCBiostat/work/create_project/create_project')
from create_project import create_project
create_project(
  location = "your/file/path/",
  project = "your-project-name")
  
```

## General guidelines:
  * use capitals sparingly
  * avoid spaces and instead:
    * use `-` to combine; e.g., colon-caner
    * use `_` to separate; e.g., EPIC_colon-cancer

