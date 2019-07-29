FROM ubuntu:18.04

ENV JAVA_HOME       /usr/lib/jvm/java-8-openjdk-amd64
ENV LANG            en_US.UTF-8
ENV LC_ALL          en_US.UTF-8

RUN apt-get update && \
    apt-get install -y gnupg2 && \
    apt-get install -y --no-install-recommends locales && \
    locale-gen en_US.UTF-8 && \
    apt-get --purge remove openjdk* && \
    apt-get install -y openjdk-8-jre openjdk-8-jdk  && \
    apt-get install -y git vim && \
    apt-get install -y maven && \
    apt-get install -y gradle && \
    apt-get install -y sudo && \
    apt-get install -y curl && \
    apt-get clean all

WORKDIR /app

ENV IDEA_JDK /usr/lib/jvm/java-8-openjdk-amd64

USER root

ADD https://download-cf.jetbrains.com/idea/ideaIC-2019.1.tar.gz /opt/idea.tar.gz

RUN tar --extract --verbose --directory /opt --file /opt/idea.tar.gz && rm -rf /opt/idea-IC-191.6183.87/jre64 && rm -f /opt/idea.tar.gz

RUN useradd -ms /bin/bash intellij && echo "intellij:intellij" | chpasswd && adduser intellij sudo 

USER intellij

WORKDIR /home/intellij

ENTRYPOINT ["/opt/idea-IC-191.6183.87/bin/idea.sh"]
