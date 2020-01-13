FROM openjdk:8

RUN wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.2.4/flyway-commandline-5.2.4-linux-x64.tar.gz | tar xvz && \
    ln -s `pwd`/flyway-*/flyway /usr/local/bin && \
    wget -qO- https://github.com/schemalex/schemalex/releases/download/v0.1.1/schemalex_linux_amd64.tar.gz | tar xvz && \
    ln -s `pwd`/schemalex_linux_amd64/schemalex /usr/local/bin
