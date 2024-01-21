Arch linux system settings in a package.

# Install

Install [shlib](https://github.com/user827/shlib) and
[yay](https://aur.archlinux.org/packages/yay) first.

```
cp PKGBUILD.template PKGBUILD
makepkg --install --syncdeps
```

# Sensors index creation

```
sensord --load-average --rrd-file /var/log/sensord.rrd --rrd-cgi /srv/myhttp/sensord > index.rrdcgi
```
