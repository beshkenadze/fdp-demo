#!/usr/bin/env sh
export $(grep -v '^#' .env | xargs) && docker build \
--build-arg SERVER_VERSION_ARG=${SERVER_VERSION} \
--build-arg PACKAGE_MANAGER_ARG=${PACKAGE_MANAGER} \
--build-arg LOCK_FILE_ARG=${LOCK_FILE} \
--build-arg BUILD_CMD_ARG=${BUILD_CMD} \
--build-arg INSTALL_CMD_ARG=${INSTALL_CMD} \
-t ${REPOSITORY_OWNER}/${APP_NAME}:${REPOSITORY_TAG} .