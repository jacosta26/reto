# reto
Reto técnico
============

Contexto
========

El Banco X de la ciudad de Zion, necesita aplicar integración continua con entrega contínua de sus aplicaciones basadas en cloud para ello ha elegido las siguientes
herramientas:

1.- Github
2.- Bamboo
3.- Jfrog Artifactory OSS
4.- SonarQube

Reto técnico
============

Como especialista de DevOps se ha pedido diseñar e implementar un pipeline de integración y entrega continua que no incluye el deployment como prueba de concepto.

Se te brinda un repositorio de código de ejemplo en spring boot que puedes utilizar que es el siguiente:

https://github.com/rauccapuclla/devops-docket.git

Como parte de la prueba de concepto se te pide desarrollar lo siguiente:

1.- Crear una rama llamada POC-01
2.- Suscribirte con una cuenta de trial para descargar Bamboo e instalar como un contenedor docker.
3.- Instalar Jfrog artifactory como un Docker
4.- Instalar SonarQube como un contenedor Docker
5.- Implementar el siguiente pipeline de integración continua con Bamboo:

- Utilizar git flow con las siguientes ramas:

SPRINT-X -> Se debe de crear e forma automatica y solo debe compilar y ejecutar pruebas unitarias

DEV -> Creación es manual y bamboo debe de compilar, generar las pruebas unitarias visibles y generar SNAPSHOT y que debe de ser subido hacia el Artifactory
en un repositorio llamado XREX-snapshot y generar un contenedor docker que contenga el tag latest y la version del pom.xml + timestamp
En esta rama se debe de tagear la version del pom.xml en github + el timestamp

QA -> Esta es una rama temporal que se genera un release (mvn deploy) y se sube hacia artifactory hacia el repositorio de XREX.qa 
y se hace una tag en la rama de DEV indicando la version Release RC + timestamp
En esta parte se debe de retagear el contenedor con la version del RC y subir a artifactory.

ZION -> Esta rama es la master del proyecto, el tag de RC debe de hacer merge hacia master y relizar el tag con la version de release generado 
y se debe de promover a nivel de artifactory
El artefacto hacia el repositorio de XREX.rs
Finalmente el contenedor perteneciente hacia la version tageada para master debe tambien se retageado como release y subido hacia el artifactory Docker registry.

6.- Se debe de mostrar en sonaqube el analisis del código y la cobertura de código.

Consideraciones:

1.- Subir hacia la rama POC-01 los dockerfile generados y los scripts utilizados para poder implementar el pipeline de integración continua y de despliegue continuo.
2.- A final del reto se iniciará una session de webex para mostrarnos la solución del reto.
