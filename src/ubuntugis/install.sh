#!/bin/sh
set -e

echo "Activating feature 'ubuntugis'"

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

# Source /etc/os-release to get OS info
. /etc/os-release

# Store host architecture
architecture="$(dpkg --print-architecture)"

# Check if the OS is Ubuntu
if [ "$ID" != "ubuntu" ]; then
    echo "Unsupported operating system '$ID'. This feature only supports Ubuntu."
    exit 1
fi

# List of supported Ubuntu version codenames
SUPPORTED_OS_VERSION_CODENAMES="jammy focal bionic"

# Check if the OS version is supported
if [[ "${SUPPORTED_OS_VERSION_CODENAMES}" != *"${VERSION_CODENAME}"* ]]; then
    echo "Unsupported distribution version '${VERSION_CODENAME}'."
    echo "This feature only supports the following Ubuntu versions: ${SUPPORTED_OS_VERSION_CODENAMES}"
    exit 1
fi

unstable=${unstable:-undefined}
echo "The provided boolean for unstable is: $unstable"
apt update \
    && apt install -y --no-install-recommends \
        software-properties-common \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

if [ "$unstable" = "true" ]; then
    echo "Adding unstable PPA"
    add-apt-repository ppa:ubuntugis/ubuntugis-unstable
else
    echo "Adding stable PPA"
    add-apt-repository ppa:ubuntugis/ppa
fi

apt update \
    && apt install -y --no-install-recommends \
        proj-bin \
        gdal-bin \
        grass \
        pktools \
        qgis \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*