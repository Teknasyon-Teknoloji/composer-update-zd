# Composer Zero Downtime Update Shell Script

You can use this script to provide min downtime during "composer update" cmd. Script should run at same directory with composer.json file

It creates new "vendor-YYYYmmddHis" directory, runs "composer update" command with this new directory as vendor dir. When finished, it changes "vendor" symbolic link to new directory.

## Usage

```bash
./composer-update-zd.sh
```

Default "composer" cmd is "/usr/local/bin/composer". If you want to give different path, you can use

```bash
export COMPOSER_CMD=/usr/bin/composer;./composer-update-zd.sh
```
You can pass composer options and params e.g. :

```bash
./composer-update-zd.sh --no-dev
```

Also you can download and run script at "composer.json" directory:
```bash
/usr/bin/curl -s -L "https://raw.githubusercontent.com/Teknasyon-Teknoloji/composer-update-zd/master/composer-update-zd.sh" | bash
```

"--no-dev" option
```bash
/usr/bin/curl -s -L "https://raw.githubusercontent.com/Teknasyon-Teknoloji/composer-update-zd/master/composer-update-zd.sh" | bash -s -- --no-dev
```

## Contributing

You can contribute by forking the repo and creating pull requests. You can also create issues or feature requests.

## Disclaimer

At first run, it removes vendor directory and replace with symbolic link.
Use at your own risk! Do not use at production without testing it. Your project/product may give errors.

## License

This project is licensed under the MIT license. `LICENSE` file can be found in this repository.
