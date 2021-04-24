+++
title = "Microsoft Visual Studio Code"
tags = ["apps", "ide"]
categories = ["tools"]
+++

[Microsoft Visual Studio Code](https://code.visualstudio.com)

* [Installation](#installation)
* [Extensions](#extensions)
* [Hot Keys](#hot-keys)

# Installation

You can find an installation package for the most platforms [here](https://code.visualstudio.com/download).

## Install Visual Studio Code on MacOS from the Terminal
```bash
brew cask install visual-studio-code
```

## Install Visual Studio Code on Ubuntu from the Terminal

Install deb package from the [official site](https://code.visualstudio.com/docs/?dv=linux64_deb):
```bash
wget -O /tmp/vscode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo dpkg -i /tmp/vscode.deb
rm /tmp/vscode.deb
```

Install from the repository:
```bash
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```


## Install Visual Studio Code on Windows

* Option 1: Download from the [official site](https://code.visualstudio.com/docs/setup/windows) and install
* Option 2: Install from the command line using Chocolatey: ```choco install vscode```

# Extensions

* [Visual Studio Code Extension Marketplace](https://marketplace.visualstudio.com/VSCode)
* [Visual Studio Code Extension Gallery](https://code.visualstudio.com/docs/editor/extension-gallery)
* [Visual Studio Code Extension offline download](https://vscode-offline.herokuapp.com/)

## Command Line Interface to work with extensions:
```
code --list-extensions
code --install-extension ms-vscode.cpptools
code --uninstall-extension ms-vscode.csharp
```

## List of my extensions

| Name                           | ID                    | Description                                            |
| ------------------------------ | --------------------- | -------------------------------------------------------|
| [Python language](https://marketplace.visualstudio.com/items?itemName=ms-python.python) | ms-python.python      | |
| [Powershell language](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell) | ms-vscode.PowerShell  | |
| Java language                  | redhat.java           | Language Support for Java by RedHat |
| [JSON file](https://marketplace.visualstudio.com/items?itemName=andyyaldoo.vscode-json) | vscode-json           | |
| [YAML file](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) | YAML                  | |
| [Markdown Lint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)| DavidAnson.vscode-markdownlint | Markdown/CommonMark linting and style checking |
| Windows REG file               | ionutvmi.reg          | |
| TSLint                         | eg2.tslint            | |
| Dockerfile                     | PeterJausovec.vscode-docker | Adds syntax highlighting for Dockerfile |
| [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory) | donjayamanne.githistory | Git History, Search and More (including git log) |
| Git History Diff               | huizhou.githd | |
| [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) | mhutchie.git-graph | View a Git Graph of your repository |
| Image preview                  | kisstkondoros.vscode-gutter-preview ||
| [Display PDF file](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf) | tomoki1207.pdf / vscode-pdf ||
| Switch indent from 2 to 4      | ephoton.indent-switcher |Add commands to switch indent: "Switch indent from 2 to 4" or "Switch indent from 4 to 2" |
| Indent Rainbow                 | oderwat.indent-rainbow | Makes indentation easier to read |
| [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2) | CoenraadS.bracket-pair-colorizer-2 | Matching brackets to be identified with colours |
| Code Spell Checker             | streetsidesoftware.code-spell-checker | |
| Prettier                       | esbenp.prettier-vscode | |
| Auto rename Tag                | formulahendry.auto-rename-tag | |
| [Node.js Extension Pack](https://marketplace.visualstudio.com/items?itemName=waderyan.nodejs-extension-pack)| waderyan.nodejs-extension-pack | Contains: ES Lint, npm, JavaScript (ES6) Snippets, Search node_modules, NPM IntelliSence, Path IntelliSence |
| vscode-faker                   | deerawan.vscode-faker | Generate fake data  |
| Encode Decode                  | mitchdenny.ecdc | Convert: String to Base64, String to Unicode, and etc. |
| CSS Peek                       | pranaygp.vscode-css-peek | Add 'Go To Definition' and 'Go To Symbol in Workspace' support for css/scss/less |
| Html CSS Support               | ecmel.vscode-html-css | Missing CSS support for HTML documents |
| Live Server                    | ritwickdey.LiveServer | Simple web server for web developer |

# Hot Keys

| Keys                     | Command                                   | 
| ------------------------ | ----------------------------------------- |
| Shift + Option + F       | Format code |
| Shift + Option + O       | **Java:** Organize Import |
