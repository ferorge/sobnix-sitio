#!/usr/bin/env bash

# Instalación de hoyo gopher

## __Autoría y licencia__
###### Instalación de hoyo gopher © 2026 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Fuente__
###### [fuente]:(enlace)

## __Configuración de variables__
timestamp=$(date +%F_%H.%M.%S)

## __Respaldo de configuración__
logger '640 | Respaldando configuración.'
DIR='/var/gopher/'
FILE='gophermap'
mv $DIR$FILE /var/local/backups/$FILE.$timestamp
mv $DIR'es' /var/local/backups/gopher_es.$timestamp

## __Modificación de configuración__
logger '596 | Modificando configuración.'

umask 022

mkdir -p $DIR'es/'

cp -r ./es/* $DIR'es/'
cp gophermap $DIR

chown -R root:staff $DIR

umask 077
