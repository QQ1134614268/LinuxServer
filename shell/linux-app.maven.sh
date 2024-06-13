mvn compile \
	-Dmaven.compiler.source=1.8 \
	-Dmaven.compiler.target=1.8 \
	-Dproject.build.sourceEncoding=UTF-8
mvn package \
	-DskipTests \
	-Dmaven.javadoc.skip=true \
	-Dmaven.source.skip=true \
	-Dmaven.wagon.http.ssl.insecure=true \
	-Dmaven.wagon.http.ssl.allowall=true \
	-Dmaven.repo.local=/root/.m2/repository \
	-s /root/.m2/settings.xml \
	-T 4
mvn install:install-file \
	-Dmaven.test.skip=true \
	-DgroupId=com.example \
	-DartifactId=my-artifact \
	-Dversion=1.0 \
	-Dpackaging=jar \
	-Dmaven.repo.local=/path/to/repo \
	-Dfile=/path/to/my-artifact-1.0.jar

mvn test \
	-Dsurefire.skipAfterFailureCount=5 \
	-Dtest=MyClassTest

mvn --debug
mvn dependency:go-offline
