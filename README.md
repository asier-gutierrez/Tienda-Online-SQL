# TIENDA ONLINE (SQL)

Este proyecto está hecho para que cualquiera sin conocimientos de SQL pueda crear una Base de Datos de una tienda online completamente funcional y práctica.

El proyecto está creado para un trabajo en equipo en la universidad de Deusto.

Estas son las carácterísticas de este proyecto:
  - Facilidad y sencillez.
  - Despliegue rápido.
  - Base de datos completa.
  - Abierto a cualquier cambio*.


**Se pueden realizar cambios, pero puede que no funcione como es debido. Es decir, cualquiera puede editar, otra cosa es que le funcione porque lo haya hecho mal.*

### Versión
1.0

### Tecnologías

Nuestra base de datos utiliza estas tecnologías de manera directa:

* [Oracle 11g] - Versión de la base de datos que utilizamos.
* [SQL plus] - Programa de ejecución que usamos. [Línea de comandos]



### Despliegue

Para empezar el despliegue es necesario haber instalado SQL Plus de Oracle y haberlo configurado correctamente.

Hecho esto, se deberá ejecutar el comando START o @ para ejecutar la creación.

```sh
@ [Ruta en la cual se encuentra el fichero implementacion.sql]
```

Después, sugerimos comprobar la estructura de la tabla.

```sh
@ [Ruta en la cual se encuentra el fichero comprobacionesDESC.sql]
```

Una vez terminado este paso, se insertarían los datos. En nuestro caso sería así.

```sh
@ [Ruta en la cual se encuentra el fichero datos.sql]
```

Para terminar comprobaríamos los datos insertados.

```sh
@ [Ruta en la cual se encuentra el fichero comprobacionesDATOS.sql]
```

Y ahora, ¡¡a desarrollar tu programa que interactúe con la base de datos!!


### Desarrollo

¿Quieres desarrollar? ¡Puedes hacerlo!

Tan sólo tienes que descargarte el proyecto y codificar.

Enlaces del proyecto para copiar:

* [HTTPS] https://github.com/asier-gutierrez/Tienda-Online-SQL.git

* [SSH] git@github.com:asier-gutierrez/Tienda-Online-SQL.git

### TODOs

 - Añadir más código comentado.
 - Hacer la base de datos multilenguaje.
 - Añadir más mejoras (eficiencia, sinónimos, vistas útiles...).

### Desarrollador@s

Est@s son l@s desarrollador@s del proyecto

* Asier Gutiérrez
* Iván Martín
* Marta Anguiano
* Yasmín Martín

Licencia
----

GNU General Public License

[//]: #
   [Oracle 11g]: <http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html>
   [SQL plus]: <http://docs.oracle.com/cd/B19306_01/server.102/b14357/ape.htm>


