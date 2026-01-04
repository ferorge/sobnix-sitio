#!/usr/bin/env bash

# Instalación de cápsula gemini

## __Autoría y licencia__
###### Instalación de cápsula gemini © 2026 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Instalación de cápsula gemini__

umask 022

DIR=/var/gemini/gmi/

mkdir -p $DIR

cp -r ./public_gemini/gmi/* $DIR

chown -R molly-brown:molly-brown $DIR


umask 077
