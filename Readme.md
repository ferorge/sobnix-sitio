#  Sitio de sobnix

## __Objetivo__
Crear el sitio web de sobnix dinámicamente a partir de texto plano utilizando  
[multimarkdown v6].
[multimarkdown v6]:https://fletcherpenney.net/multimarkdown/

## __Dependencias__
Para ejecutar los guiones es necesario instalar las siguientes dependencias:  
* coreutils
* sed
* multimarkdown v6

## __Procedimiento__
1. Clonar el repositorio en la raíz del sitio.
```
cd /var/www/
umask 022
git clone https://git.sobnix.dynv6.net/ferorge/sobnix-sitio
umask 077
chown -R www-data:www-data /var/www/sobnix-sitio
```
2. Ejecutar el guión _620.Creacion-sitio.sh_ obteniendo:
	* Metadatos con la fecha de ejecución.
	* Textos estándar de encabezado.
	* Textos estándar de pie de página.
	* Barra de navegación.
	* Menú del sitio.
	* Artículos convertidos a html.
3. Apuntar el servidor web al directorio _public/_.

## __Sitios incluídos__
1. Inicio.
	1. Visión.
	2. Misión.
	3. Valores.
	4. Listado de usuarios.
2. Novedades.
3. Servicios.
4. Código de conducta.
	1. Politica de diversidad.
	2. Politica de integridad.
	3. Politica de sustentabilidad.
	4. Politica de privacidad.
	5. Politica de seguridad.
5. Unite.

## __Encabezado__
* Cartel.
* Eslogan.

## __Pie de página__
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
