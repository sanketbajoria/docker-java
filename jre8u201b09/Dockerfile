FROM anapsix/alpine-java:8u201b09_server-jre_unlimited
MAINTAINER Sanket Bajoria <bajoriasanket@gmail.com>

RUN echo 'crypto.policy=unlimited' >> $JAVA_HOME/jre/lib/security/java.security && \
	echo 'networkaddress.cache.ttl=60' >> $JAVA_HOME/jre/lib/security/java.security

CMD ['sh']
