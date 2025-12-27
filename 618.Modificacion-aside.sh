#!/usr/bin/env bash

# Modificación de aside

## __Autoría y licencia__
###### Modificación de aside © 2025 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Fuente__
###### [fuente]:(enlace)

## __Configuración de variables__
FQDN=$(hostname -f)
DR='./es/articles/'
SUB_DIR=''
timestamp=$(date +%F_%H.%M.%S)

## __Respaldo de configuración__                             
logger '618 | Respaldando configuración.'
DIR='./es/'
FILE='31-menu.md'

## __Modificación de configuración__
logger '618 | Modificando configuración.'

# Borra el contenido de 31-menu.md
echo '' > $DIR$FILE

# Recorre el document root buscando sitios y generando enlaces
SITES=$(find $DR -name "*.md" | sort)
for SITE in $SITES
do
#  NAME_SITE=$(echo $SITE | cut -d'/' -f 8 | sort)
  NAME_SITE=$(echo $SITE | cut -d'/' -f 5 | sort | cut -d '.' -f 2)
# Verifica que NAME_SITE no esté vacío
  if [ ! -z "$NAME_SITE" ]
  then
    DIR_NAME=$(echo $SITE | cut -d'/' -f 4)
    if [[ $SUB_DIR != $DIR_NAME ]]
    then
    SUB_DIR=$DIR_NAME
    LINK=$(printf "https://$FQDN/$NAME_SITE.html")
    echo "* ${SUB_DIR^}" >> $DIR$FILE
    fi
    LINK=$(printf "https://$FQDN/$SUB_DIR/$NAME_SITE.html")
    NAME=$(echo $NAME_SITE | sed 's/_/ /g')
    echo "    * [$NAME]($LINK)" >> $DIR$FILE
  fi
done

logger "$FILE modificado por $USER"

# if [ $UID == 0 ]; then
#   chown root:staff $DIR$FILE
#   chmod 0664 $DIR$FILE
# fi

