FROM jenkins/jenkins:latest-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
#RUN jenkins-plugin-cli --plugins "blueocean:1.27.4 docker-workflow:563.vd5d2e5c4007f junit:1202.v79a_986785076 email-ext:2.97 ldap:682.v7b_544c9d1512 pipeline-stage-view:2.32 workflow-aggregator:596.v8c21c963d92d pipeline-rest-api:2.32 build-timeout:1.30 ansicolor:1.0.2"
RUN jenkins-plugin-cli --plugins "blueocean:1.27.4 docker-workflow:563.vd5d2e5c4007f junit:1202.v79a_986785076"

