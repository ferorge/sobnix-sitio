#!/usr/bin/env bash

# Creación de la cápsula

## __Autoría y licencia__
###### Creación de la cápsula © 2025 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Creación de textos__
source ./540.Creacion-textos.sh

## __Creación de barra de navegación__
source ./616.Modificacion-nav.sh

## __Creación de menú de la cápsula__
source ./618.Modificacion-aside.sh

## __Creación de plantilla de la cápsula__
# source ./542.Creacion-plantilla-md.sh

## __Creación de la cápsula__
md_files=$(find ./es/articles/ -name '*.md' | sort)

## __Creación de directorio raíz__
DIR=public_gemini/gmi/
mkdir -p $DIR

umask 022
for file in $md_files
do
    ### Obtención de artículo sin metadatos.
    sed -n '/^$/,$ p' $file > es/60-article.md

    ### Obtención del nombre para el directorio.
    dir_site=$(echo $file | cut -d '/' -f 4 )

    ### Obtención de nombre para fichero.
    name_site=$(echo $file | cut -d '.' -f 3 )

    ### Definición de nombre de cápsula.
    #### Evalúa si es fichero o directorio.
    if [[ $dir_site =~ ".md" ]]; then
        gmi=$name_site.gmi
    else
        gmi=$dir_site/$name_site.gmi
        ### Creación de subdirectorios.
        mkdir -p $DIR$dir_site
    fi
    ### Conversión de md a html.
    multimarkdown -t mmd -o $DIR$gmi es/.gemini.mmd

    ### Sustitución de https a gemini.
    sed -i 's|https://sobnix.ar/|gemini://sobnix.ar/gmi/|g' $DIR$gmi
    sed -i 's/.html/.gmi/g' $DIR$gmi
    sed -i 's|gmi/~|users/|g' $DIR$gmi

    ### Conversión a gemtext.
    #### Sustitución de enlaces [Sitio](enlace)'
    sed -i -E 's/\[(.+)\]\((.+)\)/=> \2 \1/' $DIR$gmi

    ### Adecuación de menú.
    sed -i 's/    \* =>/=>/g' $DIR$gmi

    ### Adecuación de navbar.
    sed -i 's/* =>/=>/g' $DIR$gmi

    ### Sustituir doble linea vacia por una.
    sed -i '/^$/N;/\n$/D' $DIR$gmi

done
umask 077
