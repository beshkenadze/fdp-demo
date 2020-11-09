# docker run -it node:lts-alpine /bin/bash
ARG SERVER_VERSION_ARG=latest

# ---- Base Node ----
FROM beshkenadze/fdp-server:${SERVER_VERSION_ARG} AS base

# Preparing
RUN mkdir -p /var/app/src && chown -R node /var/app/src
# Set working directory
WORKDIR /var/app/src

#
# ---- Dependencies (with packages) ----
FROM base AS dependencies
ARG LOCK_FILE_ARG=yarn.lock
ARG PACKAGE_MANAGER_ARG="yarn"
ARG INSTALL_CMD_ARG="install"
# Copy project file
COPY --chown=node app/package.json package.json
COPY --chown=node app/${LOCK_FILE_ARG} ${LOCK_FILE_ARG}
RUN ${PACKAGE_MANAGER_ARG} ${INSTALL_CMD_ARG}

#
# ---- Test & Build ----
# run linters, setup and tests
FROM dependencies AS build_web_app
ARG PACKAGE_MANAGER_ARG="yarn"
ARG BUILD_CMD_ARG="build"
COPY --chown=node app /var/app/src
# Resolve the web-app dependencies
RUN ${PACKAGE_MANAGER_ARG} run ${BUILD_CMD_ARG}

#
# ---- Release Web App ----
FROM base AS release_web_app
ARG DIST_DIR_ARG=dist
# Copy Web App
COPY --from=build_web_app /var/app/src/${DIST_DIR_ARG} /var/app/public
