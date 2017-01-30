# ProyectoDAM

## Compilar No-Ip Raspberry Pi

### Ip estática

```
sudo nano /etc/network/interfaces
# Añadimos lo siguiente a nuestra interfaz de red
address 192.168.xxx.xxx
netmask 255.255.255.0
network 192.168.xxx.xxxx
gateway 192.168.xxx.xxx
```
Preparar el entorno:

```
sudo mkdir /descargaNP
cd /descargaNP
sudo wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz - See more at: https://www.redeszone.net/raspberry-pi/no-ip/#sthash.ACDXAJ38.dpuf
sudo tar zxvpf noip-duc-linux.tar.gz
cd noip-2.1.9-1
sudo make
sudo make install
```

Creamos el demonio:

```
sudo nano /etc/init.d/noip2
```
Añadimos el siguiente contenido:

```
#! /bin/bash

sudo /usr/local/bin/noip2
```

Le damos permisos de ejecucción:
```
sudo chmod +x /etc/init.d/noip2
```

Cargamos el demonio:
```
sudo update-rc.d noip2 defaults
```

Al realizar la instalación nos preguntará por el usuario y el dominio, recuerda darte de alta en la página [No-Ip](http://www.noip.com/).

# Forwarding

Para que puedas acceder desde cualquier lugar a la Raspberry Pi, recuerda activar el redireccionamiento en tu router, o poner la Raspberry Pi en un DMZ.


# Desplegar el bot

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

Ejemplo de bot en marcha:

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
