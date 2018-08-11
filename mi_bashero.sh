echo "EMPEZANDO"
mkdir /opt/reto
cd /opt/reto/
#EN ESTA CARPETA PONER EL DOCKERFILE
docker run -d --name contenedor_sonarqube \
    -p 9000:9000 -p 9092:9092 \
    -e SONARQUBE_JDBC_USERNAME=sonar \
    -e SONARQUBE_JDBC_PASSWORD=sonar \
    -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
    sonarqube:7.1
docker run --name contenedor_jfrog docker.bintray.io/jfrog/artifactory-oss
docker image build -t imagen_bamboo:1.0 .
docker run --name contenedor_bamboo -d --link contenedor_sonarqube:sonar_qube --link contenedor_jfrog:frog imagen_bamboo:1.0
echo "FIN"