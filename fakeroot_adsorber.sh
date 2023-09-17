#!/bin/sh
if [ -f adsorber.conf ]; then rm adsorber.conf; fi
cp src/share/default/default-adsorber.conf adsorber.conf
if [ -f blacklist ]; then rm blacklist; fi
cp src/share/default/default-blacklist blacklist
if [ -f sources.list ]; then rm sources.list; fi
cp src/share/default/default-sources.list sources.list
if [ -f whitelist ]; then rm whitelist; fi
cp src/share/default/default-whitelist whitelist
if [ ! -d tmp ]; then mkdir tmp; fi
if [ ! -d cache ]; then mkdir cache; fi
if [ -f hosts ]; then rm hosts; fi
touch hosts
if [ -f hosts.original ]; then rm hosts.original; fi
touch hosts.original
fakeroot ./portable_adsorber.sh update
rm adsorber.conf
rm blacklist
rm sources.list
rm whitelist
rm -r tmp
rm -r cache
rm hosts.original
mv hosts ../../out
