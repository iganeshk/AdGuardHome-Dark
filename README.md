<div align="center">archived.</div>
<hr/>

Project archived in favor of [iganeshk/adwireguard-dark](https://github.com/iganeshk/adwireguard-dark) which is [AdGuardHome Dark](https://github.com/iganeshk/AdGuardHome-Dark) with [wireguard-easy (dark)](https://github.com/iganeshk/wg-easy-dark) docker images and AdGuardHome dark theme binaries.

[iganeshk/adwireguard-dark](https://github.com/iganeshk/adwireguard-dark)
[wireguard-easy](https://github.com/iganeshk/wg-easy-dark)
    
<hr/>
<p align="center">
  <img src="https://raw.githubusercontent.com/iganeshk/AdGuardHome-Dark/dev-assets/dark-adguardhome.png" width="800px" alt="AdGuard Home Dark Mustard" />
</p>
<h3 align="center">Dark Mustard</h3>
<p align="center">
  Deep orange influenced dark theme for Adguard home.
</p>

<p align="center">
    <a href="https://github.com/AdguardTeam/AdGuardHome">AdguardTeam/AdGuardHome</a>
</p>
<br />

Builds latest AdguardHome sources periodically with dark theme and then publish docker images and binary releases for linux distros based on arm6/7 and amd64.

## Installation

Follow any of the below method and then deploy the binary

* #### Docker/Docker-Compose
    - [Docker Hub](https://hub.docker.com/repository/docker/iganesh/adguardhome-dark)
    - [GHCR.IO](https://github.com/iganeshk/AdGuardHome-Dark/pkgs/container/AdGuardHome-Dark)

* #### Binary Releases
    - [Github Releases](https://github.com/iganeshk/AdGuardHome-Dark/releases)

* #### Build

    ```
    wget https://raw.githubusercontent.com/iganeshk/AdGuardHome-Dark/patch-1.0/dark-mustard-theme.patch
    git checkout master/your-branch
    git apply dark-mustard-theme.patch
    # For more information and intructions, follow the official guide
    # https://github.com/AdguardTeam/AdGuardHome/tree/master/scripts/make
    CHANNEL=development make release
    ```

## Screenshots

<p align="center">
    <img src="https://raw.githubusercontent.com/iganeshk/AdGuardHome-Dark/dev-assets/screenshot-dashboard.png" width="800px" alt="Screenshot-Dashboard" />
</p>
<p align="center">
    <img src="https://raw.githubusercontent.com/iganeshk/AdGuardHome-Dark/dev-assets/screenshot-settings.png" width="800px" alt="Screenshot-Settings" />
</p>
<p align="center">
    <img src="https://raw.githubusercontent.com/iganeshk/AdGuardHome-Dark/dev-assets/screenshot-filters.png" width="800px" alt="Screenshot-Filters" />
</p>
<p align="center">
    <img src="https://raw.githubusercontent.com/iganeshk/AdGuardHome-Dark/dev-assets/screenshot-query.png" width="800px" alt="Screenshot-Query-Log" />
</p>

## Feedback
* Create an issue if I missed any elements or you'd like them to get it patched.
