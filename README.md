# fdp-demo
Here is the template for self-hosting static sites.

## Setup the repository

1. Create the github token, see "[Creating a personal access token for the command line.](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)"
2. Create the repo secrets, see "[Creating encrypted secrets for a repository.](https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository)"

### Secrets for the GitHub.Actions

```
CR_PAT={GITHUB_TOKEN}
SERVER_VERSION=latest
PACKAGE_MANAGER=yarn
LOCK_FILE=yarn.lock
BUILD_CMD=build
INSTALL_CMD=install
```

### ENVS for launch

```
APP_NAME={YOUR_APP_NAME}
APP_HOST={YOUR_APP_HOST}
APP_PORT={YOUR_APP_PORT}
REPOSITORY_OWNER={APP_OWNER}
REPOSITORY_TAG=latest

# DEFAULTS
APP_UPDATE_INTERVAL=180
SERVER_VERSION=latest
PACKAGE_MANAGER=yarn
LOCK_FILE=yarn.lock
BUILD_CMD=build
INSTALL_CMD=install
```
