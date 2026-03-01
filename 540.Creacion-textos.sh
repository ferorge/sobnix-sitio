#!/usr/bin/env bash

# Creación de textos

## __Autoría y licencia__
###### Creación de textos © 2025 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Fuente__
###### [fuente]:(enlace)

## __Configuración de variables__
HOST=$(hostname -s)
FQDN=$(hostname -f)
timestamp=$(date +%F_%H.%M.%S)
DATE=$(date +%F)
YEAR=$(date +%Y)

## __Respaldo de configuración__
logger '540 | Respaldando configuración.'
DIR='./es/'
#FILE="*.md"
#cp $DIR$FILE /var/local/backups/$FILE.$timestamp

## __Modificación de configuración__
logger '540 | Modificando configuración.'

DIV='_______________________________________________________________________________'

cat <<EOF > $DIR'.01-head.mmd'
Language: es
Quotes Language: es
Base Header Level: 1
css: lynx.css
Author: ~ferorge
Email: ferorge@texto-plano.xyz
Affiliation: https://$FQDN
Date: $DATE
copyright: $YEAR, ~ferorge, CC BY-SA 4.0.
KeyWords: servidor, publico, libre, pubnix, auto alojado, soberano
Title: Titulo | Pubnix soberano

EOF

cat <<EOF > $DIR'.10-header.mmd'

{{./12-cartel.md}}
{{./13-eslogan.md}}
EOF

cat <<EOF > $DIR'11-saludo.md'

Bienvenide
==========

EOF

toilet -f ivrit -k "       $HOST" > $DIR'12-cartel.md'
echo $DIV >> $DIR'12-cartel.md'

cat <<EOF > $DIR'13-eslogan.md'
## Servidor + Publico | Libre > Pubnix
  
## Pubnix | Auto alojado > Soberano
$(echo $DIV)
EOF

cat <<EOF > $DIR'.20-nav.mmd'
{{./21-navbar.md}}
EOF

cat <<EOF > $DIR'.30-aside.mmd'
{{./31-menu.md}}
EOF

cat <<EOF > $DIR'.40-main.mmd'
<section>
{{./.50-section.mmd}}
</section>
EOF

cat <<EOF > $DIR'.50-section.mmd'
<article>
{{./60-article.md}}
</article>
EOF

cat <<EOF > $DIR'60-article.md'
### Artículo
$(echo $DIV)
EOF

### El fichero 62-sobnix.md es estático.

cat <<EOF > $DIR'64-usuaries.md'
$(toilet -f mini -k '    Usuaries')
$(echo $DIV)
EOF

cat <<EOF > $DIR'66-userlist.md'
$(grep ':100:' /etc/passwd | grep -v ':x:100:' | cut -d ':' -f 1 | sort | xargs -I {} printf "[~{}](https://$FQDN/~{}/)  \n")
$(echo $DIV)
EOF

### El fichero 68-motd.md es generado a través de index.py.
### El usuario www-data no tiene acceso a /usr/games/fortune

sed -i '1 i\_Recuerda que_  ' $DIR'68-motd.md'
echo $DIV >> $DIR'68-motd.md'

cat <<EOF > $DIR'69-index.mmd'
$(sed s/Titulo/Sobnix/g es/.01-head.mmd)

{{./62-sobnix.md}}
{{./68-motd.md}}
{{./66-usuaries.md}}
{{./66-userlist.md}}
{{./71-licencia.md}}
$(echo $DIV)
EOF

cat <<EOF > $DIR'.70-footer.mmd'
{{./72-pie.md}}
{{./73-vrms.md}}
$(echo EOF)
EOF

cat <<EOF > $DIR'71-licencia.md'

### Autoría y licencia

Documento © $YEAR por \~ferorge
[ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).

![Licenciado bajo CC BY-SA 4.0.][img]
[img]: https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by-sa.png
"CC BY-SA 4.0 International"

Para ver una copia de esta licencia, visite CC BY-SA 4.0.
[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.es)
EOF

cat <<EOF > $DIR'72-pie.md'

$HOST | Pubnix soberano | __En línea desde: $(uptime -s)__
$(echo $DIV)
EOF

vrms |fold -w 57 | sed "2,$ s/^/>  /g" > $DIR'73-vrms.md'
echo $DIV >> $DIR'73-vrms.md'
sed -i '1d' $DIR'73-vrms.md'

multimarkdown -t mmd -o ./es/articles/10.Sobnix.md $DIR'69-index.mmd'

logger "textos modificados por $USER"

if [ $UID == 0 ]; then
  chown root:staff $DIR*.md
  chmod 0664 $DIR*.md
fi
