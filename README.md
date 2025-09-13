# monero-torrent
create a torrent of all monero release binaries with a deterministic file info hash. seeding this is left up to the user currently

some thoughts:

- with a multi file torrent users can manually select which files they wish to download from it (depending on client), thats cool.
- Docker - i spent some time here, painful. a docker image to spit out the binaries and torrent which the user can seed how they wish is straight forward, but the transmission docker container to auto seed this is problematic as i couldnt figure out the file permissions. 
- dockerhub will be useful to pull the new binaries and torrent file but i could just run the shell script instead


shell script outputs this:
```

├── downloads
│   └── Monero-project-torrent-v0.18.4.2
│       ├── binaryfate.asc
│       ├── hashes.txt
│       ├── monero-android-armv7-v0.18.4.2.tar.bz2
│       ├── monero-android-armv8-v0.18.4.2.tar.bz2
│       ├── monero-freebsd-x64-v0.18.4.2.tar.bz2
│       ├── monero-gui-install-win-x64-v0.18.4.2.exe
│       ├── monero-gui-linux-x64-v0.18.4.2.tar.bz2
│       ├── monero-gui-mac-armv8-v0.18.4.2.dmg
│       ├── monero-gui-mac-x64-v0.18.4.2.dmg
│       ├── monero-gui-source-v0.18.4.2.tar.bz2
│       ├── monero-gui-win-x64-v0.18.4.2.zip
│       ├── monero-linux-armv7-v0.18.4.2.tar.bz2
│       ├── monero-linux-armv8-v0.18.4.2.tar.bz2
│       ├── monero-linux-riscv64-v0.18.4.2.tar.bz2
│       ├── monero-linux-x64-v0.18.4.2.tar.bz2
│       ├── monero-linux-x86-v0.18.4.2.tar.bz2
│       ├── monero-mac-armv8-v0.18.4.2.tar.bz2
│       ├── monero-mac-x64-v0.18.4.2.tar.bz2
│       ├── monero-source-v0.18.4.2.tar.bz2
│       ├── monero-win-x64-v0.18.4.2.zip
│       └── monero-win-x86-v0.18.4.2.zip
├── create-monero-torrent.sh
└── watch
    └── Monero-project-torrent-v0.18.4.2.torrent
```

easy todo is to configure output dirs (downloads + watch)