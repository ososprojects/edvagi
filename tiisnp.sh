#!/bin/bash

mkdir -p /opt/VMs
chmod 777 /opt/VMs

# WinXP-TI kopieren
    rsync --delete -av /nwbox-nfs/VMs/WinXP-TI /opt/VMs > /var/log/vms-TI.log
    chmod -R 777 /opt/VMs
    chown -R nwboxuser:nwboxuser /opt/VMs
    rsync --delete -av /nwbox-nfs/files/TInspire/Programme /opt
    chmod -R 777 /opt/Programme
    chown -R nwboxuser:nwboxuser /opt/Programme
    mkdir -p /opt/Start
    chmod -R 777 /opt
    chown -R nwboxuser:nwboxuser /opt


# Konfiguration wird ins Benutzerverzeichnis kopiert und protokolliert
    cp -R /nwbox/fueralle/TINspire/VirtualBox /home/nwboxuser/.config > /var/log/copyTI01.log
    # Rechte
    chmod -R 777 /home/nwboxuser/.config/VirtualBox
    chown -R nwboxuser:nwboxuser /home/nwboxuser/.config/VirtualBox
    # Verzeichnis für VM erstellen
    mkdir /opt/VMs/WinXP-TI
    # Daten für TInspire kopieren
    cp -R -up /nwbox/fueralle/TINspire/WinXP-TI/VMs/WinXP-TI/* /opt/VMs/WinXP-TI
    cp -p /nwbox/fueralle/TINspire/WinXP-TI/VMs/WinXP-TI/*.vbox /opt/VMs/WinXP-TI
    cp -p /nwbox/fueralle/TINspire/WinXP-TI/VMs/WinXP-TI/*.vbox-prev /opt/VMs/WinXP-TI
    cp /nwbox/fueralle/TINspire/WinXP-TI/VMs/WinXP-TI/Snapshots/* /opt/VMs/WinXP-TI/Snapshots
    # Rechte für VM setzen
    chmod -R 777 /opt/VMs
    chmod 755 /opt/VMs/WinXP-TI/*.vdi
    # Verzeichnis für TInspire-Programme erstellen
    mkdir /opt/Programme
    cp -R -up /nwbox/fueralle/TINspire/WinXP-TI/Programme/* /opt/Programme > /var/log/copyTI02
    chmod -R 755 /opt/Programme
    cp -p /nwbox/public/data/TI-Nspire.desktop /Menu/Mathematik
    chmod 755 /Menu/Mathematik/TI-Nspire.desktop
    mkdir /opt/Start
    cp /nwbox/public/data/Start/* /opt/Start
    chmod -R 777 /opt/Start
    cp /nwbox/public/data/winxp /usr/local/sbin
    chmod 755 /usr/local/sbin/winxp



# Win7 in VirtualBox an den Lehrergeräten
    mkdir -p /opt/VMs
    mkdir -p /opt/VMs/Win7
    rm /opt/VMs/Win7/*.vbox
    rm /opt/VMs/Win7/*.vbox-prev
    rm -rf /opt/VMs/Win7/Snapshots
    mkdir /opt/VMs/Win7/Snapshots
    chattr -i /opt/VMs/Win7/Win7.vdi
    cp -Rp /nwbox/fueralle/Win7-config/VirtualBox /home/nwboxuser/.config
    cp -up /nwbox/fueralle/Win7/*.vdi /opt/VMs/Win7
    cp -p /nwbox/fueralle/Win7/Snapshots/* /opt/VMs/Win7/Snapshots
    cp -p /nwbox/fueralle/Win7/*.vbox-prev /opt/VMs/Win7
    cp -p /nwbox/fueralle/Win7/*.vbox /opt/VMs/Win7
#    cp -p /nwbox/fueralle/Win7-config/Win7.desktop /home/nwboxuser/Schreibtisch
    chmod -R 777 /home/nwboxuser/.config/VirtualBox
    chown -R nwboxuser:nwboxuser /home/nwboxuser/.config/VirtualBox
    chmod -R 777 /opt/VMs/Win7
#    chmod 755 /opt/VMs/Win7/*.vdi
    chattr +i /opt/VMs/Win7/Win7.vdi
#    apt-get install -y wmctrl


#Desktop einstellen
chmod 755 /home/nwboxuser/Schreibtisch/*.desktop
chown nwboxuser:nwboxuser /home/nwboxuser/Schreibtisch/*.desktop
chattr -R +i /Menu/*


exit 1

