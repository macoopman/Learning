# GIT
---------------------------------------------------------------------------------------------------------------

## Setup

### Basic Setup

Basic set up when prepairing new local repo.

```
$ git config user.name "Johnny Bravo"
$ git config user.email "JBravo@shrug.com"
```

### Set Default Editor
* set ```export GIT_EDITOR=vim``` in rc file



--------------------------------------------------------------------------------------------------------------
## Configuration

### Hierarchy
1. **.git/config**
	* Repositoy-Specific config settings
	* **--local** 
	* ```git config --local user.name "Johnny Bravo*```

2. **~/.gitconfig**
	* User-specific configs
	* **--global**
	* ```git config ---global user.name "JB"```

3. **/etc/gitconfig**
	* Sysem-wide configs
	* **--system**
	* ```git config --system user.name "J Bravo"```
	
### Unset Setting
```git config --unset --global user.email```



--------------------------------------------------------------------------------------------------------------
## Working with a Local Repository

### Create Inital Repo
* Enter the directory of the repository

```
git init -b main
```
* **git init**: Creats a hidden dir called **.git**


	
