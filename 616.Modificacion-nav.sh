#!/usr/bin/bash

# Modificación de nav

## __Autoría y licencia__
###### Modificación de nav © 2025 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Fuente__
###### [fuente]:(enlace)

## __Configuración de variables__
FQDN=$(hostname -f)
DR='./md/articles/'
SUB_DIR=''
timestamp=$(date +%F_%H.%M.%S)

## __Respaldo de configuración__
echo -e "$CYAN Respaldando configuración $DEFAULT"
DIR='./md/'
FILE='21-navbar.md'
cp $DIR$FILE /var/local/backups/$FILE.$timestamp

## __Modificación de configuración__
echo -e "$CYAN Modificando configuración $DEFAULT"

# Borra el contenido de 21-navbar.md
echo '' > $DIR$FILE

# Recorre el document root buscando sitios y generando enlaces
SITES=$(find $DR -name "*0*.md" | sort ) #| grep -v -e index -e users)
echo $SITES
for SITE in $SITES
do
    echo $SITE
    NAME_SITE=$(echo $SITE | cut -d'/' -f 4 | cut -d '.' -f 2)
    # Verifica que NAME_SITE no esté vacío
    if [ ! -z "$NAME_SITE" ]
    then
	LINK=$(printf "https://$FQDN/$NAME_SITE.html")
	NAME=$(echo $NAME_SITE | sed 's/_/ /g')
      echo "- [${NAME^}]($LINK)" >> $DIR$FILE
    fi
done

sed -i "s/Index/Inicio/g" $DIR$FILE

logger "$FILE modificado por $USER"

if [ $UID == 0 ]; then
  chown root:staff $DIR$FILE
  chmod 0664 $DIR$FILE
fi

