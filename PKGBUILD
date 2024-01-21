# Maintainer: me

pkgname=arch-setup
pkgver=1.0.0.r31.g132ae90
pkgrel=1
pkgdesc='A collection of Arch linux system settings'
arch=('any')
depends=(
    yay shlib pacman-contrib reflector smtp-forwarder
    lsof audit smartmontools etckeeper sec lm_sensors rrdtool lighttpd
    rasdaemon
)
makedepends=(
    git
)
backup=(
    etc/sec.d/crit.sec
    etc/security/limits.d/"$pkgname".user.conf
)
license=('Apache')
url="https://github.com/user827/arch-setup.git"
#source=("$pkgname::git+$url?signed")
source=("$pkgname::git+file://$PWD?signed")
validpgpkeys=(D47AF080A89B17BA083053B68DFE60B7327D52D6) # user827
sha256sums=(SKIP)

install=$pkgname.install

pkgver() {
  cd "$pkgname"
  git describe | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  builder_uid=944
  builder_gid=944

  cd "$pkgname"

  # Warn about permissions if not correct
  mkdir -m700 "$pkgdir"/boot

  mkdir -p "$pkgdir"/usr/lib/sysctl.d
  install -D -m644 sysctl.d/* "$pkgdir"/usr/lib/sysctl.d/

  mkdir -p "$pkgdir"/usr/lib/systemd/system
  #install -D -m644 systemd/* "$pkgdir"/usr/lib/systemd/system/
  (cd systemd && find -type f -exec install -m644 -D '{}' "$pkgdir"/usr/lib/systemd/system/'{}' \; )

  mkdir -p "$pkgdir"/usr/lib/sysusers.d
  install -D -m644 sysusers.d/* "$pkgdir"/usr/lib/sysusers.d/

  mkdir -p "$pkgdir"/usr/lib/xsecurelock
  install -D -m755 xsecurelock/* "$pkgdir"/usr/lib/xsecurelock/

  mkdir -p "$pkgdir"/usr/bin
  install -D -m755 bin/* "$pkgdir"/usr/bin/
  install -D -m711 sbin/* "$pkgdir"/usr/bin/

  mkdir -p "$pkgdir"/usr/local/bin
  install -D -m755 local/bin/* "$pkgdir"/usr/local/bin/

  mkdir -p "$pkgdir"/usr/lib/arch-setup
  install -D -m755 lib/* "$pkgdir"/usr/lib/arch-setup/

  mkdir -m 755 "$pkgdir"/etc
  (cd etc && find -type f -exec install -m644 -D '{}' "$pkgdir"/etc/'{}' \; )
  mkdir -m 755 "$pkgdir"/etc/audit "$pkgdir"/etc/audit/rules.d
  install -D -m644 audit.d/* "$pkgdir"/etc/audit/rules.d/

  mkdir -m 700 "$pkgdir"/etc/sudoers.d
  install -m600 sudoers.d/* "$pkgdir"/etc/sudoers.d/
  install -d -m 755 "$pkgdir"/etc/security/limits.d
  install -m600 limits.d/user.conf "$pkgdir"/etc/security/limits.d/"$pkgname".user.conf



  #For swapfile
  #should be a subvolume
  #mkdir -m700 "$pkgdir"/swap


  mkdir -m755 "$pkgdir"/etc/sec.d
  install -D -m644 sec.d/* "$pkgdir"/etc/sec.d/


  mkdir -p "$pkgdir"/var/cache

  mkdir -m750 "$pkgdir"/var/cache/builder
  mkdir -m700 "$pkgdir"/var/cache/builder/.gnupg
  install -m600 builder/gnupg/* "$pkgdir"/var/cache/builder/.gnupg/
  chown -R "${builder_uid}:$builder_gid" "$pkgdir"/var/cache/builder

  mkdir -m755 "$pkgdir"/var/log
  mkdir -m755 "$pkgdir"/var/log/aurup
  chown "${builder_uid}:$builder_gid" "$pkgdir"/var/log/aurup
  mkdir -m755 "$pkgdir"/var/cache/aurup
  mkdir -m755 "$pkgdir"/var/cache/aurup/yay
  chown -R "${builder_uid}:$builder_gid" "$pkgdir"/var/cache/aurup
}

# vim: filetype=PKGBUILD
