FROM alpine
MAINTAINER Alexander Ustimenko "http://ustimen.co/"
EXPOSE 22

RUN \
  apk --no-cache add openssh && \
  ssh-keygen -A && \
  echo "root:root" | chpasswd

# Default config overrides
ENV SSHD_OPTION_PERMIT_ROOT_LOGIN yes
ENV SSHD_OPTION_USE_PAM no
ENV SSHD_OPTION_USE_DNS no

ENV SSHD_COMMAND_AFTER ""

# Allows us to read environment variables in CMD
ENTRYPOINT ["/bin/sh", "-c"]

# -D    not detach and does not become a daemon
# -e    send the output to the standard error instead of the system log
# -o    give options in the format used in the configuration file
CMD [ \
  "/usr/sbin/sshd \
    -D \
    -e \
    -o PermitRootLogin=$SSHD_OPTION_PERMIT_ROOT_LOGIN \
    -o UsePAM=$SSHD_OPTION_USE_PAM \
    -o UseDNS=$SSHD_OPTION_USE_DNS \
    $SSHD_COMMAND_AFTER" \
]
