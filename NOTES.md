# Ubuntugis feature
This repository contains the github codespaces ubuntugis feature, which was built from the [Dev Container Features: Self Authoring template repository](https://github.com/devcontainers/feature-starter).  This feature adds the cli tools `proj`, `gdalinfo`, `gdalinfo`, `grass`, `pkinfo`, and `qgis` to codespaces built with one of the ubuntu stable releases: jammy (22.04), focal (20.04) or bionic (18.04). The feature was made possible with the [UbuntuGIS PPA's](https://wiki.ubuntu.com/UbuntuGIS), and provides the option to use the [stable release](https://launchpad.net/~ubuntugis/+archive/ubuntu/ppa) as well as the [unstable release](https://launchpad.net/~ubuntugis/+archive/ubuntugis-unstable) which "are more bleeding edge and while generally they should work well, they dont receive the same amount of quality assurance as our stable releases do".

## Stable usage
```jsonc
{
  "image": "mcr.microsoft.com/devcontainers/universal:2",
  "features": {
    "ghcr.io/connershoop//ubuntugis:latest": {}
  }
}
```

## Unstable usage
```jsonc
{
  "image": "mcr.microsoft.com/devcontainers/universal:2",
  "features": {
    "ghcr.io/connershoop/devcontainer-feature-ubuntugis/ubuntugis:latest": {
      "unstable": true
    }
  }
}
```
