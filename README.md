# RegRipper Docker image

[RegRipper](https://github.com/keydet89/RegRipper2.8) is a fantastic DFIR tool for analysis Microsoft Windows registry hives.

This Docker image aims to make its installation and use very smooth, on any system.

## Usage

It is best to declare a shell function inside your favorite shell (`.bashrc` or `.zshrc`) to make it easy to use:

```
function regripper () {
	docker run -it --rm --user=$(id -u):$(id -g) -v $(pwd):/hive:ro phocean/regripper $@
}
```

Then, you can simply use it as follows:

```
➤  regripper -r /hive/NTUSER.DAT -p filehistory
```

## Building

You can build the image locally with:

```
docker build -t phocean/regripper .
```

