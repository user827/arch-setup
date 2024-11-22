Arch linux system settings in a package.

# Install

Install [shlib](https://github.com/user827/shlib) and
[yay](https://aur.archlinux.org/packages/yay) first.

```
cp aur/PKGBUILD PKGBUILD
makepkg --install --syncdeps
```

# Sensors index creation

```
sensord --load-average --rrd-file /var/log/sensord.rrd --rrd-cgi /srv/myhttp/sensord > index.rrdcgi
```
Use `rrdinfo` to see which metrics are available

# AMDGPU Manual installation

```
pacmatic -S mesa vulkan-radeon xf86-video-amdgpu libva-mesa-driver mesa-vdpau
```

Make sure amdvlk is not installed
[amdvlk black bars gtk
4](https://www.reddit.com/r/gnome/comments/1fsf6wz/thick_black_borders_around_some_windows/)
