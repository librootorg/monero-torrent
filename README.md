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
torrent file info:
```
Name: Monero-project-torrent-v0.18.4.2
File: Monero-project-torrent-v0.18.4.2.torrent

GENERAL

  Name: Monero-project-torrent-v0.18.4.2
  Hash: ea1d16eef8452df5ac34ec6afa610390f9d35a6e
  Created by: Transmission/3.00 (bb6b5a062e)
  Created on: Sat Sep 13 12:16:24 2025
  Piece Count: 2782
  Piece Size: 512.0 KiB
  Total Size: 1.46 GB
  Privacy: Public torrent

TRACKERS

FILES

  Monero-project-torrent-v0.18.4.2/binaryfate.asc (5.44 kB)
  Monero-project-torrent-v0.18.4.2/hashes.txt (3.04 kB)
  Monero-project-torrent-v0.18.4.2/monero-android-armv7-v0.18.4.2.tar.bz2 (84.56 MB)
  Monero-project-torrent-v0.18.4.2/monero-android-armv8-v0.18.4.2.tar.bz2 (84.67 MB)
  Monero-project-torrent-v0.18.4.2/monero-freebsd-x64-v0.18.4.2.tar.bz2 (71.15 MB)
  Monero-project-torrent-v0.18.4.2/monero-gui-install-win-x64-v0.18.4.2.exe (99.16 MB)
  Monero-project-torrent-v0.18.4.2/monero-gui-linux-x64-v0.18.4.2.tar.bz2 (130.3 MB)
  Monero-project-torrent-v0.18.4.2/monero-gui-mac-armv8-v0.18.4.2.dmg (48.41 MB)
  Monero-project-torrent-v0.18.4.2/monero-gui-mac-x64-v0.18.4.2.dmg (67.22 MB)
  Monero-project-torrent-v0.18.4.2/monero-gui-source-v0.18.4.2.tar.bz2 (22.00 MB)
  Monero-project-torrent-v0.18.4.2/monero-gui-win-x64-v0.18.4.2.zip (137.4 MB)
  Monero-project-torrent-v0.18.4.2/monero-linux-armv7-v0.18.4.2.tar.bz2 (70.94 MB)
  Monero-project-torrent-v0.18.4.2/monero-linux-armv8-v0.18.4.2.tar.bz2 (72.28 MB)
  Monero-project-torrent-v0.18.4.2/monero-linux-riscv64-v0.18.4.2.tar.bz2 (76.20 MB)
  Monero-project-torrent-v0.18.4.2/monero-linux-x64-v0.18.4.2.tar.bz2 (82.47 MB)
  Monero-project-torrent-v0.18.4.2/monero-linux-x86-v0.18.4.2.tar.bz2 (83.35 MB)
  Monero-project-torrent-v0.18.4.2/monero-mac-armv8-v0.18.4.2.tar.bz2 (65.19 MB)
  Monero-project-torrent-v0.18.4.2/monero-mac-x64-v0.18.4.2.tar.bz2 (76.27 MB)
  Monero-project-torrent-v0.18.4.2/monero-source-v0.18.4.2.tar.bz2 (15.93 MB)
  Monero-project-torrent-v0.18.4.2/monero-win-x64-v0.18.4.2.zip (87.17 MB)
  Monero-project-torrent-v0.18.4.2/monero-win-x86-v0.18.4.2.zip (83.44 MB)

```

easy todo is to configure output dirs (downloads + watch)