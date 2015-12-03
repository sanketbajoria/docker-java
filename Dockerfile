FROM progrium/busybox
MAINTAINER Harpreet Singh <hs@hsingh.com>
# Based on https://github.com/develar/docker-java

ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=45 \
    JAVA_VERSION_BUILD=14 \
    JAVA_PACKAGE=server-jre \
    JAVA_HOME=/jre \
    PATH=${PATH}:/jre/bin \
    LANG=C.UTF-8

RUN opkg-install curl ca-certificates && \
 cd /tmp && \
 curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | gunzip -c - | tar -xf - && \
  mv jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/jre /jre && \
  opkg-cl remove ca-certificates && \
  rm -rf /jre/bin/jjs \
         /jre/bin/keytool \
         /jre/bin/orbd \
         /jre/bin/pack200 \
         /jre/bin/policytool \
         /jre/bin/rmid \
         /jre/bin/rmiregistry \
         /jre/bin/servertool \
         /jre/bin/tnameserv \
         /jre/bin/unpack200 \
         /jre/bin/javaws \
         /jre/lib/plugin.jar \
         /jre/lib/javaws.jar \
         /jre/lib/desktop \
         /jre/lib/deploy* \
         /jre/lib/*javafx* \
         /jre/lib/*jfx* \
         /jre/lib/ext/jfxrt.jar \
         /jre/lib/ext/nashorn.jar \
         /jre/lib/jfr \
         /jre/lib/jfr.jar \
         /jre/lib/amd64/libdecora_sse.so \
         /jre/lib/amd64/libprism_*.so \
         /jre/lib/amd64/libfxplugins.so \
         /jre/lib/amd64/libglass.so \
         /jre/lib/amd64/libgstreamer-lite.so \
         /jre/lib/amd64/libjavafx*.so \
         /jre/lib/amd64/libjfx*.so \
         /jre/lib/oblique-fonts \
         /jre/plugin \
         /tmp/* && \
         echo 'networkaddress.cache.ttl = 60' >> /jre/lib/security/java.security

CMD ["sh"]
