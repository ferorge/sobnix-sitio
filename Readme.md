#  Sitio de sobnix

## __Objetivo__

Crear el sitio web y cápsula gemini de sobnix dinámicamente a partir de texto  
plano utilizando  [multimarkdown v6].
[multimarkdown v6]:https://fletcherpenney.net/multimarkdown/

## __Dependencias__

Para ejecutar los guiones es necesario instalar las siguientes dependencias:  
* coreutils
* sed
* multimarkdown v6

## __Procedimiento__

* Clonar el repositorio en /var/local/ o en la ruta de tu preferencia.  
```
cd /var/local/
umask 022
git clone https://git.sobnix.ar/ferorge/sobnix-sitio
umask 077
```
### __Procedimiento para sitio html__

1. Editar el guión _650.Instalar-html.sh_ indicando la ruta al document root.  
2. Ejecutar el guión _650.Instalar-html.sh_ con permisos de super usuario.  
3. Apuntar el servidor web al directorio _public/_.  

### __Procedimiento para cápsula gemini__

1. Ejecutar el guión _630.Creacion-capsula.sh_.
2. Editar el guión _660.Instalar-gemini.sh_ indicando la ruta a /var/gemini/.  
3. Ejecutar el guión _660.Instalar-gemini.sh_.  
4. Apuntar el servidor gemini al directorio _gmi/_.  

## __Sitios incluídos__
1. Inicio.
2. Filosofía.
	1. Visión.
	2. Misión.
	3. Valores.
3. Servicios.
4. Código de conducta.
	1. Politica de diversidad.
	2. Politica de integridad.
	3. Politica de sustentabilidad.
	4. Politica de privacidad.
	5. Politica de seguridad.
5. Unite.
6. Novedades.

### __Encabezado__
* Cartel.
* Eslogan.

### __Pie de página__
* Licencia
* Tiempo en línea
* Compromiso con el software libre.

## Características a incorporar
* Aplicaciones.
* _cryptpad_
* _forum (bbj)_
* git
* gemini
* gopher
* _irc_
* _mastodon_
* _nextcloud_
* _pastebin_
* _webmail_
* _webring_
* _xmpp_

## Licencia

sobnix-sitio se distribuye bajo la licencia GPLv3.
Consulte el fichero LICENSE para más detalles.

EOF

