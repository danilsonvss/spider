# Spider

Shell script for generating PHPUnit tests.

## Requirements

Ensure the following are installed:

1. `gcc`
2. `shc`

## Compiling

Run the following command to compile the script into a binary:

```sh
shc -f spider.sh -o spider
```

## Permissions

To allow execution, set the appropriate permissions:

```sh
sudo chmod +x spider
```

## Installing the Binary

To make the binary globally accessible, move it to a directory in your PATH (e.g., /usr/bin/):

```sh
sudo mv spider /usr/bin/
```

Optionally you can install ou add the binary bin path to your PATH.