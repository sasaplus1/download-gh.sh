# download-gh.sh

[![Actions Status: test](https://github.com/sasaplus1/download-gh.sh/workflows/test/badge.svg)](https://github.com/sasaplus1/download-gh.sh/actions?query=workflow%3A"test")

download [GitHub CLI](https://cli.github.com/)

## How to use

download `gh` archive to current directory:

```console
$ ./download-gh.sh
```

download `gh` archive to target directory if specified:

```console
$ ./download-gh.sh /path/to/dir
```

test:

```console
$ tar fx ./gh.tar.gz
$ ./gh*/bin/gh --version
gh version 1.11.0 (2021-06-03)
https://github.com/cli/cli/releases/tag/v1.11.0
```

### Execute script on the fly

```console
$ curl -L https://git.io/sasaplus1-gh | bash -
```

## License

The MIT license.
