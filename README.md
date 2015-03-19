# Building

    docker build -t dst .

# Running

    docker run -d -p 10999:10999/udp --name dst-one -v /opt/dst/one/:/app/data dst

# Updating

    docker build -t dst --no-cache .

Then `docker rm -f` your containers and recreate them.

# Configuration

Not subject of this readme. Read [this](http://dont-starve-game.wikia.com/wiki/Don%E2%80%99t_Starve_Together_Dedicated_Servers#Server_Tokens).

# Notes

* You will need to generate a server token. The process is described in the wiki article linked above.
* If you give players console access expcet them to crash the server.
* The server will broadcast its listen port to the masterserver. Make sure outside port matches the config value.
