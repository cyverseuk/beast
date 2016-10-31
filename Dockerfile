FROM ubuntu:16.04

MAINTAINER Erik van den Bergh, Earlham Institute, Norwich 

RUN apt update
RUN apt install -y vim wget openjdk-9-jre

WORKDIR /root

RUN wget https://github.com/beast-dev/beast-mcmc/releases/download/v1.8.3/BEASTv1.8.3.tgz
RUN tar -xvzf BEASTv1.8.3.tgz

RUN cp BEASTv1.8.3/bin/* /usr/local/bin
RUN cp BEASTv1.8.3/lib/* /usr/local/lib


COPY runbeast.sh /tmp/runbeast.sh
RUN chmod ugo+x /tmp/runbeast.sh

ENTRYPOINT ["/tmp/runbeast.sh"]
