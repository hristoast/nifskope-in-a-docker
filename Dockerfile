FROM ubuntu:18.04

#
# This entire thread is a great reference on the topic of making X11 apps run in a docker:
# https://stackoverflow.com/a/25280523
#

RUN apt update && apt install -y --force-yes build-essential qt5-default git

RUN git clone --recursive https://github.com/niftools/nifskope.git

WORKDIR /nifskope

RUN qmake *.pro

RUN make -j$(grep -c ^processor /proc/cpuinfo)

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/nsuser && \
    echo "nsuser:x:${uid}:${gid}:Nsuser,,,:/home/nsuser:/bin/bash" >> /etc/passwd && \
    echo "nsuser:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/nsuser

USER nsuser

ENV DISPLAY :0
ENV HOME /home/nsuser

CMD [ "/nifskope/release/NifSkope" ]
