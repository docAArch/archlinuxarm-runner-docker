FROM docaarch/archlinuxarm-qemu-user-static:latest
ARG USERNAME="" \
    REPONAME="" \
    TOKEN="" \
    ARCH="arm64" \
    VERSION="2.283.3" \
    USER="alarm"

ENV USERNAME=${USERNAME} \
    REPONAME=${REPONAME} \
    TOKEN=${TOKEN} \
    ARCH=${ARCH} \
    VERSION=${VERSION} \
    USER=${USER}
USER alarm
WORKDIR /home/$USER
COPY ./files/* /home/$USER
RUN sudo chmod 755 ./runner.sh
VOLUME /home/$USER/actions-runner
CMD [ "sh","runner.sh" ]