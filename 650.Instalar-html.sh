#!/usr/bin/env bash

# Instalación de sitio html

## __Autoría y licencia__
###### Instalación de sitio html © 2026 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Instalación de sitio html__
umask 022

DIR=/var/www/sobnix-sitio/

mkdir -p $DIR'es/'

cp ./540.Creacion-textos.sh $DIR
cp ./542.Creacion-plantilla-md.sh $DIR
cp ./616.Modificacion-nav.sh $DIR
cp ./618.Modificacion-aside.sh $DIR
cp ./620.Creacion-sitio.sh $DIR
cp -r ./es/articles $DIR'es/'
cp -r ./public_html $DIR

chown -R www-data:www-data $DIR

umask 077
