from ubuntu:trusty

volume ["/app/data"]

ENV DEBIAN_FRONTEND noninteractive

# dependencies
run dpkg --add-architecture i386
run apt-get update
run apt-get install -y git curl lib32gcc1 lib32stdc++6 libcurl4-gnutls-dev:i386

# setup environment for steamcmd
run mkdir -p /steamcmd
run chown -R daemon:daemon /steamcmd
workdir /steamcmd
user daemon

# download steamcmd and the game
run curl --silent -o ./steamcmd.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz
run tar -xvzf steamcmd.tar.gz
run ./steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /steamcmd/game +app_update 343050 validate +quit

# install clean up
user root
run mv /steamcmd/game /app
run chown -R root:root /app
run chmod -R 755 /app 
run rm -rf /steam
add boot.sh /app/boot.sh

run du -h /app

ENV DEBIAN_FRONTEND newt

# run it all
entrypoint ["/bin/bash"]
cmd ["/app/boot.sh"]
