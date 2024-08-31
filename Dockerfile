FROM fedora:latest
LABEL maintainer="Ron McMillian <ronmcmilli@outlook.com>"
# RUN dnf install git
RUN dnf install -y git cargo rust-libudev-devel tini
# RUN dnf install git rust cargo rust-libudev-devel
RUN git clone https://github.com/EightB1ts/uni-sync.git
COPY install.sh uni-sync/install.sh
RUN cd uni-sync/ && ./install.sh
# RUN ls
# COPY install.sh uni-sync/install.sh
# RUN bash unisync/install.sh

ENTRYPOINT ["tini","-s","--"]
# CMD ["/usr/bin/bash","-c","while sleep 1000; do :; done"]
CMD ["/usr/bin/bash","-c","/uni-sync/uni-sync","&&","/usr/bin/bash","-c","while sleep 1000; do :; done"]

# RUN cd uni-sync && 