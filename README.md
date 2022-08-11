<h1 align="center">
  <a href="https://github.com/fax-app/docker_env">
    <img src="docs/images/logo.svg" alt="Logo" width="250" height="250">
  </a>
</h1>

<div align="center">
  <b><font size="+20">docker_env</font></b>
  <br />
  <a href="https://github.com/fax-app/docker_env/issues/new?labels=bug&template=bug.md&title=[BUG]">Report a Bug</a>
  |
  <a href="https://github.com/fax-app/docker_env/issues/new?labels=feature&template=feature.md&title=[FEATURE]">Request a Feature</a>
  |
  <a href="https://github.com/fax-app/docker_env/issues/new?labels=question&template=support.md&title=[SUPPORT]">Ask a Question</a>
</div>

<div align="center">
<br />

[![Project license](https://img.shields.io/github/license/fax-app/docker_env)](LICENSE)
[![Pull Requests welcome](https://img.shields.io/badge/PRs-welcome-5042bc)](https://github.com/fax-app/docker_env/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)
[![code by fax-app](https://img.shields.io/badge/code%20by-fax--group-green)](https://github.com/fax-app)

</div>

<details open="open">
<summary>Table of Contents</summary>

  - [About](#about)
    - [Built With](#built-with)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
  - [Roadmap](#roadmap)
  - [Support](#support)
  - [Contributing](#contributing)
  - [Authors & contributors](#authors--contributors)
  - [Security](#security)
  - [License](#license)
  - [Acknowledgements](#acknowledgements)

</details>

---

## About

This is the fax-app development environment. Everything is setup to be able to develop on all of the repos for fax-app. It includes npm, poetry, and flutter all setup and preconfigured.

### Built With

Built with docker.

## Getting Started

Please follow the [guide](https://github.com/fax-app/notes/blob/main/docker-setup.md) in our notes repo to setup the environment.

### Prerequisites

To develop for docker_env you just need to have docker installed in order to test the setup, for windows you should use wsl2 as a backend for docker.

### Installation

All you need to do to get setup is to clone the repo and run the compose script to get up and running:
```pwsh
cd ~/scripts
./compose.ps1
```

## Usage

Use this docker container to develop code for fax-app and test it.

## Roadmap

See the [open issues](https://github.com/fax-app/docker_env/issues) for a list of proposed features (and known issues).

- [Top Feature Requests](https://github.com/fax-app/docker_env/issues?q=label%3Aenhancement+is%3Aopen+sort%3Areactions-%2B1-desc) (Add your votes using the 👍 reaction)
- [Top Bugs](https://github.com/fax-app/docker_env/issues?q=is%3Aissue+is%3Aopen+label%3Abug+sort%3Areactions-%2B1-desc) (Add your votes using the 👍 reaction)
- [Newest Bugs](https://github.com/fax-app/docker_env/issues?q=is%3Aopen+is%3Aissue+label%3Abug)

## Support

Reach out to the maintainer at one of the following places:

- [GitHub issues](https://github.com/fax-app/docker_env/issues/new?labels=question&template=support.md&title=[SUPPORT])
- Contact options listed on [this GitHub Organization](https://github.com/fax-app)

## Contributing

First off, thanks for taking the time to contribute! Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make will benefit everybody else and are **greatly appreciated**.

Please read [our contribution guidelines](docs/CONTRIBUTING.md), and thank you for being involved!

## Authors & contributors

The original setup of this repository is by [fax-app](https://github.com/fax-app).

For a full list of all authors and contributors, see [the contributors page](https://github.com/fax-app/docker_env/contributors).

## Security

docker_env follows good practices of security, but 100% security cannot be assured.
docker_env is provided **"as is"** without any **warranty**. Use at your own risk.

_For more information and to report security issues, please refer to our [security documentation](docs/SECURITY.md)._

## License

This project is licensed under the **GNU General Public License v3**.

See [LICENSE](LICENSE) for more information.

## Acknowledgements

Thanks for these awesome resources that were used during the development of this project.

[docker](https://www.docker.com/)
[debian docker image](https://hub.docker.com/_/debian)
[pgadmin4 docker image](https://hub.docker.com/r/dpage/pgadmin4/)
[postgres docker image](https://hub.docker.com/_/postgres)
[oh-my-zsh](https://ohmyz.sh/)
[poetry](https://python-poetry.org/)
[npm](https://www.npmjs.com/)
[flutter](https://flutter.dev/)