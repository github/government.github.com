GitHub y el gobierno Estado de la construcción
captura de pantalla

Reúna, seleccione y presente historias de personas que utilizan GitHub como parte de sus innovaciones de gobierno abierto.

El sitio es de código abierto (¡aquí está todo el código!) Y es una herramienta para y para la comunidad.

Envíe problemas y extraiga solicitudes de historias, ideas de sitios o ediciones.

Metas
Comparta historias de experiencias del mundo real usando GitHub en gobierno abierto
Desmitificar la terminología de código abierto
Muestre a la comunidad usando GitHub para promover conexiones y compartir entre individuos y organizaciones.
Facilite la introducción a GitHub
Bajo el capó
Este sitio está hecho con Jekyll , un generador de sitios estáticos de código abierto. Esto significa que el programa Jekyll toma el contenido que queremos que esté en el sitio y lo convierte en archivos HTML listos para ser alojados en algún lugar. Sorprendentemente, GitHub proporciona alojamiento web gratuito para repositorios, llamado Páginas de GitHub , y así es como se aloja este sitio. El contenido del sitio está en una rama llamada gh-pages .

Contribuyendo
Corregir / editar contenido
Si ve un error o un lugar donde el contenido debe actualizarse o mejorarse, simplemente bifurque este repositorio en su cuenta, realice el cambio que desee y luego envíe una solicitud de extracción. Si no puede realizar el cambio, presente un problema .

Agregar organización
Si conoce una organización de GitHub que debería agregarse a la lista de organizaciones que genera la matriz de avatares en la página de la comunidad : bifurque este repositorio, abra _data / civic_hackers.yml , _data / government.yml o _data / research.yml archivo y agréguelo a la sección correspondiente de la lista en el formato que se está utilizando. ¡Confirme su cambio y envíenos una solicitud de extracción!

Para configurar localmente
Puede tomar todos los archivos de este sitio y ejecutarlos solo en su computadora como si estuviera en vivo en línea, solo que solo está en su máquina.

Requisitos
Jekyll
Rubí
Git
Si ha instalado GitHub Desktop , Git también se instaló automáticamente.

Para copiar los archivos del repositorio desde aquí en su computadora y para ver y servir esos archivos localmente, en la línea de comando de su computadora, escriba:

clon de git https://github.com/github/government.github.com.git
 cd gobierno.github.com
secuencia de comandos / bootstrap
script / servidor
Abrir http://localhost:4000en su navegador

Despliegue
github.government.com ahora utiliza un enfoque de dos repositorios para administrar las implementaciones de ensayo y producción:

Producción: github / Government.github.com (este repositorio)
Puesta en escena: gobierno / puesta en escena
Para pequeños cambios, puede implementar directamente en producción fusionando una solicitud de extracción. Para cambios más grandes, envíe su sucursal al repositorio provisional desde Terminal. A continuación, le mostramos cómo configurar el almacenamiento provisional e implementarlo:

$ script/stage staging
Este script generará el sitio del gobierno (sin iniciar el servidor local) y lo preparará para la puesta en escena. Para ello, crea un repositorio de Git temporal dentro del _sitedirectorio compilado y fuerza el envío a un repositorio remoto separado (en este caso, https://ghe.io/government/staging ).

La inserción en el repositorio de prueba requiere autenticarse con GitHub a través de Terminal. Se le pedirá un nombre de usuario y contraseña cuando se ejecute script/stage. Utilice su nombre de usuario de GHE.io y, dado que aplicamos 2FA, utilice un token de acceso personal como contraseña.

¿Tiene problemas para realizar la implementación en un servidor intermedio? Elimine todo el _sitedirectorio y vuelva a intentarlo. A veces, el repositorio temporal de Git que creamos en el script puede fallar.

Cuando haya terminado con la preparación y se haya aprobado su solicitud de extracción, puede fusionar su rama. Sus cambios se implementarán automáticamente en el sitio de producción en unos minutos.

Problemas de clasificación Ayudantes de código abierto
Además de contribuir con cambios, puede ayudar a clasificar los problemas. Esto puede incluir solicitar información vital o solicitar cambios de formato. Si desea comenzar a clasificar los problemas, una manera fácil de comenzar es suscribirse a Government.github.com en CodeTriage .

¿No ves lo que estás buscando? Cree un problema , haremos todo lo posible para ayudarlo.

Licencia
Los datos incluidos _datason de uso gratuito sin restricciones. Para mayor claridad, estos archivos y las contribuciones a estos archivos se publican bajo CC0-1.0 .

Cuando use los logotipos de GitHub, asegúrese de seguir las pautas del logotipo de GitHub .
