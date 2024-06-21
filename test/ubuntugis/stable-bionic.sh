#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'ubuntugis' feature.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "proj available" which proj
check "gdal available" which gdalinfo
check "grass" which grass
check "pkinfo available" which pkinfo
check "qgis available" which qgis

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
