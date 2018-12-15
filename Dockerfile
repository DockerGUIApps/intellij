FROM debian

LABEL maintainer "Sergei O. Udalov <sergei.udalov@gmail.com>"

RUN apt-get update && apt-get install --no-install-recommends -y \
  python software-properties-common git libxext-dev libxrender-dev \
  libxslt1.1 libxtst-dev libgtk2.0-0 libcanberra-gtk-module unzip wget \
  gcc git openssh-client curl  libfreetype6-dev libfontconfig1 openjdk-8-jdk \
  && rm -rf /var/lib/apt/lists/*

ARG intellij_source=https://download.jetbrains.com/idea/ideaIC-2018.3.1.tar.gz

WORKDIR /opt/intellij

RUN curl -fsSL $intellij_source -o /opt/intellij/installer.tgz && \
    echo 'Installing IntelliJ IDEA' && \
    tar -xf /opt/intellij/installer.tgz --strip-components=1 -C /opt/intellij && \
    rm /opt/intellij/installer.tgz

RUN apt update && apt install -y openjdk-8-jdk
RUN ln -sf /root/.Idea /root/.IdeaIC2018.3

CMD ["/opt/intellij/bin/idea.sh"]
