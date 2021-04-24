+++
title = "Node.js"
tags = [ "javascript", "node.js" ]
categories = [ "development" ]
+++

[Node.js](https://nodejs.org) is a JavaScript runtime built on Chrome's V8 JavaScript engine.

* [Installation](#installation)
* [Project settings](#project-settings)
    - [Custom registry](#custom-registry)
    - [Disable SSL verification for your private repository](#disable-ssl-verification-for-your-private-repository)
    - [Set predefined data for node projects](#set-predefined-data-for-node-projects)
* [NPM commands](#npm-commands)
    - [Aliases](#aliases)
    - [Show information/dependencies about a package](#show-information-dependencies-about-a-package)
    - [Update all the Node dependencies to their latest version](#update-all-the-node-dependencies-to-their-latest-version)
* [Popular packages](#popular-packages)
    - [dotenv](#dotenv)
    - [eslint](#eslint)
* [Links](#links)

# Installation

[Here](https://github.com/nodesource/distributions/blob/master/README.md) you can find Node.js Binary Distributions with all versions.

# Project settings

### Custom registry
```bash
npm config set registry 'http://servername:port'
```

### Disable SSL verification for your private repository
```bash
npm config set strict-ssl false --userconfig ./.npmrc
```

### Set predefined data for node projects
```bash
npm config set init.author.name "John Smith"
npm config set init.author.email "some@server.com"
npm config set init.author.url "https://someserver.com"
npm config set init.license "MIT"
npm config set init.version "0.0.1"
```
These values will be automatically substituted into the new project by ```npm init -y``` command.

# NPM commands

## Aliases
| Command                  | Description                                             |
| ------------------------ | ------------------------------------------------------- |
| ```npm i <package>```    | install local package |
| ```npm i -g <package>``` | install global package |
| ```npm un <package>```   | uninstall local package |
| ```npm up```             | npm update packages |
| ```npm t```              | run tests |
| ```npm ls```             | list installed modules |
| ```npm ll``` or ```npm la```| print additional package information while listing modules |

## Show information/dependencies about  a package
```bash
npm view express dependencies
npm ls express
npm ll express
# Find dependencies inside your node_modules 
find ./node_modules/ -name package.json | xargs grep <the_package_name>
```

## Update all the Node dependencies to their latest version

To update to a new major version all the packages, install the npm-check-updates package globally:
```bash
npm install -g npm-check-updates
```

To see all 'old' packages:
```bash
npm outdated
```

To update all versions inside the package.json:
```bash
ncu -u
```
*This will upgrade all the version hints in the package.json file, to dependencies and devDependencies, so npm can install the new major version.*

Now you can create a new one or update node_modules:
```bash
npm install
# or
npm update
```

# Popular packages

## [dotenv](https://www.npmjs.com/package/dotenv)
Load .env values into the system environment
```bash
export $(grep -i "^[A-Z]" "./.env" | tr '\r\n' '\n' } xargs)
```
Use dotenv from the scripts only (without load in the code)
```json
   "scripts": {
       "start:dev": "node -r dotenv/config src/server.js"
   }
```

## [eslint](https://eslint.org/)

Add eslint + airbnb to your project:
1. Add packages: ```npm i --save-dev eslint eslint-config-airbnb-base eslint-plugin-import```
2. Create .eslintrc.js: module.exports = { "extends": "airbnb-base" };
3. In VSCode install the ESLint extension
4. Add script into the packaje.json: ```"lint": "eslint ./"```

Sample eslint config file: ```.eslintrc.js```
```javascript
module.exports = {
  extends: ['airbnb-base'],
  root: true,
  env: {
    node: true,
    es6: true,
    jest: true,
  },
  plugins: [],
  rules: {
    'indent': ['error', 2],               // all JS world using 2 chars instead of 4 :(
    'eol-last': ['error', 'always'],      // Enforces at least one newline at the end of a file
    'max-len': ['error', { code: 120, ignoreUrls: true }],
    'object-curly-spacing': ['error', 'always'],
    'max-classes-per-file': ['error', 2],
    'newline-per-chained-call': ['error', { ignoreChainWithDepth: 3 }],
    'no-multi-spaces': ['error', { ignoreEOLComments: true }],
  },
};
```

Eslint debug:
```bash
DEBUG=eslint:cli-engine npm run lint
```

# Links

* [Node.js main site](https://nodejs.org/en/about/)
* [Node.js package repository](https://www.npmjs.com/)
