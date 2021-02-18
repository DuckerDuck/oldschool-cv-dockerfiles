FROM hulkinbrain/docker-opencv2

USER root
ADD http://lear.inrialpes.fr/people/wang/download/dense_trajectory_release_v1.2.tar.gz /dense.tar.gz
RUN mkdir -p /dense && tar -xf /dense.tar.gz -C /dense --strip-components=1

RUN apt-get update && \
    apt-get install -y \
    libavdevice-dev

WORKDIR /dense

RUN make

