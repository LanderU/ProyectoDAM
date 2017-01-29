# ProyectoDAM


Para ejecutar el bot en la Raspberry Pi, sólo tienes que hacer lo siguiente:

```
cd /home/pi
sudo apt-get install -y git
git clone https://github.com/LanderU/ProyectoDAM
cd /home/pi/ProyectoDAM/scripts
sudo sh deploy.sh
```

El servidor arrancará sólo.

Puedes consultar el estado del servidor mediante el comando:

```
sudo systemctl status -l bot.service
```

Sí la salida es algo así:

```
pi@raspberrypi:~/ProyectoDAM/scripts $ sudo systemctl status -l bot.service
● bot.service - Facebook bot
   Loaded: loaded (/lib/systemd/system/bot.service; enabled)
   Active: active (running) since Sun 2017-01-29 18:13:24 UTC; 6min ago
 Main PID: 2203 (start.sh)
   CGroup: /system.slice/bot.service
           ├─2203 /bin/bash /home/pi/start.sh
           └─2206 node /home/pi/ProyectoDAM/server.js

Jan 29 18:13:24 raspberrypi systemd[1]: Started Facebook bot.
Jan 29 18:13:25 raspberrypi start.sh[2203]: Servidor Express escuchando en el puerto 3000...
Jan 29 18:18:42 raspberrypi systemd[1]: Started Facebook bot.
```

Todo ha ido bien.

# Forwarding

Recuerda que para que la aplicación sea accesible desde internet es necesario habilitar el redireccionamiento de puertos en tu router.

Para que la ip siempre sea la misma y poder usar el nombre, he usdo [noip](http://www.noip.com/).