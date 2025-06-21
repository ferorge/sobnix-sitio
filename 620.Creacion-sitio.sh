#!/usr/bin/bash

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

## __Creación de sitio__
md_files=$(find ./md/articles/ -name '*.md' | sort)

for file in $md_files
do
    ### División de meta y article
    sed -n '0,/^$/p' $file > md/.00-meta.mmd
    sed -n '/^$/,$ p' $file > md/60-article.md

    ### Obtención del nombre para el directorio.
    dir_site=$(echo $file | cut -d '/' -f 4 )

    ### Evalúa si es fichero o directorio.
    if [[ $dir_site =~ ".md" ]]; then
	dir_site=''
    else
        ### Creación de subdirectorios.
        mkdir -p ./public/$dir_site

	### Adecuación de ruta del CSS.
	sed -i "s/css: lynx.css/css: ..\/lynx.css/g" md/.00-meta.mmd
    fi

    ### Obtención de nombre para fichero.
    name_site=$(echo $file | cut -d '.' -f 3 )

    ### Obtención de nombre para licencia.
    ###### Licencia agregada a cada artículo.
    # name=$(echo $name_site | cut -d '.' -f 2 | sed 's/_/ /g')	

    ### Indicación de artículo en la licencia.
    ###### Licencia agregada a cada artículo.
    # sed -i "s/Documento/$name/g" md/71-licencia.md

    ### Unión de meta con plantilla.
    cat md/.00-meta.mmd md/.template.md > md/.work.md

    ### Conversión de md a html.
    multimarkdown -o public/$dir_site/$name_site.html md/.work.md

    ### Quitar artículo de licencia.
    ###### Licencia agregada a cada artículo.
    # sed -i "s/$name/Documento/g" md/71-licencia.md
done

## __Eliminación de fichero de trabajo__
rm md/.work.md

#mv public/sobnix.html public/index.html
# chown -R fernando:staff public/
# chmod 0664 public/*
#fi
