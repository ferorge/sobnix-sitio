#!/usr/bin/env bash

# Creación de sitio

## __Autoría y licencia__
###### Creación de sitio © 2025 por \~ferorge
###### [ferorge@texto-plano.xyz](mailto:ferorge@texto-plano.xyz).
###### Licenciado bajo GNU Public License version 3.
###### Para ver una copia de esta licencia, visite:
###### [GPLv3]:(https://www.gnu.org/licenses/gpl.txt)

## __Creación de textos__
source ./540.Creacion-textos.sh

## __Creación de barra de navegación__
source ./616.Modificacion-nav.sh

## __Creación de menú del sitio__
source ./618.Modificacion-aside.sh

## __Creación de plantilla del sitio__
source ./542.Creacion-plantilla-md.sh

## __Creación de sitio__
md_files=$(find ./es/articles/ -name '*.md' | sort)

for file in $md_files
do
    ### División de head y article
    sed -n '0,/^$/p' $file > es/.01-head.mmd
    sed -n '/^$/,$ p' $file > es/60-article.md

    ### Obtención del nombre para el directorio.
    dir_site=$(echo $file | cut -d '/' -f 4 )

    ### Evalúa si es fichero o directorio.
    if [[ $dir_site =~ ".md" ]]; then
	dir_site=''
    else
        ### Creación de subdirectorios.
        mkdir -p ./public_html/$dir_site

	### Adecuación de ruta del CSS.
	sed -i "s/css: lynx.css/css: ..\/lynx.css/g" es/.01-head.mmd
    fi

    ### Obtención de nombre para fichero.
    name_site=$(echo $file | cut -d '.' -f 3 )

    ### Obtención de nombre para licencia.
    ###### Licencia agregada a cada artículo.
    # name=$(echo $name_site | cut -d '.' -f 2 | sed 's/_/ /g')	

    ### Indicación de artículo en la licencia.
    ###### Licencia agregada a cada artículo.
    # sed -i "s/Documento/$name/g" es/71-licencia.md

    ### Unión de head con body.
    cat es/.01-head.mmd es/.02-body.mmd > es/.work.md

    ### Conversión de md a html.
    multimarkdown -o public_html/$dir_site/$name_site.html es/.work.md

    ### Quitar artículo de licencia.
    ###### Licencia agregada a cada artículo.
    # sed -i "s/$name/Documento/g" es/71-licencia.md
done

sed -i "s/Documento/Sobnix/g" public_html/Sobnix.html

## __Eliminación de fichero de trabajo__
rm es/.work.md

