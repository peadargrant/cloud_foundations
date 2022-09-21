# Cloud Foundations

## Cloning this repository

To clone (get a copy of) the repository, use the following command in PowerShell or Bash:

	git clone https://github.com/peadargrant/cloud_foundations

If you don't have the `git` command-line program you should install it and re-run the command again.


## Updating this repository

This repository will be updated as the academic term progresses.
To pull updates into your local repository use:

	git pull --rebase


## PowerShell scripts

PowerShell scripts: this course uses PowerShell (and other) scripts in many topics.
If you get errors that scripts are blocked you should issue the command:

	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser


## Shell captures

Shell captures from class (where available) are in the `_capture` folder of each topic.
This obviously will not include work done in tools with a Graphical User Interface (GUI).


## Building the notes document

The LaTeX and Markdown source files to build the notes are included in the repository.
Building them will require LaTeX, pandoc and some other custom commands that are not included.


